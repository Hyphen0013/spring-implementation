package hyphen.doctor.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.DoctorDao;

@WebServlet("/update_doc_password")
public class UpdatePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int doc_id = Integer.parseInt(req.getParameter("doc_id"));
		String old_password = req.getParameter("old_password");
		String password = req.getParameter("password");
		String confirm_pass = req.getParameter("confirm_pass");
		String email = req.getParameter("email");
		
		HttpSession session = req.getSession();
		
		if(!password.equals(confirm_pass)) {
			session.setAttribute("successMsg", "New password and Confirm password not matched!");
			resp.sendRedirect("doctor/edit_profile.jsp");
			return;
		}
		
		DoctorDao dao = new DoctorDao(DBConnect.getConnection());
		HashMap<String, String> check = dao.updatePassword(doc_id, old_password, password, email);
		
		if(check.containsKey("password_matched")) {
			session.setAttribute("successMsg", check.get("password_matched"));
			resp.sendRedirect("doctor/edit_profile.jsp");
		} else {
			
			if(check.containsKey("changed")) {
				session.removeAttribute("doctorObj");
				session.setAttribute("successMsg", check.get("changed"));
				
				session.setAttribute("doctorObj", dao.getDoctorById(doc_id));
				resp.sendRedirect("doctor/edit_profile.jsp");				
			} else {
				session.setAttribute("errorMsg", "Something went wrong.");
				resp.sendRedirect("doctor/edit_profile.jsp");				
			}
		}
		
	}
}
