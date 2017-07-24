package com.fairmusic.message.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.message.service.MessageServiceImpl;


@WebServlet(name = "message_read", urlPatterns = { "/message_read.do" })
public class Message_Read_Servlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Message_Read_Servlet ¼­ºí¸´ ");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		String dm_code = request.getParameter("dm_code");
		System.out.println("dmÄÚµå : "+dm_code);
		
		MessageServiceImpl service = new MessageServiceImpl();
		String content = service.Read_Message(dm_code);
		int result = service.Message_Read_StateUpdate(dm_code);
		String state = service.Message_Read_State(dm_code);
		
		
		System.out.println("¼­ºí¸´ state:"+state);
		System.out.println(result+" : state º¯°æÇì¤Àµû");
		System.out.println("¼­ºí¸´ ÄÁÅÙÆ® : "+content);
		
		HttpSession ses = request.getSession();
		ses.setAttribute("state", state);
		
		pw.write(content);
		
	}

}
