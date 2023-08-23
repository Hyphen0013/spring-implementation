package hyphen.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.DoctorDao;

@WebServlet("/delete_doctor")
public class DeleteDoctor extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		DoctorDao doa = new DoctorDao(DBConnect.getConnection());
		boolean check = doa.deleteDoctor(id);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Doctor Deleted Successfully!");
			resp.sendRedirect("admin/doctor.jsp");
		} else {
			session.setAttribute("errorMsg", "Doctor Not Deleted!");
			resp.sendRedirect("admin/doctor.jsp");
		}		
	}
	
}
