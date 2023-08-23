package hyphen.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class UsingServletInterface implements Servlet {
	
	ServletConfig con;

	@Override
	public void destroy() {
		System.out.println("This is Destroy method");
		
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		System.out.println("This is Initialization method");
		con = config;
	}

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		System.out.println("This is Request and Response method");
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		out.println("Welcome to servlet");
		out.println(getServletConfig());
		out.println(getServletInfo());
		
	}
	
	@Override
	public ServletConfig getServletConfig() {
		System.out.println("This is getServletConfig method");
		return con;
	}

	@Override
	public String getServletInfo() {
		// TODO Auto-generated method stub
		System.out.println("This is getServletInfo method");
		return "Call From getServletInfo method";
	}	

}
