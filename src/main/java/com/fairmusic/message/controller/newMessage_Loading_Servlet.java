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

@WebServlet(name = "new_message_load", urlPatterns = { "/new_message_load.do" })
public class newMessage_Loading_Servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		PrintWriter pw = response.getWriter();
		
		HttpSession ses = request.getSession();
		artistDTO dto = (artistDTO)ses.getAttribute("user");
		String artist_code = dto.getArtist_code();
		
		System.out.println("안읽은 메세지로딩 서블릿 : "+dto);
		System.out.println("안읽은 메세지로딩 서블릿 : "+artist_code);
		
		MessageServiceImpl service = new MessageServiceImpl();
		ArrayList<MessageDTO> newMessageList = service.NewMessage(artist_code);
		
		ses.setAttribute("newMessageList", newMessageList);
		ses.setAttribute("artistDTO", dto);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/view.do?viewpath=../Message/newMessage.jsp");
		
		rd.forward(request, response);
	}
}
