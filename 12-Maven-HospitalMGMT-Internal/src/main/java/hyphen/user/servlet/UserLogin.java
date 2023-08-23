package hyphen.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

@WebServlet("/user_login")
public class UserLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		Student student = dao.login(email, password);
		
		if(student != null) {
			if(student.getEmail().equals(email) && student.getPassword().equals(password)) {
				session.setAttribute("userObj", student);
				session.setAttribute("successMsg", student.getName() + " Login Successfully");
				resp.sendRedirect("index.jsp");	
			} else {
				session.setAttribute("errorMsg", "Invalid credentials");
				resp.sendRedirect("user_login.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Invalid credentials");
			resp.sendRedirect("user_login.jsp");			
		}
	}
	
}
