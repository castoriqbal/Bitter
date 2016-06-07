<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Header</title>
<style>
	body {
		font-family: sans-serif;
	}
	.divheader{
		margin: 10px 0;
	}
	.a{
		color: black;
		text-decoration: none;
	}
	.center{
		margin: auto;
		width: 25%;
		text-align: center;
	}
	input {
		padding: 5px;
		border-radius: 4px;
	}
	.centerheader{
		margin: auto;
		width: 100%;
		text-align: center;
	}
</style>
</head>

<body> 

<div style="border-bottom: groove;" class="divheader">
	<table class="centerheader">
		<tr>
			<td><h3 style="font-style: oblique;">Bitter</h3></td>
			<td>
				<% out.print(application.getAttribute("onlineUser")); %> people are online
			</td>
			<td id="tanggal"></td>
			<td>
				<form action="search.jsp">
					<input type="text" id="search" name="searchtext" placeholder="Search bitterness or @user" />
					<input type="submit" value="Search" />
				</form>
			</td>
			<td><a href="controller/doLogout.jsp">Logout</a></td>
			<td><a href="home.jsp">Home</a></td>
			<td><a href="profile.jsp?userID=<%=session.getAttribute("userID")%>">Profile</a></td>
		</tr>
	</table>
</div>

<script type="text/javascript">
	var today = new Date();
	var day = today.getDate();
	var month = today.getMonth();
	month++;
	var year = today.getFullYear();

	document.getElementById("tanggal").innerHTML = day+"/"+month+"/"+year;
</script>

</body>
</html>
