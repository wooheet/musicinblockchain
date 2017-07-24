package com.fairmusic.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.dto.MessageDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.message.service.MessageServiceImpl;

@WebServlet(name = "message_load", urlPatterns = { "/message_load.do" })
public class Message_Loading_Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter pw = response.getWriter();
		
		HttpSession ses = request.getSession();
		artistDTO dto = (artistDTO)ses.getAttribute("user");
		String artist_code = dto.getArtist_code();
		
		System.out.println("메세지로딩 서블릿 : "+dto);
		System.out.println("메세지로딩 서블릿 : "+artist_code);
		
		MessageServiceImpl service = new MessageServiceImpl();
		ArrayList<MessageDTO> messageList = service.MessageList(artist_code);
		
		ses.setAttribute("messageList", messageList);
		ses.setAttribute("artistDTO", dto);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view.do?viewpath=../Message/Message.jsp");
		
		rd.forward(request, response);
	}
}
