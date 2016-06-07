<%@ page import="java.sql.*" %>
<%
	//driver, butuh diinstall
	//mysql connector formatnya .jar
	//directory xampp\tomcat\lib
	Class.forName("com.mysql.jdbc.Driver");
	
	//butuh java.sql
	//jdbc:mysql://localhost:3306/nama_database
	//username
	//password
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bitter", "root", "baskerville");
	
	//kirim query ke jdbc
	Statement st = con.createStatement();
	PreparedStatement pst = null;
%>