package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.blocko.api.API;

@WebServlet(name = "BlockChainSearch", urlPatterns = { "/BlockChainSearch" })
public class BlockChainSearch extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String YOUR_MUSICBLOCKCHAIN_ADDRESS = request.getParameter("btcval");
		System.out.println("- Address: "+YOUR_MUSICBLOCKCHAIN_ADDRESS);
		PrintWriter pw = response.getWriter();
		long balance;
		try {
			balance = coinstack.getBalance(YOUR_MUSICBLOCKCHAIN_ADDRESS);
			System.out.println("- Balance: "+balance);
			pw.print(balance);
		} catch (CoinStackException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
}
