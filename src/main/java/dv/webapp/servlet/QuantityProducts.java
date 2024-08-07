package dv.webapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dv.webapp.model.Cart;

/**
 * Servlet implementation class QuantityProducts
 */
@WebServlet("/quantity-control")
public class QuantityProducts extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String para = request.getParameter("para");
			int id = Integer.parseInt(request.getParameter("id"));
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(para != null && id >1) {
				if(para.equals("cong")) {
					for(Cart c:cart_list) {
						if (c.getId() == id) {
							int quantity = c.getQuantity();
							quantity++;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
					}
				}
			}
			
			if(para != null && id >1) {
				if(para.equals("tru")) {
					for(Cart c:cart_list) {
						if (c.getId() == id && c.getQuantity() > 1) {
							int quantity = c.getQuantity();
							quantity--;
							c.setQuantity(quantity);
							response.sendRedirect("cart.jsp");
						}
						else if(id!= 0){ 
							if (cart_list != null) {
								for(Cart cc:cart_list) {
									if(cc.getId() == id) {
										cart_list.remove(cart_list.indexOf(c));
										break;
									
									}
								}
							}
						}
						response.sendRedirect("cart.jsp");
					}
				}
			}
			else {
				response.sendRedirect("cart.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	private void elseif(boolean b) {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
