package com.fairmusic.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.dto.artistDTO;
import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.service.FollowService;
import com.fairmusic.follow.service.FollowServiceImpl;

@WebServlet(name = "followingList", urlPatterns = { "/followingList.do" })
public class followingListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		HttpSession ses = request.getSession();
		artistDTO loginuser = (artistDTO)ses.getAttribute("user");
		String mycode = loginuser.getArtist_code();
		//String mycode = request.getParameter("mycode");
		//String mycode ="1";
		System.out.println("팔로잉 리스트 요청한 사람의 code=>"+mycode);
		FollowService service = new FollowServiceImpl();
		ArrayList<followDTO> followinglist = service.FOLLOW_SEARCH_FOLLOWING(mycode);
		ArrayList<followDTO> followerlist = service.FOLLOW_SEARCH_FOLLOWER(mycode);
		request.setAttribute("followinglist", followinglist);
		request.setAttribute("followerlist", followerlist);
		request.setAttribute("viewpath", "../Collection/Following.jsp");

		RequestDispatcher rd =
				request.getRequestDispatcher("/layout/mainLayout.jsp");
		rd.forward(request, response);
		//response.sendRedirect("/FairMusic/MusicUpload/myFMpage.jsp");
	}
}
