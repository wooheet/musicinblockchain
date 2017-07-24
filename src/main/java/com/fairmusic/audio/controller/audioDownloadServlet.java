package com.fairmusic.audio.controller;

import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class audioDownloadServlet
 */
public class audioDownloadServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       String fileName = request.getParameter("file_name"); //get���� ���� ���� �ޱ�
	        String sDownloadPath = "C:/KITRI_ICT/workspace/webproject/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/FairMusic/FM_audio_file/";
	        String sFilePath = sDownloadPath + fileName;
	        
	        byte b[] = new byte[4096];
	        FileInputStream fileInputStream = new FileInputStream(sFilePath);
	        
	        String sMimeType = getServletContext().getMimeType(sFilePath);
	        
	        if(sMimeType == null) sMimeType = "application/octet-stream";
	        
	        response.setContentType(sMimeType);
	        
	        //�ѱ۾��ε�
	        String sEncoding = new String(fileName.getBytes("euc-kr"),"8859_1");
	        response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);
	        
	        ServletOutputStream servletOutStream = response.getOutputStream();
	        
	        int numRead;
	        while((numRead = fileInputStream.read(b,0,b.length))!= -1){
	            servletOutStream.write(b,0,numRead);            
	        }
	        
	        servletOutStream.flush();
	        servletOutStream.close();
	        fileInputStream.close();
	        

	}

}
