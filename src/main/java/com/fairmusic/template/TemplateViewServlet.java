package com.fairmusic.template;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "view", urlPatterns = { "/view.do" })
public class TemplateViewServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewpath = request.getParameter("viewpath");
		String leftpath = request.getParameter("leftpath");
		String rightpath = request.getParameter("rightpath");
		System.out.println(viewpath);
		System.out.println(leftpath);
		System.out.println(rightpath);	
		
		request.setAttribute("leftpath", leftpath);
		request.setAttribute("viewpath", viewpath);
		request.setAttribute("rightpath", rightpath);
		RequestDispatcher rd = request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String viewpath = request.getParameter("viewpath");
		String leftpath = request.getParameter("leftpath");
		String rightpath = request.getParameter("rightpath");
		System.out.println(viewpath);
		System.out.println(leftpath);
		System.out.println(rightpath);	
		
		request.setAttribute("leftpath", leftpath);
		request.setAttribute("viewpath", viewpath);
		request.setAttribute("rightpath", rightpath);
		RequestDispatcher rd = request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}
}

