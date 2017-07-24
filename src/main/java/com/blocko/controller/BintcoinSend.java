package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.ECKey;
import io.blocko.coinstack.TransactionBuilder;
import io.blocko.coinstack.TransactionUtil;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.exception.MalformedInputException;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.blocko.api.API;
import com.blocko.dto.BitcoinAdressDTO;
import com.blocko.dto.MyBTCaddrDTO;
import com.blocko.service.BlockoService;
import com.blocko.service.BlockoServiceImpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
@WebServlet(name = "bitcoinsend", urlPatterns = { "/bitcoinsend" })
public class BintcoinSend extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		try {
			BlockoService service = new BlockoServiceImpl();
			audioDTO audiodto = new audioDTO();
			String audio_code = audiodto.getAudio_title();
			ArrayList<BitcoinAdressDTO> btcaddrlist = service.bitcoinAdressSelect(audio_code);
			HttpSession ses = request.getSession();
			artistDTO artist= (artistDTO)ses.getAttribute("user"); 
			String artist_code = artist.getArtist_code();
			System.out.println("artist_code :"+artist_code);
			MyBTCaddrDTO addr = service.read(artist_code);
			
			String MyPrivateKey=addr.getMypk();
			String[] toAddress = new String[2];
			double[] righterVal = new double[2];
			String[] rawSignedTx = new String[2];
			String[] transactionId = new String[2];
			double[] amount = new double[2];
			TransactionBuilder builder = new TransactionBuilder();
			for (int i = 0; i < btcaddrlist.size(); i++) {
				toAddress[i]= (btcaddrlist.get(i).getBitcoinAdress());
				//privatekey[i] = (btcaddrlist.get(i).getPrivatekey());
				righterVal[i] = (btcaddrlist.get(i).getRighterVal());
				String RVAL = Double.toString(righterVal[i]);
				amount[i] = io.blocko.coinstack.Math.convertToSatoshi(RVAL);
				builder.allowDustyOutput(true);
				builder.addOutput(toAddress[i], (long) amount[i]);
				rawSignedTx[i] = coinstack.createSignedTransaction(builder, MyPrivateKey);
				System.out.println(rawSignedTx[i]);
				transactionId[i] = TransactionUtil.getTransactionHash(rawSignedTx[i]);
				System.out.println(transactionId[i]);
				request.setAttribute("transactionId", transactionId[i]);
			}
			
			//String[] privatekey = {btcaddr.getPrivatekey()};
			//long[] righterVal = {btcaddr.getRighterVal()};
			//String[] toAddress ={btcaddr.getBitcoinAdress()};
			//long[] fee =null; 
			//fee =io.blocko.coinstack.Math.convertToSatoshi("fee[i]");
			//builder.setFee(fee);
			
		} catch (MalformedInputException e) {
			e.printStackTrace();
		} catch (CoinStackException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/bitcoinAddress/bitcoinSend.jsp");
		rd.forward(request, response);
	}
}
