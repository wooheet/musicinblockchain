package com.fairmusic.audio.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Stamp;

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocko.api.API;
import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.audioDTO;


public class audioBitPageServlet extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String audio_code = request.getParameter("audio_code");
	
		AudioService service = new AudioServiceimpl();
		audioDTO audiodto =service.selectAudio(audio_code);

		BlockoService bservice = new BlockoServiceImpl();
		MusicStampDTO musicstamp = bservice.StampSelect(audiodto.getArtist_code(), audiodto.getAudio_code());
		
		Stamp stamp;
		try {
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
			System.out.println("musicstamp"+musicstamp);
			System.out.println("dateFormat"+dateFormat);
			stamp = coinstack.getStamp(musicstamp.getStampId());
			
			System.out.println("stamp"+stamp);
			
			System.out.println(stamp.getTimestamp());
			if(stamp.getTimestamp()!=null){
				String Timestamp = dateFormat.format(stamp.getTimestamp());
				request.setAttribute("Timestamp", Timestamp);
			}else{
				request.setAttribute("Timestamp", "Timestamp 정보가 아직 등록되지 않았습니다. 음원 등록 이후 약 2~3시간 경과 후에 확인해주시길 바랍니다.");
			}
/*			String Timestamp = dateFormat.format(stamp.getTimestamp());
			request.setAttribute("Timestamp", Timestamp);*/
			request.setAttribute("musicName", audiodto.getAudio_title());
			request.setAttribute("musicHash", musicstamp.getMusicHash());
			request.setAttribute("txId", stamp.getTxId());
			request.setAttribute("Confirmations", stamp.getConfirmations());
			
			
			
		} catch (CoinStackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		request.setAttribute("audiodto", audiodto);
		System.out.println("오디오비트페이지 와썽");
	
		request.setAttribute("viewpath", "../MusicDetail/MusicBitPage.jsp");
		

			
		
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}

}
