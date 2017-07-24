package com.fairmusic.album.controller;

import io.blocko.apache.commons.codec.binary.Hex;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.seong.fm_Code;


public class albumServlet extends HttpServlet {
	private String album_code;
	private String album_title;
	private String artist_code;
	private String album_image;
	private String album_date;
	private String album_dc;
	private String album_detail;
	private String album_alive;
	
	private File dirPath(String type){
	      ServletContext context = this.getServletContext();
	      String realPath = context.getRealPath("/");
	      String dirName = realPath+ "FM_"+type;
	      File dir = new File(dirName);
	      if(!dir.exists()){
	         dir.mkdir();
	      }
	      return dir;
	   }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	     response.setHeader("cache-control", "no-cache,no-store");
	     response.setContentType("text/html;charset=utf-8");

		File settingdir = dirPath("factoryset");
	    File albumimagedir = dirPath("album_image");
		
	    DiskFileItemFactory factory = new DiskFileItemFactory();
	      factory.setSizeThreshold(10*1024);
	      factory.setRepository(settingdir);
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      upload.setSizeMax(100*1024*1024);
	      upload.setHeaderEncoding("EUC-KR");
	      
	      
	      fm_Code fmcode = new fm_Code();
		String randomcode =fmcode.uniqueCode(20);
		album_code = randomcode;
	      try{
	    	  List items = upload.parseRequest(request);
	    	  for(int i =0 ; i <items.size(); i++){
	              FileItem item = (FileItem)items.get(i);
	                 if(item.getFieldName().equals("album_image_file")){
	                    if(item.getName()!=""){
	                       String[] ex = item.getName().split("\\.");
	                       String tempname = randomcode+"."+ex[1];
	                       System.out.println(tempname);
	                       album_image = tempname;
	                       File imagefile = new File(albumimagedir,tempname);
	                       item.write(imagefile);
	                       System.out.println("audio_image_file saved in "+albumimagedir.getPath()+"\\"+tempname);
	                    }
	                 }else if(item.getFieldName().equals("album_title")){

	                	 album_title = item.getString("UTF-8");
	                	System.out.println("¾Ù¹üÅ¸ÀÌÆ²"+album_title);
	                 }else if(item.getFieldName().equals("album_image_file")){
	                	 album_image = item.getString("UTF-8");
	                 }else if(item.getFieldName().equals("album_sale")){
	                	 album_dc=item.getString("UTF-8");
	                	 
	                 }else if(item.getFieldName().equals("album_detail")){
	                	 album_detail=item.getString("UTF-8");
	                 }
	                	 
	    	  }
	      }catch(Exception e){
	    	  
	      }
	      
		
		
		artistDTO user = (artistDTO)request.getSession().getAttribute("user");
		
		albumDTO album = new albumDTO(album_code, album_title, user.getArtist_code(), album_image, "sys", album_dc, album_detail, "1");
		
		AlbumService service = new AlbumServiceimpl();
		
		System.out.println("¾Ù¹ü µðÆ¼¿À"+album);
		int result = service.createAlbum(album);

		if (result==1){
			System.out.println("¾Ù¹ü»ðÀÔ ¼º°ø");
			
			
			
		}else{
			System.out.println("¾Ù¹ü»ðÀÔ ½ÇÆÐ");
		}

	
		//4. ¿äÃ»ÀçÁöÁ¤
		RequestDispatcher rd =
				request.getRequestDispatcher("/FairMusic/second.do");
		rd.forward(request, response);
		
		
	    	  
	}
	
}
