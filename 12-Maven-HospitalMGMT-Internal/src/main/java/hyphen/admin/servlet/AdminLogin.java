package hyphen.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.entity.Student;

@WebServlet("/admin_login")
public class AdminLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		if("admin@gmail.com".equals(email) && "admin".equals(password)) {
			session.setAttribute("adminObj", new Student());
			session.setAttribute("successMsg", "Admin Login Successfully");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Invalid credentials");
			resp.sendRedirect("admin_login.jsp");			
		}
	}
}
