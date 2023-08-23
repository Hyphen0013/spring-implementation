package hyphen.servlet.cookies;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet1")
public class Servlet1 extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		PrintWriter out = resp.getWriter();
		
		Cookie ck = new Cookie("name", name);
		resp.addCookie(ck);
		
		resp.setContentType("text/html");
		out.print("<h1>Welcome to Servlet1, name " + name + "</h1>");
		out.print("<a href='servelt2'>Servlet2 </a>");
	}

}
