package hyphen.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean check = dao.deleteStudent(id);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Data deleted sucessfully!");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("errorMsg", "Data deleted failed!");
			resp.sendRedirect("index.jsp");
		}		
	}

}
