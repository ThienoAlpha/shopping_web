<%@page import="dv.webapp.connection.DBConnect"%>
<%@page import="dv.webapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%User ok = (User)request.getSession().getAttribute("ok");
	if(ok != null){
		request.getSession().setAttribute("ok", ok);
		response.sendRedirect("index.jsp");
	}else{}
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
	<div class="container">
		<div class="card w-50mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">

					<div class="form-group">
						<label>Email Address</label> <input type="email"
							class="form-control" name="Login-email"
							placeholder="Enter Your Email" required>
					</div>
					<div class="form-group">
						<label>Password</label> <input type="password"
							class="form-control" name="login-passwords"
							placeholder="**********" required>
					</div>

					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
						<button type="submit" class="btn btn-primary">Resigter</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
</body>
</html>