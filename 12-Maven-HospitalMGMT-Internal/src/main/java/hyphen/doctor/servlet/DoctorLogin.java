package hyphen.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.DoctorDao;
import hyphen.entity.Doctor;

@WebServlet("/doctor_login")
public class DoctorLogin extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		HttpSession session = req.getSession();
		
		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		Doctor doctor = dao.login(email, password);
		
		if(doctor != null) {
			if(doctor.getEmail().equals(email) && doctor.getPassword().equals(password)) {
				session.setAttribute("doctorObj", doctor);
				session.setAttribute("successMsg", doctor.getName() + " Login Successfully");
				resp.sendRedirect("doctor/index.jsp");	
			} else {
				session.setAttribute("errorMsg", "Invalid credentials");
				resp.sendRedirect("doctor_login.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Invalid credentials");
			resp.sendRedirect("doctor_login.jsp");			
		}
	}
}
