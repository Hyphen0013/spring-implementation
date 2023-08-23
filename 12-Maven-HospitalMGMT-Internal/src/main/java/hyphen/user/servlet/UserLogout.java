package hyphen.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.entity.Student;

@WebServlet("/user_logout")
public class UserLogout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Student student =  (Student) session.getAttribute("userObj");
		
		if(student != null) {
			session.setAttribute("successMsg", student.getName() + " Logout Sucessfully");
		} else {
			session.setAttribute("successMsg", "User Logout Sucessfully");
		}
		
		
		session.removeAttribute("userObj");
		resp.sendRedirect("user_login.jsp");
	}
}
