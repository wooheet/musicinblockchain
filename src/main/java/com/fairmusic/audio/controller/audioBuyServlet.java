package com.fairmusic.audio.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.audiobuyDTO;

/**
 * Servlet implementation class audioBuyServlet
 */
public class audioBuyServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		
		System.out.println("오디오바이서블렛 오긴오냐");

		
		String audio_code = request.getParameter("audio_code");
		
		AudioService service = new AudioServiceimpl();
		
		HttpSession ses = request.getSession();
		artistDTO ardto = (artistDTO)ses.getAttribute("user");
		String artist_code = ardto.getArtist_code();
		
		int result = service.audiopurchase(artist_code, audio_code);
		
		if(result>=1){
			System.out.println(artist_code+"가" + audio_code+"를 샀다");
		}
		
		request.setAttribute("result", result);

		PrintWriter pw = response.getWriter();
		pw.write("성공성공");

		
	}


}
