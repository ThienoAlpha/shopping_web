<%@page import="dv.webapp.model.Product"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dv.webapp.connection.DBConnect"%>
<%@page import="dv.webapp.dao.ProductDAO"%>

<% ProductDAO productDAO = new ProductDAO(DBConnect.getConnection());
	NumberFormat nf = NumberFormat.getInstance();
	nf.setMinimumIntegerDigits(0);
	%>

					<% for(Product pr: productDAO.getProductbyCategory(request.getParameter("category"))){
					%>
					<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
						<div class="card product-item border-0 mb-4">
							<div
								class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<img class="img-fluid w-100" style="height:300px; width:300px" src="<%=pr.getImage()%>" alt="">
							</div>
							<div
								class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3"><%=pr.getName()%></h6>
								<div class="d-flex justify-content-center">
									<h6><%=pr.getPrice()%></h6>
									<h6 class="text-muted ml-2">
										<del><%=pr.getPrice()%></del>
									</h6>
								</div>
							</div>
							<div
								class="card-footer d-flex justify-content-between bg-light border">
								<a href="" class="btn btn-sm text-dark p-0"><i
									class="fas fa-eye text-primary mr-1"></i>View Detail</a> <a href="add-to-cart?id=<%=pr.getId() %>"
									class="btn btn-sm text-dark p-0"><i
									class="fas fa-shopping-cart text-primary mr-1"></i>Add To Cart</a>
							</div>
						</div>
					</div>
					<%} %>
					
					