<%@ include file = "connect.jsp" %>

<%
	String userID = request.getParameter("userID");
	String fullname = request.getParameter("fullname");
	String password = request.getParameter("password");
	String birthdate = request.getParameter("birthdate");

	String query = "UPDATE user SET fullname = '"+fullname+"', password = '"+password+"', birthdate='"+birthdate+"' WHERE userID = "+userID;
	st.executeUpdate(query);

	String redirect = "../profile.jsp?userID="+userID+"";
	response.sendRedirect(redirect);
%>