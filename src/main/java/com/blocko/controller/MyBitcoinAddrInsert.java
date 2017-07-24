package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.ECKey;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.api.API;
import com.blocko.dto.MyBTCaddrDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.dto.artistDTO;

@WebServlet(name = "MyBitcoinAddr", urlPatterns = { "/MyBitcoinAddr" })
public class MyBitcoinAddrInsert extends HttpServlet implements MyBtcAddrReq{
	CoinStackClient coinstack = API.createNewCoinStackClient();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		execute(request, response);
	}
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
	
		HttpSession ses = request.getSession();
		artistDTO artist= (artistDTO)ses.getAttribute("user"); 
		String artist_code = artist.getArtist_code();
		System.out.println("artist_code :"+artist_code);
		BlockoService service = new BlockoServiceImpl();
		try {		
			request.setCharacterEncoding("euc-kr");
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter pw = response.getWriter();
			try {
			
				MyBTCaddrDTO addr = service.read(artist_code);
				String msg="주소는 1개만 생성 가능합니다.";
				pw.print(0+","+addr.getMybtcaddr()+","+msg);
			} catch (NullPointerException e){
				String Myprivatekey = PrivateKey();
				String MybitcoinAddr = btcAddress();
				MyBTCaddrDTO myaddr = new MyBTCaddrDTO(artist_code, Myprivatekey, MybitcoinAddr);
				service.mybtcaddr(myaddr);
				System.out.println(myaddr.getMybtcaddr());
				System.out.println(myaddr.getMypk());
				pw.print(1+","+myaddr.getMybtcaddr()+","+myaddr.getMypk());
			}
		} catch (CoinStackException e) {
			
			e.printStackTrace();
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
		
	}
	public String PrivateKey() throws CoinStackException {
		String newPrivateKey ="";
		newPrivateKey = ECKey.createNewPrivateKey();
		return newPrivateKey;
	}
	public String btcAddress() throws CoinStackException {
		String bitcoinAddr ="";
		String newPrivateKey = PrivateKey();
		bitcoinAddr = ECKey.deriveAddress(newPrivateKey);
		return bitcoinAddr;
	}
}
