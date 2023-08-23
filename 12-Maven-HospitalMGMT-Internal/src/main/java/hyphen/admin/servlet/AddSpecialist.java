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
import hyphen.dao.SpecalistDao;
import hyphen.entity.Specalist;

@WebServlet("/add_specialist")
public class AddSpecialist extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String specName = req.getParameter("specName");
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());
		
		Specalist specialist = new Specalist(specName, createdAt);
		SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
		boolean check = dao.addSpecialist(specialist);
		
		HttpSession session = req.getSession();
		if(check) {
			session.setAttribute("successMsg", "Specialist added successfully!");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Specialist not added!");
			resp.sendRedirect("admin/index.jsp");
		}		
	}
}
