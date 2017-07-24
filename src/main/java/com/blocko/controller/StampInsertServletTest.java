package com.blocko.controller;

import io.blocko.bitcoinj.core.Sha256Hash;
import io.blocko.bitcoinj.core.Utils;
import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Stamp;

import java.io.IOException;
import java.text.DateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.api.API;
import com.blocko.dto.MusicStampDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.dto.artistDTO;

@WebServlet(name = "stampinsert", urlPatterns = { "/stampinsert" })
public class StampInsertServletTest extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		//최종업로드 누를때 인설트되고 결과값 한번  모달에 띄워준다. 그리고 결과 페이지에는 음원 리스트 출력 후 클릭시 StampSelect 서블릿으로 블록체인 데이터 가져오기
		HttpSession ses = request.getSession();
		artistDTO artist= (artistDTO)ses.getAttribute("user"); 
		String artist_code = artist.getArtist_code();
		
		String id= (String)ses.getAttribute("user"); 
		String musicName = request.getParameter("musicName"); // mp3데이터값 가져오니라
		byte[] data = musicName.getBytes();
		byte[] hash = Sha256Hash.create(data).getBytes();
		String MusicHash = Utils.HEX.encode(hash);
		System.out.println("음악 해쉬값: "+MusicHash);
		// 음악 해쉬값만 뿌려준다.
		try {
			String stampId = coinstack.stampDocument(MusicHash);
			System.out.println("음악이 스탬프된 값 : "+stampId);
			
			//Stamp stamp = coinstack.getStamp(stampId); //"f706145581af043206600a9182357b59c57d37dcf232d44c276f8ce22016c4a1-0"
			
			//System.out.println("블록체인 트랜잭션 값: "+stamp.getTxId());
			
			MusicStampDTO stampDTO = new MusicStampDTO(id, musicName, MusicHash, stampId);
			BlockoService service = new BlockoServiceImpl();		
			int result = service.insert(stampDTO);
			
			String msg = "";
			if(result>=1){
				msg = result+"개 - Music 블록체인 삽입되었습니다.";
			}else{
				msg = "블록체인 삽입실패";
			}
			request.setAttribute("msg", msg);
			request.setAttribute("MusicHash", MusicHash);
			request.setAttribute("stampId", stampId);
			//request.setAttribute("txId", stamp.getTxId());
		} catch (CoinStackException e) {
			e.printStackTrace();
		}finally{
			coinstack.close();
		}
		RequestDispatcher rd =
				request.getRequestDispatcher("/MusicUpload/musicstampinsert.jsp");
		rd.forward(request, response);
	}
}
