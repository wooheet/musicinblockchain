package com.fairmusic.audio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.audioDTO;

public class audioDeleteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		
		
		String audio_code = request.getParameter("audio_code");
		
		AudioService service = new AudioServiceimpl();
		int result =service.audioDelete(audio_code);
		
		
		request.setAttribute("result", result);
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/FairMusic/second.do");
		rd.forward(request, response);
	
	}

}
