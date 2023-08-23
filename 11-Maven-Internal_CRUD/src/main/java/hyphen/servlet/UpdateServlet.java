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
import hyphen.helper.HelperFunction;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String level = req.getParameter("level");
		String email = req.getParameter("email");
		String dob = req.getParameter("dob");
		int id = Integer.parseInt(req.getParameter("id"));
		
		Calendar calendar = Calendar.getInstance();
		Date updatedAt = new Date(calendar.getTime().getTime());
		
		Student stud = new Student(id, name, level, email, HelperFunction.formateDateFirstYear(dob, "-"), updatedAt);
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean check = dao.editStudent(stud);	
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Data updated sucessfully!");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("errorMsg", "Updation failed!");
			resp.sendRedirect("index.jsp");
		}		
	}

}
