package hyphen.servlet;

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

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String level = req.getParameter("level");
		String email = req.getParameter("email");
		String dob = req.getParameter("dob");
		
		String password = "123456";
		
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		Date updatedAt = null;
		Student stud = new Student(name, level, email, password, dob, createdAt, updatedAt);
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean check = dao.addStudent(stud);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Resgirstration sucessfully!");
			resp.sendRedirect("add_student.jsp");
		} else {
			session.setAttribute("errorMsg", "Resgirstration failed!");
			resp.sendRedirect("add_student.jsp");
		}
	}
	

}
