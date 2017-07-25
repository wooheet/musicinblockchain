package com.fairmusic.audio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;

/**
 * Servlet implementation class audioPageServlet
 */
public class audioPageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String audio_code = request.getParameter("audio_code");
		
		AudioService service = new AudioServiceimpl();
		
		audioDTO dto = service.selectAudio(audio_code);
		System.out.println("오디오페이지서블릿에서 오디오디티오"+audio_code);
		String album_code = dto.getAlbum_code();
		System.out.println("오디오페이지서블릿에서 앨범코드"+album_code);
		String artist_code = dto.getArtist_code();
		
		ArtistServiceimpl artistservice = new ArtistServiceimpl();
		artistDTO artistdto = artistservice.getArtistDTO(artist_code);
		
		AlbumService albumservice = new AlbumServiceimpl();
		albumDTO albumdto = albumservice.getAlbumDTO(album_code);
		
		request.setAttribute("audioDTO", dto);
		request.setAttribute("albumDTO", albumdto);
		System.out.println("오디오페이지서블릿에서 앨범디티오"+albumdto);
		request.setAttribute("artistDTO", artistdto);
		
		request.setAttribute("viewpath", "../MusicDetail/MusicPage.jsp");
		
		String leftpath = request.getParameter("leftpath");
		String rightpath = request.getParameter("rightpath");

		

		
		BlockoService bservice = new BlockoServiceImpl();
		
		ArrayList<BitcoinAdressDTO> blist = bservice.bitcoinAdressSelect(audio_code);
	      

	    request.setAttribute("blist", blist);

		request.setAttribute("leftpath", leftpath);
		request.setAttribute("rightpath", rightpath);
		RequestDispatcher rd = request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}

}
