package com.fairmusic.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.dto.artistDTO;

@WebServlet(name = "drop", urlPatterns = { "/drop.do" })
public class DropServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("»èÁ¦¼­ºí¸´ ½ÇÇà~");
		
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		
		
		HttpSession ses = request.getSession();
		artistDTO user = (artistDTO)ses.getAttribute("user");
		String artist_code = user.getArtist_code();
		System.out.println("user : "+user);
		
		ArtistServiceimpl service = new ArtistServiceimpl();
		int result = service.drop(artist_code);
		
		System.out.println("È¸¿ø Å»Åð "+result);
		
		if(result!=0){
			ses.invalidate();
			response.sendRedirect("/FairMusic/index.jsp");
		}
	}

}
