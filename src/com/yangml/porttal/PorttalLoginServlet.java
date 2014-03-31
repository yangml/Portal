package com.yangml.porttal;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PorttalLoginServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("type=text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		out.print(username+"==="+password);
		req.getSession().setAttribute("remoteusername", username);
		req.getSession().setAttribute("remotepassword", password);
		
		Cookie c1 = new Cookie("cooUserName", username);
		Cookie c2 = new Cookie("cooPassword", password);
		c1.setPath("/");
		c2.setPath("/");
		resp.addCookie(c1);
		resp.addCookie(c2);
		c1.setMaxAge(60 * 60 * 24 * 14);
		c2.setMaxAge(60 * 60 * 24 * 14);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/main.jsp");

		dispatcher .forward(req, resp);
		//super.doPost(req, resp);
	}
}
