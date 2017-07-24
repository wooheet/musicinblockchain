package com.fairmusic.album.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;

public class myAlbumServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("euc-kr");
		
		artistDTO user = (artistDTO)request.getSession().getAttribute("user");
		String artist_code = user.getArtist_code();
		
		System.out.println("아티스트코드"+artist_code);
		
		AlbumService service = new AlbumServiceimpl();

		ArrayList<albumDTO> dtolist =service.myAlbumList(artist_code);
		
		request.setAttribute("myalbumlist", dtolist);
		

	}

}
