package hyphen.servlet.urlRewriting;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/urlredirecting")
public class URLRewriting extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		int id = 2;
		
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		out.print("<h1>Name: " + name + "</h1>");
		out.print("<a href='urlrewrite2?username=" + name + "&id=" + id + "'>Send to Servlet</a>");
	}

}
