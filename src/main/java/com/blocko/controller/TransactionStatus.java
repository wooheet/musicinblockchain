package com.blocko.controller;

import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Block;
import io.blocko.coinstack.model.BlockchainStatus;
import io.blocko.coinstack.model.Transaction;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocko.api.API;

@WebServlet(name = "TransactionStatus", urlPatterns = { "/TransactionStatus" })
public class TransactionStatus extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlockchainStatus status;
		try {
			status = coinstack.getBlockchainStatus();
			String blockId = status.getBestBlockHash();
			System.out.println("  blockId: "+blockId);
			Block block = coinstack.getBlock(blockId);
			String[] txIds = block.getTransactionIds();
			PrintWriter pw = response.getWriter();
			for (int x=1, len=txIds.length; x<len; x++) {
				String txId = txIds[x];
				System.out.println("    - txId "+x+": "+txId);
				Transaction tx = coinstack.getTransaction(txId);
				System.out.println("      inputs.cnt: "+tx.getInputs().length);
				System.out.println("      outs.cnt: "+tx.getOutputs().length);
				pw.print("<table><tbody ><tr><th>"+txId+"</th></tr> <tr><td style='border-bottom:2px solid red'> &nbsp&nbsp&nbsp&nbsp&nbspinputs.cnt:"+tx.getInputs().length+"&nbsp&nbsp&nbsp&nbsp&nbspouts.cnt:"+tx.getOutputs().length+"</td></tr></tbody></table>");
				if (x > 9) {
					break;
				}
			}
			
			
		} catch (CoinStackException e) {
			e.printStackTrace();
		}
		
	}
}