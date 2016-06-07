<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Pertemuan 3</title>
<style>
	body {
		font-family: sans-serif;
	}
	div {
		margin: 5px 0;
	}
	input {
		padding: 5px;
		border-radius: 4px;
	}
	.center{
		margin: auto;
		width: 25%;
		text-align: center;
	}
</style>
</head>

<body>

	<h1 style="font-style: oblique; text-align: center;">Bitter</h1>
	<p style="font-style: italic; text-align: center;">"Life bitterness in 140 characters or less"</p>

	<form method="post" action="controller/doSignup.jsp">
   			<fieldset class="center">
   				<legend><h2 style="font-style: italic;"><a href="index.jsp" style="text-decoration: none; color: #3B84FF;">Log In</a> <a style="color: gray;">or</a> Sign Up</h2></legend>
   				<div>
        			<input type="text" name="username" placeholder="Username" required="true" />
        		</div>
        		<div>
        			<input type="password" name="password" placeholder="Password" required="true" />
        		</div>
        		<div>
        			<input type="text" name="fullname" placeholder="Full Name" required="true" />
        		</div>
        		<div>
        			<p style="font-style: italic;">Birthdate:</p>
        			<input type="date" name="birthdate" required="true" />
        		</div>
        		<div>
        			<input type="submit" value="Register" />
				</div>
			</fieldset>
	</form>
</body>
</html>
