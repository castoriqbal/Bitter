<%@ include file = "connect.jsp" %>

<%
	String username = request.getParameter("username");
	String query = "SELECT * FROM user WHERE username = "+username;
	ResultSet rs = st.executeQuery(query);
	rs.next();

	String query2 = "INSERT INTO follower VALUES (null, '"+rs.getString("userID")+"', '"+rs.getString("userID")+"')";
	st.executeUpdate(query2);

	response.sendRedirect("../index.jsp");
%>