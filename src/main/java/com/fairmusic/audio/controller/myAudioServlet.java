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
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;

public class myAudioServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
	
		artistDTO user = (artistDTO)request.getSession().getAttribute("user");
		String artist_code =user.getArtist_code();
		
		System.out.println("아티스트코드"+artist_code);
		
		AudioService service = new AudioServiceimpl();
		ArrayList<audioDTO> dtolist =service.myAudioList(artist_code);
		
		request.setAttribute("myaudiolist", dtolist);



		
	}
}
