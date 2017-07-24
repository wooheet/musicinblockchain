package com.fairmusic.message.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.dto.MessageDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.message.service.MessageServiceImpl;

@WebServlet(name = "message_send", urlPatterns = { "/message_send.do" })
public class Message_Send_Servlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		Random r = new Random();
		String randomcode = (r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2)+(r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2);
		System.out.println(randomcode);
		
		String DM_CODE = randomcode;
		HttpSession ses = request.getSession();
		artistDTO dto = (artistDTO)ses.getAttribute("user");
		String artist_code = dto.getArtist_code();
		System.out.println("메세지 서블릿 : "+dto);
		System.out.println("메세지 서블릿 : "+artist_code);
		String receiver_code = request.getParameter("to");
		String dm_content = request.getParameter("comment");
		System.out.println("to : "+receiver_code);
		System.out.println("comment : "+dm_content);
		String dm_read_state = "0";
		
		
		
		ArtistServiceimpl service_art = new ArtistServiceimpl();
		boolean check = service_art.emailCheck(receiver_code);
		
		String msg = "";
		int result = 0;
		if(check==true){
			MessageDTO Mdto = new MessageDTO(DM_CODE, artist_code, receiver_code, dm_content, dm_read_state);
			MessageServiceImpl service = new MessageServiceImpl();
			result = service.sendMessage(Mdto);
			msg = "메세지가 전송되었습니다.";			
		}else{
			msg = "받는분의 이메일주소를 다시 확인해주세요.";
		}
		
		System.out.println("메세지 전송 : "+result);
		pw.write(msg);
		
		
	}
	private String getRandomString(int length){
	  StringBuffer buffer = new StringBuffer();
	  Random random = new Random();
	 
	  char chars[] = {'a','b','c','d','e','f','g','h','i','j','k','l','n','m','o','p','q','r','s','t','u','v','w','x','y','z'};
	  
	 
	  for (int i=0 ; i<length ; i++)
	  {
	    buffer.append(chars[random.nextInt(chars.length)]);
	  }
	  return buffer.toString();
	}

}
