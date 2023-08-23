package hyphen.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.entity.Doctor;

@WebServlet("/doctor_logout")
public class DoctorLogout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Doctor doctor =  (Doctor) session.getAttribute("doctorObj");
		
		if(doctor != null) {
			session.setAttribute("successMsg", doctor.getName() + " Logout Sucessfully");
		} else {
			session.setAttribute("successMsg", "Doctor Logout Sucessfully");
		}
		session.removeAttribute("doctorObj");
		resp.sendRedirect("doctor_login.jsp");
	}
}
