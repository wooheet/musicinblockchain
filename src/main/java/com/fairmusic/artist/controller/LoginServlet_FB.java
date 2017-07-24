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

@WebServlet(name = "login_fb", urlPatterns = { "/login_fb.do" })
public class LoginServlet_FB extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String artist_code = request.getParameter("code");
		String name = request.getParameter("name");
		String state = request.getParameter("state");
		
		System.out.println("ÆäºÏ ·Î±×ÀÎ¼­ºí¸´  artist_code : "+ artist_code);
		System.out.println("ÆäºÏ ·Î±×ÀÎ¼­ºí¸´ ÀÌ¸§ : "+name);
		System.out.println("ÆäºÏ state : "+state);
		
		ArtistServiceimpl service = new ArtistServiceimpl();
		artistDTO user = service.getArtistDTO(artist_code);
		HttpSession ses = request.getSession();
		
		System.out.println("ÆäºÏ ·Î±×ÀÎ¼­ºí¸´  user : "+ user);
		
		String viewpath = "";
		String leftpath= null;
		String rightpath= null;
		String rdpath = null;
		
		if(state.equals("success")&& user!=null){
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

