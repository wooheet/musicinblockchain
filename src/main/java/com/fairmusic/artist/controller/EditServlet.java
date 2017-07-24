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

@WebServlet(name = "edit", urlPatterns = { "/edit.do" })
public class EditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("수정서블릿 ");
		String artist_pass = request.getParameter("artist_pass");
		String artist_name = request.getParameter("artist_name");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		
		System.out.println(artist_pass +","+artist_name);
		
		HttpSession ses = request.getSession();
		artistDTO user = (artistDTO)ses.getAttribute("user");
		String artist_code = user.getArtist_code();
		System.out.println("user : "+user);
		
		ArtistServiceimpl service = new ArtistServiceimpl();
		int result = service.edit(artist_pass, artist_name, artist_code);
		
		System.out.println("수정 : "+result);
		
		String msg = "";
		
		if(result!=0){
			msg = "수정되었습니다.";
		}
		
		pw.write(msg);
	}

}
