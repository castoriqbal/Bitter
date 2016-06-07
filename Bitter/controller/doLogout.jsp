<%
	if(session.getAttribute("userSession") == null){
		response.sendRedirect("../index.jsp");
	}else{
		int online1 = (Integer) application.getAttribute("onlineUser");
		online1--;
		application.setAttribute("onlineUser", online1);
	
		session.invalidate();
	
		response.sendRedirect("../index.jsp");
	}
%>