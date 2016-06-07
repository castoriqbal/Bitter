<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
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
<%
	if(session.getAttribute("userSession") != null){
		response.sendRedirect("home.jsp");
	}else{
		String userCookie = "";
		Cookie[] cookies = request.getCookies();
		for(int x = 0; x < cookies.length; x++){
			if(cookies[x].getName().equals("userCookie")){
			userCookie = cookies[x].getValue();
			}
		}
%>

	<h1 style="font-style: oblique; text-align: center;">Bitter</h1>
	<p style="font-style: italic; text-align: center;">"Life bitterness in 140 characters or less"</p>

	<form method="post" action="controller/doLogin.jsp">
   			<fieldset class="center">
   				<legend><h2 style="font-style: italic;">Log in <a style="color: gray;">or</a> <a href="signup.jsp" style="text-decoration: none; color: #3B84FF;">Sign up</a></h2></legend>
   				<div>
        			<input type="text" name="username" value="<%=userCookie%>" placeholder="Username" required="true" />
        		</div>
        		<div>
        			<input type="password" name="password" placeholder="Password" required="true" />
        		</div>
        		<div>
        			<input type="checkbox" name="rememberme" value="true" />Remember Me </br>
        		</div>
        		<div>
        			<input type="submit" value="Login" />
				</div>
			</fieldset>
	</form>

<%		
	}
%>

</body>
</html> 
