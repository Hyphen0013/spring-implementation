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
import hyphen.entity.Doctor;

@WebServlet("/update_doctor")
public class UpdateDoctor extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String password = req.getParameter("password");
		String dob = req.getParameter("dob");
		String mobno = req.getParameter("mobno");
		int id = Integer.parseInt(req.getParameter("id"));
		
		Calendar calendar = Calendar.getInstance();
		Date updatedAt = new Date(calendar.getTime().getTime());
		
		Doctor doc = new Doctor();
		
		doc.setName(name);
		doc.setEmail(email);
		doc.setQualification(qualification);
		doc.setSpecialist(specialist);
		doc.setPassword(password);
		doc.setDob(dob);
		doc.setMobno(mobno);
		doc.setDoc_id(id);
		
		DoctorDao doa = new DoctorDao(DBConnect.getConnection());
		boolean check = doa.editDoctor(doc);

		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Doctor Updated Successfully!");
			resp.sendRedirect("admin/doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "Doctor Not Updated!");
			resp.sendRedirect("admin/doctor.jsp");
		}		
	}
}