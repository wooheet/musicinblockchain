package com.fairmusic.artist.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.MessageDTO;
import com.fairmusic.message.service.MessageServiceImpl;

@WebServlet(name = "login", urlPatterns = { "/login.do" })
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("euc-kr");

			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			
			/* 로그인 */
			ArtistServiceimpl service = new ArtistServiceimpl();
			artistDTO loginUser = service.login(email, pass);

			
			String viewpath = "";
			String leftpath= null;
			String rightpath= null;
			String rdpath = null;
			String artist_code ="";
			ArrayList<MessageDTO> newMessageList = null;
			
			if(loginUser==null){
				rdpath="/FairMusic/login_failed.jsp";
			}else{
				artist_code = loginUser.getArtist_code();
				MessageServiceImpl M_service = new MessageServiceImpl();
				newMessageList = M_service.NewMessage(artist_code);
				rdpath="/FairMusic/view.do?viewpath=../content.jsp&rightpath=Side_Right.jsp";
				HttpSession ses = request.getSession();
				ses.setAttribute("user", loginUser);
				ses.setAttribute("newMessageList", newMessageList);
			}
			
			System.out.println("로그인서블릿 articode : "+artist_code);
			System.out.println("로그인서블릿 newMessageList : "+newMessageList);
			System.out.println("로그인서블릿 loginUser : "+loginUser);

			
			/*request.setAttribute("viewpath", viewpath);
			request.setAttribute("leftpath", leftpath);
			request.setAttribute("rightpath", rightpath);

			RequestDispatcher rd = request
					.getRequestDispatcher(rdpath);
			rd.forward(request, response);*/
			
			response.sendRedirect(rdpath);
		}
	}


