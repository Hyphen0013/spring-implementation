package hyphen.servlet.httpSession;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/httpserssion-url")
public class HttpSessionExample extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();	
		out.println("Name: " + name);
		
		HttpSession session = req.getSession();
		session.setAttribute("sessionUser", name);
		out.print("<a href='http-session-servlet'>Servlet2 </a>");
	}
	
}
