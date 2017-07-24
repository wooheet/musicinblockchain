package com.blocko.controller;

import io.blocko.bitcoinj.core.Sha256Hash;
import io.blocko.bitcoinj.core.Utils;
import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Stamp;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.api.API;
import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MusicStampDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;

@WebServlet(name = "stampselect", urlPatterns = { "/stampselect" })
public class StampSelect extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		//최종 업로드 버튼 리스트 페이지로 리다이렉트 된다 그리고 리스트를 누르게되면 블록체인 정보가 출력
		HttpSession ses = request.getSession();
		artistDTO artist= (artistDTO)ses.getAttribute("user"); 
		String artist_code = artist.getArtist_code();
		PrintWriter pw = response.getWriter();
		try {
			audioDTO audiodto = new audioDTO();
			String musicName = audiodto.getAudio_title();

			BlockoService service = new BlockoServiceImpl();
			MusicStampDTO musicstamp = service.StampSelect(artist_code, musicName);
			
			Stamp stamp = coinstack.getStamp(musicstamp.getStampId());
			
			DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG);
			String msg="";
			
			try {
				String Timestamp = dateFormat.format(stamp.getTimestamp());
				request.setAttribute("Timestamp", Timestamp);
			} catch (NullPointerException e) {
				msg = "블록체인 승인중";
			}
			
			pw.print(musicName+","+musicstamp.getMusicHash()+","+stamp.getTxId()+","+stamp.getConfirmations()+","+msg);
		/*	request.setAttribute("musicName",musicName);
			request.setAttribute("musicHash", musicstamp.getMusicHash());
			request.setAttribute("txId", stamp.getTxId());
			request.setAttribute("Confirmations", stamp.getConfirmations());
			request.setAttribute("msg", msg);*/
		} catch (CoinStackException e) {
			
			e.printStackTrace();
		}finally{
			coinstack.close();
		}
 
	/*	RequestDispatcher rd =
				request.getRequestDispatcher("/MusicUpload/musicstampselect.jsp");
		rd.forward(request, response);*/
	}
}
