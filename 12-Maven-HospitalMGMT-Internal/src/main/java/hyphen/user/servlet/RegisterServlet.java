package hyphen.user.servlet;

import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

@WebServlet("/student_register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		
		Student stud = new Student(name, email, password, createdAt);
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean check = dao.studentRegister(stud);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Resgirstration sucessfully!");
			resp.sendRedirect("signup.jsp");
		} else {
			session.setAttribute("errorMsg", "Resgirstration failed!");
			resp.sendRedirect("signup.jsp");
		}
	}
}
