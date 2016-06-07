<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Home</title>
</head>

<body>
<%@ include file = "controller/connect.jsp" %>
<%@ include file = "header.jsp" %>

<div>
	<p>
	<%
		if(session.getAttribute("userSession") == null){
			response.sendRedirect("index.jsp");
		}else{
			out.print(session.getAttribute("notification"));
			out.print(", Welcome ");
			out.print(session.getAttribute("userSession"));
		}
	%>
	</p>
</div>

<div>
	<form action="controller/doInsert.jsp" id="bitternessForm" method="POST">
			<textarea rows="4" cols="35" name="message" form="bitternessForm" maxlength="140" placeholder="Say what's on your mind...i bet it's full of anguish and grief" style="resize: none; font-size: 0.45cm; height: 2.5cm;"></textarea><br>
			<input type="submit" value="Lament" />
	</form>
</div>

<div>
	<%
		int startData = 0;
		int perPage = 5;

		if(request.getParameter("page") != null)
		{
			int currentPage = Integer.parseInt(request.getParameter("page"));
			startData = (currentPage - 1) * perPage;
		}

		String userID = (String) session.getAttribute("userID");
		//query untuk menampilkan bitterness dari kita dan semua orang yang kita follow
		String query = "SELECT bitterness.`bitternessID`, bitterness.`userID`, bitterness.`message`, user.`username`, bitterness.`time` FROM `bitterness` INNER JOIN `user` ON bitterness.`userID` = user.`userID` WHERE bitterness.`userID` IN (SELECT  `userID2` FROM  `follower` WHERE  `userID1` = '"+userID+"')  ORDER BY `time` DESC LIMIT "+startData+","+perPage;
		ResultSet rs = st.executeQuery(query);

		while(rs.next()){
	%>
	
			<br>
			<div style="border-bottom: ridge; border-top: ridge; width: 10.6cm;">
				<p><a href="profile.jsp?userID=<%=rs.getString("userID")%>"><%=rs.getString("username")%></a></p>
				<p style="word-wrap: break-word;"><%=rs.getString("message")%></p>
				<p>on <%=rs.getString("time")%></p>
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
	%>
</div>

<div class="center">
<h3>
	Pages:
<%
	query = "SELECT bitterness.`bitternessID`, bitterness.`userID`, bitterness.`message`, user.`username`, bitterness.`time` FROM `bitterness` INNER JOIN `user` ON bitterness.`userID` = user.`userID` WHERE bitterness.`userID` IN (SELECT  `userID2` FROM  `follower` WHERE  `userID1` = '"+userID+"')  ORDER BY `time` DESC";
	rs = st.executeQuery(query);

	int totaldata = 0;
	rs.last();
	totaldata = rs.getRow();
	rs.beforeFirst();
	
	int totalpage = (int)Math.ceil(totaldata/(double)perPage);
	
	for(int x = 1; x <= totalpage ; x++)
	{
%>
		<a href="home.jsp?page=<%=x%>"><%=x%></a>
<%		
	}
%>
</h3>
</div>

</body>
</html>
