package com.fairmusic.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.artist.service.ArtistServiceimpl;

@WebServlet(name = "emeilCheck", urlPatterns = { "/emailCheck.do" })
public class EmeilCheckServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("EmeilCheckServlet ����~");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("artist_email");
		System.out.println("�̸���"+email);
		ArtistServiceimpl service = new ArtistServiceimpl();
		boolean check = service.emailCheck(email);
		String msg = "";
		String state = "";
		if(check==true){
			msg = "�̹� ������� �̸��� �Դϴ�.";
			state = "0";
		}else{
			msg = "��밡��~";
			state = "1";
		}
		pw.write(msg+"/"+state);
	}

}
