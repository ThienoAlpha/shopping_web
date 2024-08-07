package dv.webapp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dv.webapp.connection.DBConnect;
import dv.webapp.dao.UserDAO;
import dv.webapp.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("Text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			String email = request.getParameter("Login-email");
			String password = request.getParameter("login-passwords");
			UserDAO uDao = new UserDAO(DBConnect.getConnection());
			User user = uDao.userLogin(email, password);

			if (user != null) {
				request.getSession().setAttribute("ok", user);
				response.sendRedirect("index.jsp");
			} else {
				out.print("Login fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
