package hyphen.admin.servlet;

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
import hyphen.dao.DoctorDao;
import hyphen.dao.SpecalistDao;
import hyphen.entity.Doctor;
import hyphen.entity.Specalist;

@WebServlet("/add_doctor")
public class AddDoctor extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String password = req.getParameter("password");
		String dob = req.getParameter("dob");
		String mobno = req.getParameter("mobno");
		
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		
		Doctor doc = new Doctor(name, email, qualification, specialist, password, dob, mobno, createdAt);
		
		DoctorDao doa = new DoctorDao(DBConnect.getConnection());
		boolean check = doa.registerDoctor(doc);

		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Doctor Added Successfully!");
			resp.sendRedirect("admin/doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "Doctor Not Added!");
			resp.sendRedirect("admin/doctor.jsp");
		}		
	}
}
