package com.fairmusic.artist.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
		
@WebServlet(name = "logout", urlPatterns = { "/logout.do" })
public class LogoutServlet extends HttpServlet {

		
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("·Î±×¾Æ¿ô¼­ºí¸´~");
			HttpSession ses = request.getSession(false);
			if(ses!=null){
				ses.invalidate();
			}
		/*	request.setAttribute("viewpath", "../content.jsp" );
			request.setAttribute("rightpath", "Side_Right.jsp");*/
			
	/*		RequestDispatcher rd = request
					.getRequestDispatcher("/layout/mainLayout.jsp");
			rd.forward(request, response);*/
			response.sendRedirect("/FairMusic/index.jsp");
	}

}
