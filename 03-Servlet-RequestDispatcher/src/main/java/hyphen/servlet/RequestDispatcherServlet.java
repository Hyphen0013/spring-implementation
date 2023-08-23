package hyphen.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class RequestDispatcherServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String em = req.getParameter("user_email");
		String ps = req.getParameter("password");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		RequestDispatcher rd;
		
		if("demo@gmail.com".equals(em) && "demo".equals(ps)) {
			req.setAttribute("sum", 5 + 3);
			rd = req.getRequestDispatcher("/servlet2");
			rd.forward(req, resp);
		} else {
			out.print("<h4>Invalid email and password</h4>");
			rd = req.getRequestDispatcher("/index.jsp");
			rd.include(req, resp);
		}	
	}

}
