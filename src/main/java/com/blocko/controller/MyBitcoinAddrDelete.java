package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.ECKey;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet(name = "MyBitcoinAddrDelete", urlPatterns = { "/MyBitcoinAddrDelete" })
public class MyBitcoinAddrDelete extends HttpServlet{
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ses = request.getSession();
		artistDTO artist= (artistDTO)ses.getAttribute("user"); 
		String artist_code = artist.getArtist_code();
		PrintWriter pw = response.getWriter();
		BlockoService service = new BlockoServiceImpl();
		int result = service.delete(artist_code);
		pw.print(result);
	}
}
