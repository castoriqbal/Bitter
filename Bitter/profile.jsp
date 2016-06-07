<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Profile</title>
</head>

<body>
<%@ include file = "controller/connect.jsp" %>
<%@ include file = "header.jsp" %>

<%
	if(session.getAttribute("userSession") == null){
			response.sendRedirect("index.jsp");
	}else if(request.getParameter("userID") == null){
			String redirect = "profile.jsp?userID="+(String) session.getAttribute("userID")+"";
			response.sendRedirect(redirect);
	}else{
		String userID = request.getParameter("userID");

		ResultSet rsfollowcount = st.executeQuery("SELECT * FROM follower WHERE userID1 = "+userID);
		rsfollowcount.last();
		int following = rsfollowcount.getRow();
		//karena awal-awal follow diri sendiri jadi kurang 1
		following--;
		rsfollowcount = st.executeQuery("SELECT * FROM follower WHERE userID2 = "+userID);
		rsfollowcount.last();
		int follower = rsfollowcount.getRow();
		follower--;

		String query = "SELECT * FROM user WHERE userID = "+userID;
		ResultSet rs = st.executeQuery(query);
		rs.next();
%>
	
	<div>
		<form>
   			<fieldset class="center">
   				<legend><h2 style="font-style: italic;">Profile</h2></legend>
        		<p><%=rs.getString("username")%></p>
        		<p>Full Name: <%=rs.getString("fullname")%></p>
				<p>Birthdate: <%=rs.getString("birthdate")%></p>
				<p>Following: <%=following%> / Followers: <%=follower%></p>
			<%
				if(rs.getString("userID").equals((String) session.getAttribute("userID"))){
			%>
					<p><button type="button" name="editprofile"><a class="a" href="editProfile.jsp?userID=<%=session.getAttribute("userID")%>">Edit Profile</a></button></p>
			<%
				}else{
					query = "SELECT * FROM follower WHERE userID1 = '"+(String) session.getAttribute("userID")+"' AND userID2 = '"+userID+"' ";
					rs = st.executeQuery(query);
					if(rs.next()){
			%>
						<button><a href="controller/doUnfollow.jsp?userID=<%=userID%>" class="a">Unfollow</a></button>
			<%
					}else{
			%>
						<button><a href="controller/doFollow.jsp?userID=<%=userID%>" class="a">Follow</a></button>
			<%
					}
				}
			%>
			</fieldset>
		</form>
	</div>

<%
		query = "SELECT bitterness.`bitternessID`, bitterness.`userID`, bitterness.`message`, user.`username`, bitterness.`time` FROM `bitterness` INNER JOIN `user` ON bitterness.`userID` = user.`userID` WHERE bitterness.`userID` = '"+userID+"' ORDER BY `time` DESC";
		rs = st.executeQuery(query);

		while(rs.next()){

%>

		<br>
			<div style="border-bottom: ridge; border-top: ridge; width: 10.6cm;">
				<p><a href=""><%=rs.getString("username")%></a></p>
				<p style="word-wrap: break-word;"><%=rs.getString("message")%></p>
				<p>on <%=rs.getString("time")%></p>
				<p>
					<%
						if(rs.getString("userID").equals((String) session.getAttribute("userID"))){
					%>
						<button type="button" name="edit"><a href="edit.jsp?id=<%=rs.getString("bitternessID")%>" class="a">Edit</a></button>
						<button type="button" name="delete"><a href="controller/doDelete.jsp?id=<%=rs.getString("bitternessID")%>" class="a">Delete</a></button>
					<%
						}
					%>
				</p>
			</div>		

<%		}
	}
%>	

</body>
</html>
