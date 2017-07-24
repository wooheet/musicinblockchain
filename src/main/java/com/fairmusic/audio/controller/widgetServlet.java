package com.fairmusic.audio.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.seong.ServerPathServlet;

public class widgetServlet extends HttpServlet {
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");

		
		ServletContext context = this.getServletContext();
	    String realPath = context.getRealPath("/");
	    
	    String filepath = realPath+ "FM_audio_file";
	    String imagepath = realPath+ "FM_audio_image";
	    String videopath = realPath+ "FM_audio_video";
	    
	  
		String audio_code = request.getParameter("audio_code");
		System.out.println("오디오코드"+audio_code);
		AudioService audioservice = new AudioServiceimpl();
		System.out.println("오디오서비스"+audioservice);
		audioDTO audiodto = audioservice.selectAudio(audio_code);
		System.out.println("오디오디티오"+audiodto);
		ArtistServiceimpl artistservice = new ArtistServiceimpl();
		artistDTO artistdto = artistservice.getArtistDTO(audiodto.getArtist_code());
		System.out.println("아티스트디티오"+artistdto);
		String artistName = "조성원";
		System.out.println("아티스트네임"+artistName);
		
		request.setAttribute("audio_code", audio_code);
		
		ServerPathServlet path = new ServerPathServlet();
		String  audioPath = filepath;
		String  audioImage= imagepath;
		String audioMovie = videopath;
		
		System.out.println(audioPath);
		audioPath += "\\"+audio_code+"."+audiodto.getAudio_file();
		audioImage += "\\"+audio_code+"."+audiodto.getAudio_image();
		audioMovie += "\\"+audio_code+"."+audiodto.getAudio_movie();
		System.out.println(audioPath);
		request.setAttribute("audioDto", audiodto);
		
		System.out.println("audioPath" + audioPath);
		request.setAttribute("artistName",artistName);
		
		request.setAttribute("audioPath",audioPath);
		request.setAttribute("audioImage", audioImage);
		request.setAttribute("audioMovie", audioMovie);
		
		RequestDispatcher rd = request
				.getRequestDispatcher("/widget/fmWidget.jsp");
		rd.include(request, response);
	}

}
