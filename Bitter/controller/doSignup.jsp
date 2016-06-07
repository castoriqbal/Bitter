<%@ include file = "connect.jsp" %>

<%
	String fullname = request.getParameter("fullname");
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String birthdate = request.getParameter("birthdate");

	String query = "SELECT * FROM user WHERE username = '"+username+"'";
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		response.sendRedirect("../signup.jsp?notification=Username already exist");
	}else{
		String query2 = "INSERT INTO user VALUES (null, '"+fullname+"', '"+username+"', '"+password+"', '"+birthdate+"')";
		st.executeUpdate(query2);

		//yang pertama kali daftar, otomatis follow diri sendiri
		response.sendRedirect("doDefaultFollow.jsp?username='"+username+"'");
	}
%>