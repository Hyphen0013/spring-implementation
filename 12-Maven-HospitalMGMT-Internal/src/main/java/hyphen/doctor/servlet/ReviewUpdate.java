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
import hyphen.dao.AppointmentDAO;
import hyphen.entity.Appointment;

@WebServlet("/review_doctor_appointment")
public class ReviewUpdate extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String appon_status = req.getParameter("appon_status");
		int appon_id = Integer.parseInt(req.getParameter("appon_id"));
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		
		Calendar calendar = Calendar.getInstance();
		Date status_updateAt = new Date(calendar.getTime().getTime());
		
		Appointment appon = new Appointment();
		
		appon.setAppon_status(appon_status);
		appon.setAppon_id(appon_id);
		appon.setDoc_id(doc_id);
		appon.setStatus_updateAt(status_updateAt);
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConnection()); 
		boolean check = dao.updateReviewStatusByDoc(appon);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Review added successfully");
			resp.sendRedirect("doctor/patient.jsp");
		} else {
			session.setAttribute("errorMsg", "Review added failed!");
			resp.sendRedirect("doctor/patient.jsp");
		}		
	}
}
