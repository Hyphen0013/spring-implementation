package hyphen.servlet.cookies;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		
		if(cookies == null) {
			resp.sendRedirect("index.jsp");				
		} else {
			
			for(Cookie c : cookies) {
				if(c.getName().equals("email")) {
					resp.setContentType("text/html");
					PrintWriter out = resp.getWriter();
					
					out.println("<h1>Email = " + cookies[1].getValue() + "</h1>");
					out.println("<h1>Password = " + cookies[2].getValue() + "</h1>");
					
					out.println("<a href='logout'>Logout</a>");			
				}
//				else {
//					resp.sendRedirect("index.jsp");	
//				}
			}			
		}
	}

}
