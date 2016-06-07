<%@ include file = "connect.jsp" %>

<%
	String userID1 = (String) session.getAttribute("userID");
	String userID2 = request.getParameter("userID");

	String query = "DELETE FROM follower WHERE userID1 = '"+userID1+"' AND userID2 = '"+userID2+"' ";
	st.executeUpdate(query);


	String redirect = "../profile.jsp?userID="+userID2+"";
	response.sendRedirect(redirect);
%>