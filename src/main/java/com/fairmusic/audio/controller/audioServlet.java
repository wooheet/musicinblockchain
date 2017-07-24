package com.fairmusic.audio.controller;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import com.blocko.controller.StampInsert;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.seong.fm_Code;




public class audioServlet extends HttpServlet {
	
	private String audio_code;
	private String audio_file;
	private String audio_image;
	private String audio_movie;
	private String audio_title;
	private String audio_jenre;
	private String audio_detail;
	private String album_code;
	private String audio_copyrighter;
	private String audio_price;
	
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
   private Map<String, String> SeongfileUpload(HttpServletRequest request, String randomvalue){
	   
	  Map<String, String> stampData = new HashMap<String, String>();
	  
      File settingdir = dirPath("factoryset");
      File imagedir = dirPath("audio_image");
      File filedir = dirPath("audio_file");
      File videodir = dirPath("audio_video");
      
      DiskFileItemFactory factory = new DiskFileItemFactory();
      factory.setSizeThreshold(10*1024);
      factory.setRepository(settingdir);
      ServletFileUpload upload = new ServletFileUpload(factory);
      upload.setSizeMax(100*1024*1024);
      upload.setHeaderEncoding("EUC-KR");
      try{
      List items = upload.parseRequest(request);
      System.out.println(items.size()+"개수");
         for(int i =0 ; i <items.size(); i++){
            FileItem item = (FileItem)items.get(i);
               if(item.getFieldName().equals("image_file")){
                  if(item.getName()!=""){

                     String[] ex = item.getName().split("\\.");
                     String tempname = randomvalue+"."+ex[1];
                     System.out.println(tempname);
                     audio_image = ex[1];
                     File imagefile = new File(imagedir,tempname);
                     item.write(imagefile);
                     System.out.println("audio_image_file saved in "+imagedir.getPath()+"\\"+tempname);
                  }
               }else if(item.getFieldName().equals("audio_file")){
                  if(item.getName()!=""){
                  String[] ex = item.getName().split("\\.");
                  String tempname = randomvalue+"."+ex[1];
                  audio_file = ex[1];
                  System.out.println(tempname);
                  File audiofile = new File(filedir,tempname);
                  item.write(audiofile);
                  byte[] audiobyte = FileUtils.readFileToByteArray(audiofile);
                  
                  //여기밑에
                  StampInsert tempstamp = new StampInsert();
                  stampData = tempstamp.insert(audio_code, audiobyte,request.getSession());
                  //여기위에쨘쨘
                  System.out.println("audio_file saved in "+filedir.getPath()+randomvalue+"."+ex[1]);
                  }
               }else if(item.getFieldName().equals("the-video-file-field")){
                  if(item.getName()!=""){
                  String[] ex = item.getName().split("\\.");
                  String tempname = randomvalue+"."+ex[1];
                  audio_movie = ex[1];
                  System.out.println(tempname);
                  File vediofile = new File(videodir,tempname);
                  item.write(vediofile);
                  System.out.println("audio_video_file saved in "+videodir.getPath()+randomvalue+"."+ex[1]);
                  }
                  }
         }
         
         audioDTOcreate(items);
      }catch(Exception _ex){
         System.out.println("에러 : ");
         _ex.printStackTrace();
      }
	return stampData;
   }
   
   private void audioDTOcreate(List items){
      for(int i =0 ; i <items.size(); i++){
           FileItem item = (FileItem)items.get(i);
           try{
              if(item.getFieldName().equals("audio_title")){
                 System.out.println("타이틀"+item.getString("UTF-8"));
                 audio_title = item.getString("UTF-8");
              }else if(item.getFieldName().equals("audio_genre")){
                 System.out.println("장르"+item.getString("UTF-8"));
                 audio_jenre = item.getString("UTF-8");
              }else if(item.getFieldName().equals("audio_album")){
                 System.out.println("앨범"+item.getString("UTF-8"));
                 album_code = item.getString("UTF-8");
              }else if(item.getFieldName().equals("audio_detail")){
                 System.out.println("설명"+item.getString("UTF-8"));
                 audio_detail = item.getString("UTF-8");
              }else if(item.getFieldName().equals("ccl_check")){
                 System.out.println("체크"+item.getString("UTF-8"));
                 audio_copyrighter = item.getString("UTF-8");
              }else if(item.getFieldName().equals("btc_value")){
                 System.out.println("밸류"+item.getString("UTF-8"));
                 audio_price = item.getString("UTF-8");
              }
           }catch(UnsupportedEncodingException e){
              e.printStackTrace();
           }
      }	
   
   }
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      request.setCharacterEncoding("utf-8");
      response.setHeader("cache-control", "no-cache,no-store");
      response.setContentType("text/html;charset=utf-8");

      audio_code = (String)request.getSession().getAttribute("audio_code");
      System.out.println("오디오 코드 Q빼앵뱽앵"+audio_code);
      Map<String, String> stampDataresult = SeongfileUpload(request,audio_code);
      System.out.println("스탬프데이터리절트"+stampDataresult);
      artistDTO loginUser=(artistDTO)request.getSession().getAttribute("user");
      audioDTO audio = new audioDTO(audio_code, audio_file, audio_image, audio_movie, audio_title,loginUser.getArtist_code(), audio_jenre, audio_detail, album_code, "sysdate", audio_copyrighter, audio_price,"1");
      //여기에서 카피라이터 dto 생성이랑 db에 집어넣기 등등등
      AudioService service = new AudioServiceimpl();
      System.out.println("오디오 되냐"+audio);
      int result=service.createAudio(audio);
      
      PrintWriter pw=response.getWriter();

      
      pw.write(stampDataresult.get("msg"));
      pw.write("○");
      pw.write(stampDataresult.get("MusicHash"));
      pw.write("○");
      pw.write(stampDataresult.get("stampId"));
    }
   
   
}