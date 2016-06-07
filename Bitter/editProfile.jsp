<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
<%@ include file = "controller/connect.jsp" %>
<%@ include file = "header.jsp" %>

<%
	String userID = request.getParameter("userID");

	if(!userID.equals((String) session.getAttribute("userID"))){
	 response.sendRedirect("home.jsp");
	}else{
		String query = "SELECT * FROM user WHERE userID = "+userID;
		ResultSet rs = st.executeQuery(query);
		rs.next();
%>
	<form method="post" action="controller/doEditProfile.jsp?userID=<%=userID%>">
   			<fieldset class="center">
   				<legend><h2 style="font-style: italic;">Profile Settings</h2></legend>
        			<p style="font-style: italic;">Full Name: <input type="text" name="fullname" value="<%=rs.getString("fullname")%>" required="true" /></p>
        			<p style="font-style: italic;">Password: <input type="password" name="password" value="<%=rs.getString("password")%>" required="true" /></p>
        			<p style="font-style: italic;">Birthdate: <input type="date" name="birthdate" value="<%=rs.getString("birthdate")%>" required="true" /></p>
        			<input type="submit" value="Save" />
			</fieldset>
	</form>
<%
	}
%>

</body>
</html>
