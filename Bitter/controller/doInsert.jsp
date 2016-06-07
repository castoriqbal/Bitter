<%@ include file = "connect.jsp" %>

<%
	String userID = (String) session.getAttribute("userID");
	String message = request.getParameter("message");
	
	String query = "INSERT INTO bitterness VALUES (null,?,?,now())";
	pst = con.prepareStatement(query);
	pst.setString(1, userID);
	pst.setString(2, message);
	pst.executeUpdate();

	response.sendRedirect("../home.jsp");
%>