package com.fairmusic.audio.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.dto.MyBTCaddrDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.service.FollowService;
import com.fairmusic.follow.service.FollowServiceImpl;

/**
 * Servlet implementation class audioManageServlet
 */
public class audioManageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String audio_code = request.getParameter("audio_code");
	
		AudioService service = new AudioServiceimpl();
		audioDTO audiodto =service.selectAudio(audio_code);

		request.setAttribute("audiodto", audiodto);

		
		BlockoService bservice = new BlockoServiceImpl();
		ArrayList<BitcoinAdressDTO> blist = bservice.bitcoinAdressSelect(audio_code);
		
		/* 판매량 가꼬와서 여기서 공유*/
		request.setAttribute("bitlist", blist);
		
		request.setAttribute("viewpath", "../MusicDetail/MusicManage.jsp");
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}

	
}
