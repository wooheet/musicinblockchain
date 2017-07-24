package com.fairmusic.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.dto.artistDTO;

@WebServlet(name = "compare_fb", urlPatterns = { "/compare_fb.do" })
public class CompareFBServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ÆäºÏ compare ¼­ºí¸´ ½ÇÇà~");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		System.out.println("ºñ±³ ¼­ºí¸´ ÄÚµå"+code);
		System.out.println("name : " +name);
		ArtistServiceimpl service = new ArtistServiceimpl();
		boolean compare = service.emailCheck(code);
		
		artistDTO dto = new artistDTO(code, "", "", name, null, null, "1");
		
		String rdpath = null;
		if (compare == true) {
			rdpath = "login-no-sidebar.jsp";
		} else {
			int result = service.regist(dto);
			System.out.println(result+"¸í »ðÀÔ¼º°ø ("+code+","+name+")");
			rdpath = "login-no-sidebar.jsp";
		}
		
		RequestDispatcher rd = request
				.getRequestDispatcher(rdpath);
		rd.forward(request, response);
		
	
	}

}
