package com.fairmusic.artist.controller;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.dto.artistDTO;

public class ArtistRegist extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		Random r = new Random();
		
		String randomcode = (r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2)+(r.nextInt(98)+1) + getRandomString(2)+ (r.nextInt(98)+1) + getRandomString(2);
		System.out.println(randomcode);

		artistDTO artist = new artistDTO(randomcode, request.getParameter("artist_email"), request.getParameter("artist_pass"), request.getParameter("artist_name"), null, null, "1");
		 
	
		ArtistServiceimpl service = new ArtistServiceimpl();

		int result = service.regist(artist);

		if (result==1){
			System.out.println("가입함");
			//모달, 축하메세지 뜨게
			
		}
		request.setAttribute("viewpath", "../content.jsp");
		request.setAttribute("rightpath", "Side_Right.jsp");
		
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
		
		
		
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
