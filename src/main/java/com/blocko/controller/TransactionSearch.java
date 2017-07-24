package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.blocko.api.API;

@WebServlet(name = "TransactionSearch", urlPatterns = { "/TransactionSearch" })
public class TransactionSearch extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String YOUR_MUSICBLOCKCHAIN_ADDRESS = request.getParameter("txval");
		System.out.println(YOUR_MUSICBLOCKCHAIN_ADDRESS);
		try {
			PrintWriter pw = response.getWriter();
			String[] txIds = coinstack.getTransactions(YOUR_MUSICBLOCKCHAIN_ADDRESS);
			int i =1;
			for (String txId : txIds) {
				System.out.println("  txIds[]: "+txId);
				pw.print("<table ><tbody><tr><th>txId "+i+"</th><td style ='color:red;'> "+txId+"</td> </tr></tbody></table>");
				i++;
			}
			
		} catch (CoinStackException e) {
			e.printStackTrace();
		}		
		
	}
}
