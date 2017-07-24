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

import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.service.FollowService;
import com.fairmusic.follow.service.FollowServiceImpl;

@WebServlet(name = "followerList", urlPatterns = { "/followerList.do" })
public class followerListServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		//HttpSession ses = request.getSession();
		//String loginuser = "";
		//ses.getAttribute("loginuser", loginuser);
		String mycode = request.getParameter("mycode");
		//String mycode ="1";
		System.out.println("팔로워 리스트 요청한 사람의 code=>"+mycode);
		FollowService service = new FollowServiceImpl();
		ArrayList<followDTO> followerList = service.FOLLOW_SEARCH_FOLLOWER(mycode);
		
		request.setAttribute("followerList", followerList);

		RequestDispatcher rd =
				request.getRequestDispatcher("/followerListTest.jsp");
		rd.forward(request, response);
	}
}
