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

@WebServlet(name = "message_delete", urlPatterns = { "/message_delete.do" })
public class Message_delete_Servlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("메세지삭제 서블릿 ");
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String dm_code = request.getParameter("dm_code");
		String state = request.getParameter("state");
		
		System.out.println("메세지삭제서블릿 dm코드 : "+dm_code);
		
		MessageServiceImpl service = new MessageServiceImpl();
		int result = service.Message_Delete(dm_code);
		System.out.println("메세지 삭제~ : " +result);
		System.out.println("state값  : " +state);
		
		HttpSession ses = request.getSession();
		artistDTO dto = (artistDTO)ses.getAttribute("user");
		String artist_code = dto.getArtist_code();
		ArrayList<MessageDTO> messageList = service.MessageList(artist_code);
		
		
		String viewpath="";
		
		if(state.equals("1")){
			viewpath="../Message/Message.jsp";
		}else if(state.equals("0")){
			viewpath="../Message/newMessage.jsp";
		}else if(state.equals("2")){
			viewpath="../Message/Send_Message.jsp";
		}
		
		
		ses.setAttribute("messageList", messageList);
		
		RequestDispatcher rd = request.getRequestDispatcher("/view.do?viewpath="+viewpath);
		rd.forward(request, response);
		
	}

}
