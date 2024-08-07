<%@page import="dv.webapp.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dv.webapp.connection.DBConnect"%>
<%@page import="dv.webapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%User ok = (User)request.getSession().getAttribute("ok");
	if(ok != null){
		request.getSession().setAttribute("ok", ok);
		
	}
	ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cart-list");
	if(cartList != null){
		request.setAttribute("cart_list", cartList);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/header.jsp"%>
</head>
<body>

	<%@include file="includes/topbar.jsp" %>
	<%@include file="includes/footer.jsp"%>
</body>
</html>