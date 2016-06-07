<%@ include file = "connect.jsp" %>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	String message = request.getParameter("message");

	String query = "UPDATE bitterness SET message = ? WHERE bitternessID = ?";
	pst = con.prepareStatement(query);
	pst.setString(1, message);
	pst.setInt(2, id);
	pst.executeUpdate();

	response.sendRedirect("../home.jsp");
%>