package com.fairmusic.audio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.audiobuyDTO;


public class havingAudioServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		artistDTO ardto = (artistDTO)request.getSession().getAttribute("user");
		
		String artist_code = ardto.getArtist_code();
		
		AudioService service = new AudioServiceimpl();
		ArrayList<audiobuyDTO> havingdto = service.havingAudio(artist_code);
		System.out.println(havingdto+"해빙디티오");
		ArrayList<audioDTO> havingAudioDTO = new ArrayList<audioDTO>();
	
		int size = havingdto.size();
		System.out.println(size +"사잊");
		audioDTO tempdto = null;
		for(int i = 0;i < size;i++){
			String tempcode = havingdto.get(i).getAudio_code();
			System.out.println("이게 해야하는 코드임"+havingdto.get(i).getAudio_code());

			
			tempdto = service.selectAudio(tempcode);
	System.out.println(tempdto);
			havingAudioDTO.add(tempdto);
		}
		
		
		request.setAttribute("havingAudioDTO", havingAudioDTO);

		request.setAttribute("viewpath", "../MusicDownload/havingMusic.jsp");
		
		
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}

}
