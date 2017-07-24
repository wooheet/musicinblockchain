package com.fairmusic.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.artist.service.ArtistServiceimpl;

@WebServlet(name = "emeilFind", urlPatterns = { "/emailFind.do" })
public class EmeilFindServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EmeilFindServlet 실행~");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("artist_email");
		System.out.println("이메일"+email);
		ArtistServiceimpl service = new ArtistServiceimpl();
		boolean check = service.emailCheck(email);
		String msg = "";
		if(check==true){
			msg = "사용중인 ID : "+ email;
		}else{
			msg = "일치하는 ID가 없습니다.";
		}
		pw.write(msg);
	}

}
