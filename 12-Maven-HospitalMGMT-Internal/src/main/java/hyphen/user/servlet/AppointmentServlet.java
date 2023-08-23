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
import hyphen.dao.AppointmentDAO;
import hyphen.entity.Appointment;

@WebServlet("/add_user_appointment")
public class AppointmentServlet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String name = req.getParameter("name");
		String gender = req.getParameter("gender");
		int age = Integer.parseInt(req.getParameter("age"));	
		String appon_date = req.getParameter("appon_date");	
		String email = req.getParameter("email");	
		String mobno = req.getParameter("mobno");	
		String disease = req.getParameter("disease");	
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));	
		String survey_recom = req.getParameter("survey_recom");	
		
		String apponInfo = "";
		String appon_info[] = req.getParameterValues("appon_info");	
		
		String appon_status = "Pending";	
		
		String address = req.getParameter("address");
		String comments = req.getParameter("comments");
		
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		
		for(int i = 0; i < appon_info.length; i++) {
			apponInfo += appon_info[i] + ",";
		}
		apponInfo = apponInfo.substring(0, apponInfo.length() - 1);
		
		Appointment appon = new Appointment();
		
		appon.setUserId(userId);
		appon.setName(name);
		appon.setGender(gender);
		appon.setAge(age);
		appon.setAppon_date(appon_date);
		appon.setEmail(email);
		appon.setMobno(mobno);
		appon.setDisease(disease);
		appon.setDoc_id(doc_id);
		appon.setSurvey_recom(survey_recom);
		appon.setAppon_info(apponInfo);
		appon.setAppon_status(appon_status);
		appon.setAddress(address);
		appon.setComments(comments);
		appon.setCreated_at(createdAt);
		
		AppointmentDAO dao = new AppointmentDAO(DBConnect.getConnection()); 
		boolean check = dao.addAppointment(appon);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Appointment set to the doctor");
			resp.sendRedirect("user_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Appointment failed!");
			resp.sendRedirect("user_appointment.jsp");
		}			
	}
}
