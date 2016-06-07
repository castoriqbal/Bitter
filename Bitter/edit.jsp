<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Edit</title>
</head>

<body>
	<%@ include file = "header.jsp" %>
	<%@ include file = "controller/connect.jsp" %>
 
	<%
		if(session.getAttribute("userSession") == null){
			response.sendRedirect("index.jsp");
		}else{
			int id = Integer.parseInt(request.getParameter("id"));
			String query = "SELECT * FROM bitterness WHERE bitternessID = "+id;
			ResultSet rs = st.executeQuery(query);
			rs.next();
	%>

	<div>
	<form action="controller/doEdit.jsp" id="bitternessForm" method="POST">
			<fieldset class="center">
			<legend><h2 style="font-style: italic;">Bitterness Edit</h2></legend>
			<textarea rows="4" cols="35" name="message" form="bitternessForm" maxlength="140" placeholder="Say what's on your mind...i bet it's full of anguish and grief" style="resize: none; font-size: 0.45cm; height: 2.5cm;"><%=rs.getString("message")%></textarea><br>
			<input type="hidden" name="id" value="<%=id%>" />
			<input type="submit" value="Update" />
			</fieldset>
	</form>
	</div>

	<%
	}
	%>
</body>
</html>
