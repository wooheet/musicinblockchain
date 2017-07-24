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
import com.fairmusic.dto.MessageDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.message.service.MessageServiceImpl;

@WebServlet(name = "login_google", urlPatterns = { "/login_google.do" })
public class LoginServlet_Google extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		
		String loginUser_google = request.getParameter("loginUser_google");
		String artist_code = request.getParameter("code");
		String name = request.getParameter("name");
		System.out.println("구글 로그인서블릿  loginUser_google : "+ loginUser_google);
		System.out.println("구글 로그인서블릿  artist_code : "+ artist_code);
		System.out.println("구글 로그인서블릿 이름 : "+name);
		
		
		ArtistServiceimpl service = new ArtistServiceimpl();
		artistDTO user = service.getArtistDTO(artist_code);
		HttpSession ses = request.getSession();
		
		System.out.println("구글 로그인서블릿  user : "+ user);
		
		String viewpath = "";
		String leftpath= null;
		String rightpath= null;
		String rdpath = null;
		
		if(loginUser_google.equals("success")&& user!=null){
			MessageServiceImpl M_service = new MessageServiceImpl();
			ArrayList<MessageDTO> newMessageList = M_service.NewMessage(artist_code);
			ses.setAttribute("newMessageList", newMessageList);
			ses.setAttribute("user", user);
			viewpath = "../content.jsp";
			rightpath="Side_Right.jsp";
			rdpath="/layout/mainLayout.jsp";
		}else{
			rdpath = "login_failed.jsp";
		}
		
		

		
		request.setAttribute("viewpath", viewpath);
		request.setAttribute("leftpath", leftpath);
		request.setAttribute("rightpath", rightpath);

		RequestDispatcher rd = request
				.getRequestDispatcher(rdpath);
		rd.forward(request, response);

	}
}

