<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pertemuan 4</title>
</head>

<body>
<%@ include file = "controller/connect.jsp" %>
<%@ include file = "header.jsp" %>

<%
	if(session.getAttribute("userSession") == null){
		response.sendRedirect("index.jsp");
	}
%>   
    <%
    	String searchtext = request.getParameter("searchtext");
    	String at = Character.toString(searchtext.charAt(0));

    	if(at.equals("@")){
    		String query = "SELECT * FROM user WHERE username LIKE '%"+searchtext.substring(1)+"%'";
			ResultSet rs = st.executeQuery(query);
	
			while(rs.next()){
	%>
				<form style="display: inline-block; width: 33%;">
					<fieldset>
						<legend><a href="profile.jsp?userID=<%=rs.getString("userID")%>"><%=rs.getString("username")%></a></legend>
						<p><%=rs.getString("fullname")%></p>
						<p><%=rs.getString("birthdate")%></p>
					</fieldset>
				</form>
    <%		
    		}		
		}else{
			String query = "SELECT bitterness.`bitternessID`, bitterness.`userID`, bitterness.`message`, user.`username`, bitterness.`time` FROM `bitterness` INNER JOIN `user` ON bitterness.`userID` = user.`userID` WHERE bitterness.`message` LIKE '%"+searchtext+"%' ORDER BY `time` DESC";
			ResultSet rs = st.executeQuery(query);
			String userID = (String) session.getAttribute("userID");

			while(rs.next()){
	%>		
				<div style="border: dotted;margin: 10px; padding: 10px; display: inline-block; width: 28%; height: 6cm; overflow: hidden;">
					<p><a href="profile.jsp?userID=<%=rs.getString("userID")%>"><%=rs.getString("username")%></a></p>
					<p>on <%=rs.getString("time")%></p>
					<p style="word-wrap: break-word; height: 2cm; overflow: hidden;"><%=rs.getString("message")%></p>
					<p>
						<%
							if(rs.getString("userID").equals(userID)){
						%>
							<button type="button" name="edit"><a href="edit.jsp?id=<%=rs.getString("bitternessID")%>" class="a">Edit</a></button>
							<button type="button" name="delete"><a href="controller/doDelete.jsp?id=<%=rs.getString("bitternessID")%>" class="a">Delete</a></button>
						<%
							}
						%>
					</p>
				</div>	
	<%		
			}
		}
	%>

</body>
</html>
