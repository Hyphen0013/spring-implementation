package hyphen.servlet.cookies;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cookies = req.getCookies();
		System.out.println(cookies[1]);
		

			
		for(Cookie c : cookies) {
			if(c.getName().equals("email")) {
				cookies[1].setMaxAge(0);
				cookies[2].setMaxAge(0);
				
				resp.addCookie(cookies[0]);
				resp.addCookie(cookies[1]);
				resp.sendRedirect("index.jsp");			
			}
		}
	}

}
