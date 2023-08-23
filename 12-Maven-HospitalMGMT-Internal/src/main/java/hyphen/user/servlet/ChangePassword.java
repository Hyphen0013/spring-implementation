package hyphen.user.servlet;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;

@WebServlet("/change_user_password")
public class ChangePassword extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userId = Integer.parseInt(req.getParameter("userId"));
		String old_password = req.getParameter("old_password");
		String password = req.getParameter("password");
		String confirm_pass = req.getParameter("confirm_pass");
		String email = req.getParameter("email");
		
		HttpSession session = req.getSession();
		
		if(!password.equals(confirm_pass)) {
			session.setAttribute("successMsg", "New password and Confirm password not matched!");
			resp.sendRedirect("change_password.jsp");
			return;
		}
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		HashMap<String, String> check = dao.updatePassword(userId, old_password, password, email);
		
		if(check.containsKey("password_matched")) {
			session.setAttribute("successMsg", check.get("password_matched"));
			resp.sendRedirect("change_password.jsp");
		} else {
			
			if(check.containsKey("changed")) {
				session.setAttribute("successMsg", check.get("changed"));
				resp.sendRedirect("change_password.jsp");				
			} else {
				session.setAttribute("errorMsg", "Something went wrong.");
				resp.sendRedirect("change_password.jsp");				
			}
		}
		
	}
}
