package com.fairmusic.seong;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServerPathServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		
		ServletContext context = this.getServletContext();
	    String realPath = context.getRealPath("/");
	    
	    String filepath = realPath+ "FM_audio_file";
	    String imagepath = realPath+ "FM_audio_image";
	    String videopath = realPath+ "FM_audio_video";
	    
	    request.setAttribute("filepath", filepath);
	    request.setAttribute("imagepath", imagepath);
	    request.setAttribute("videopath", videopath);
	}
}
