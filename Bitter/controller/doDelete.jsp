<%@ include file = "connect.jsp" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));

	String query = "DELETE FROM bitterness WHERE bitternessID = "+id;
	st.executeUpdate(query);

	response.sendRedirect("../home.jsp");
%>