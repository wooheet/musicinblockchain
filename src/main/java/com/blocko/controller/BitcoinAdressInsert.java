package com.blocko.controller;


import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.ECKey;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.api.API;
import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;

 @WebServlet(name = "bitcoinAddr", urlPatterns = { "/bitcoinaddr" })
public class BitcoinAdressInsert extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter pw = response.getWriter();

		/*HttpSession ses = request.getSession();
		String audio_code= (String)ses.getAttribute("user");*/
		
		String audio_code= (String)request.getSession().getAttribute("audio_code");	
		try {
			
			String[] righterName ={request.getParameter("cpname")};
			double[] righterVal ={Double.parseDouble((request.getParameter("cprate")))};

			for (int i = 0; i < righterName.length; i++) {
				System.out.println(righterName[i]);
				System.out.println((righterVal[i] *0.01));
			}
			String[] PrivateKey = {ECKey.createNewPrivateKey()};
			String[] bitcoinAdress =new String[2];
			double[] balance = new double[2];
			BitcoinAdressDTO bitaddr = null;
			for (int j = 0; j < bitcoinAdress.length; j++) {
				bitcoinAdress = new String[]{ECKey.deriveAddress(PrivateKey[j])};
				balance = new double[]{coinstack.getBalance(bitcoinAdress[j])};
				System.out.println("create privateKey: "+PrivateKey[j]);
				System.out.println("MusicAddress: "+bitcoinAdress[j]);
				bitaddr = new BitcoinAdressDTO(audio_code, bitcoinAdress[j], PrivateKey[j],righterName[j], righterVal[j]);
			}
			BlockoService service = new BlockoServiceImpl();
			int result = service.bitcoinAdressInsert(bitaddr);
			for (int i = 0; i < bitcoinAdress.length; i++) {
				pw.print("BitcoinAddress : "+bitcoinAdress[i]+", ภÜพื : "+balance[i]);
			}
		} catch (CoinStackException e) {
			e.printStackTrace();
		}finally{
			coinstack.close();
		}

	}
}
