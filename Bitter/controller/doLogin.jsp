<%@ include file = "connect.jsp" %>
<%
	if(session.getAttribute("userSession") != null){
		response.sendRedirect("../home.jsp");
	}else{
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberme = request.getParameter("rememberme");

		if(rememberme != null){
				Cookie cookieObject = new Cookie("userCookie", username);

				cookieObject.setMaxAge(60 * 60 * 24);
				cookieObject.setPath("/");
				response.addCookie(cookieObject);
			}
	
		String query = "SELECT * FROM user WHERE username = '"+username+"' AND password = '"+password+"'";
	
		ResultSet rs = st.executeQuery(query);
	
		if(rs.next()){
			session.setAttribute("userSession", username);
			session.setAttribute("userID", rs.getString("userID"));
			session.setAttribute("notification", "Successfully Logged In");
		
			if(application.getAttribute("onlineUser") == null || (Integer) application.getAttribute("onlineUser") == 0){
				application.setAttribute("onlineUser", 1);
			}else{
				//tipenya Object, harus typecast ke Integer
				int online = (Integer) application.getAttribute("onlineUser");
				online++;
				application.setAttribute("onlineUser", online);
			}
		
			response.sendRedirect("../home.jsp");
	}else{
			response.sendRedirect("../index.jsp");
		}
	}
%>