<%@page import="java.util.List"%>
<%@page import="dv.webapp.dao.ProductDAO"%>
<%@page import="dv.webapp.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dv.webapp.connection.DBConnect"%>
<%@page import="dv.webapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User ok = (User) request.getSession().getAttribute("ok");
if (ok != null) {
	request.getSession().setAttribute("ok", ok);
}

ArrayList<Cart> cartList = (ArrayList<Cart>)session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cartList != null){
	ProductDAO product = new ProductDAO(DBConnect.getConnection());
	cartProduct = product.getCartProducts(cartList);
	Double sum = product.getTotalCartPrice(cartList);
	request.setAttribute("cart_list", cartList);
	request.setAttribute("total", sum);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>GioHang</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
<%@include file="includes/topbar.jsp" %>

	<div class="container">
		<div class="d-flex py-3">
			<h3>
				Total Price: $
				<%=request.getAttribute("total") %></h3>
			<a class="mx-3 btn btn-primary" href="#">Check Out</a>
		</div>
		<table class="table table-loght">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
			if(cartList != null){
				for(Cart c:cartProduct){
			%>
				<tr>
					<td><%=c.getName() %></td>
					<td><%=c.getCategory() %></td>
					<td><%=c.getPrice() %>$</td>
					<td><form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId() %>" class="form-input">
							<div class="form-group d-flex justify-content-between">
								<a class="btn btn-sm btn-incre"
									href="quantity-control?para=cong&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a> <input type="text"
									name="quantity" class="form-control"
									value="<%=c.getQuantity() %>" readonly> <a
									class="btn btn-sm btn-decre" href="quantity-control?para=tru&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a>
							</div>
							<button type="submit"  class="btn btn-primary btn-sm" >Buy now</button>
						</form></td>
					<td><a class="btn btn-sm btn-danger" href="RemoveFromCart?id=<%= c.getId()%>">Remove</a></td>
				</tr>
				<%	}
			} %>
			</tbody>
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>