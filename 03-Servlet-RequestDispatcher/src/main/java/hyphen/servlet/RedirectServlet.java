package hyphen.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet2")
public class RedirectServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("user_email");
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.print(email + "<h4>Welcome to home page</h4>");
		
		int sum = (int)req.getAttribute("sum");
		out.print("<p>SUM: </p>" + sum);
		out.print("<p>MULTIPLICATION: </p>" + sum * 5);
	}
	
}
