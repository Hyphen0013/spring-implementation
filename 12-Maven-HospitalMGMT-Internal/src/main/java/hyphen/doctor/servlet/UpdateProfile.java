package hyphen.doctor.servlet;

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

@WebServlet("/edit_doc_profile")
public class UpdateProfile extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String qualification = req.getParameter("qualification");
		String specialist = req.getParameter("specialist");
		String dob = req.getParameter("dob");
		String mobno = req.getParameter("mobno");
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		
		
		Calendar calendar = Calendar.getInstance();
		Date updatedAt = new Date(calendar.getTime().getTime());
		
		Doctor doc = new Doctor();
		
		doc.setName(name);
		doc.setEmail(email);
		doc.setQualification(qualification);
		doc.setSpecialist(specialist);
		doc.setDob(dob);
		doc.setMobno(mobno);
		doc.setUpdated_at(updatedAt);
		doc.setDoc_id(doc_id);
		
		DoctorDao doa = new DoctorDao(DBConnect.getConnection());
		boolean check = doa.editDoctor(doc);

		
		HttpSession session = req.getSession();
		if(check) {
			session.removeAttribute("doctorObj");
			session.setAttribute("successMsg", "Profile Updated Successfully!");
			
			session.setAttribute("doctorObj", doa.getDoctorById(doc_id));
			resp.sendRedirect("doctor/edit_profile.jsp");	
		} else {
			session.setAttribute("errorMsg", "Profile Not Updated!");
			resp.sendRedirect("doctor/edit_profile.jsp");	
		}		
	}
}
