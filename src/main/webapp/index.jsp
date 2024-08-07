<%@page import="dv.webapp.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dv.webapp.model.Product"%>
<%@page import="java.sql.Connection"%>
<%@page import="dv.webapp.dao.ProductDAO"%>
<%@page import="dv.webapp.connection.DBConnect"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dv.webapp.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User ok = (User) request.getSession().getAttribute("ok");
if (ok != null) {
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
<title>Trang chu</title>
<%@include file="includes/header.jsp"%>
</head>
<body>
	<%@include file="includes/topbar.jsp" %>
	<%@include file="includes/navbar.jsp"%>
	
	<!-- Featured Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-check text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">Quality Product</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
					<h5 class="font-weight-semi-bold m-0">Free Shipping</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">14-Day Return</h5>
				</div>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
				<div class="d-flex align-items-center border mb-4"
					style="padding: 30px;">
					<h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
					<h5 class="font-weight-semi-bold m-0">24/7 Support</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- Featured End -->


	<!-- Categories Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-1.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Men's dresses</h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-2.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Women's dresses</h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-3.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Baby's dresses</h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-4.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Accerssories</h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-5.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Bags</h5>
				</div>
			</div>
			<div class="col-lg-4 col-md-6 pb-1">
				<div class="cat-item d-flex flex-column border mb-4"
					style="padding: 30px;">
					<p class="text-right">15 Products</p>
					<a href="" class="cat-img position-relative overflow-hidden mb-3">
						<img class="img-fluid" src="img/cat-6.jpg" alt="">
					</a>
					<h5 class="font-weight-semi-bold m-0">Shoes</h5>
				</div>
			</div>
		</div>
	</div>
	<!-- Categories End -->


	<!-- Offer Start -->
	<div class="container-fluid offer pt-5">
		<div class="row px-xl-5">
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-right text-white mb-2 py-5 px-5">
					<img src="img/offer-1.png" alt="">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">20% off the all
							order</h5>
						<h1 class="mb-4 font-weight-semi-bold">Spring Collection</h1>
						<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop
							Now</a>
					</div>
				</div>
			</div>
			<div class="col-md-6 pb-4">
				<div
					class="position-relative bg-secondary text-center text-md-left text-white mb-2 py-5 px-5">
					<img src="img/offer-2.png" alt="">
					<div class="position-relative" style="z-index: 1;">
						<h5 class="text-uppercase text-primary mb-3">20% off the all
							order</h5>
						<h1 class="mb-4 font-weight-semi-bold">Winter Collection</h1>
						<a href="" class="btn btn-outline-primary py-md-2 px-md-3">Shop
							Now</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Offer End -->
	
	<!-- Products Start -->

	<div class="container-fluid pt-5">
		<div class="text-center mb-4">
			<h2 class="section-title px-5">
				<span class="px-2">Trandy Products</span>
			</h2>
		</div>
		<div class="row px-xl-5 pb-3">
		<%@include file="includes/product.jsp" %>
		</div>
		</div>


	<%@include file="includes/footer.jsp"%>
	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main.js"></script>

</body>
</html>