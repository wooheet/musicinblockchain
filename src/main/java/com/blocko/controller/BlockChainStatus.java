package com.blocko.controller;

import static org.junit.Assert.assertNotNull;
import io.blocko.coinstack.CoinStackClient;
import io.blocko.coinstack.exception.CoinStackException;
import io.blocko.coinstack.model.Block;
import io.blocko.coinstack.model.BlockchainStatus;
import io.blocko.coinstack.model.Transaction;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.blocko.api.API;
import com.blocko.dto.BlockChainStatusDTO;

@WebServlet(name = "BlockChainStatus", urlPatterns = { "/BlockChainStatus" })
public class BlockChainStatus extends HttpServlet {
	CoinStackClient coinstack = API.createNewCoinStackClient();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BlockchainStatus status;
		PrintWriter pw = response.getWriter();
		try {
			status = coinstack.getBlockchainStatus();
			String blockId = status.getBestBlockHash();
			System.out.println("  blockId: "+blockId);
			Block block = coinstack.getBlock(blockId);
			System.out.println("blockId: " + block.getBlockId());
			System.out.println("parentId: " + block.getParentId());
			System.out.println("height: " + block.getHeight());
			System.out.println("time: " + block.getBlockConfirmationTime());
			pw.print(block.getBlockId()+","+block.getParentId()+","+block.getHeight()+","+block.getBlockConfirmationTime());
			
		} catch (CoinStackException e) {
			e.printStackTrace();
		}
	}
}
