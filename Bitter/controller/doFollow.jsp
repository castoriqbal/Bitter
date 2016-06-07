<%@ include file = "connect.jsp" %>

<%
	String userID1 = (String) session.getAttribute("userID");
	String userID2 = request.getParameter("userID");

	String query = "INSERT INTO follower VALUES (null, '"+userID1+"', '"+userID2+"')";
	st.executeUpdate(query);


	String redirect = "../profile.jsp?userID="+userID2+"";
	response.sendRedirect(redirect);
%>