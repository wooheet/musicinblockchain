package com.fairmusic.seong;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.album.service.AlbumService;
import com.fairmusic.album.service.AlbumServiceimpl;
import com.fairmusic.audio.service.AudioService;
import com.fairmusic.audio.service.AudioServiceimpl;
import com.fairmusic.dto.albumDTO;
import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.audioDTO;
import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.service.FollowService;
import com.fairmusic.follow.service.FollowServiceImpl;

/**
 * Servlet implementation class secondServlet
 */
public class secondServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		
		HttpSession ses = request.getSession();
		artistDTO loginuser = (artistDTO)ses.getAttribute("user");
		String mycode = loginuser.getArtist_code();
		
		System.out.println("팔로잉 리스트 요청한 사람의 code=>"+mycode);
		
		FollowService folservice = new FollowServiceImpl();
		ArrayList<followDTO> followinglist = folservice.FOLLOW_SEARCH_FOLLOWING(mycode);
		ArrayList<followDTO> followerlist = folservice.FOLLOW_SEARCH_FOLLOWER(mycode);
		
		request.setAttribute("followinglist", followinglist);
		request.setAttribute("followerlist", followerlist);

		artistDTO user = (artistDTO)request.getSession().getAttribute("user");
		String artist_code =user.getArtist_code();
		
		System.out.println("아티스트코드"+artist_code);
		
		AudioService service = new AudioServiceimpl();
		ArrayList<audioDTO> dtolist =service.myAudioList(artist_code);
		AlbumService alservice = new AlbumServiceimpl();

		ArrayList<albumDTO> aldtolist =alservice.myAlbumList(artist_code);
		request.setAttribute("myaudiolist", dtolist);
		request.setAttribute("myalbumlist", aldtolist);
		
		
		
		request.setAttribute("viewpath", "../MusicUpload/myFMpage.jsp");

		
		//4. 요청재지정
		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
	}

	

}
