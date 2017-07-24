package com.fairmusic.follow.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fairmusic.dto.followDTO;
import com.fairmusic.follow.service.FollowService;
import com.fairmusic.follow.service.FollowServiceImpl;

@WebServlet(name = "follow", urlPatterns = { "/follow.do" })
public class followServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		
		String me = request.getParameter("me");
		String follower = request.getParameter("follower");
		
		System.out.println("follow서블릿에서의 내 코드 : "+me);
		System.out.println("follow서블릿에서의 팔로워 코드 : "+follower);
		String msg = "";
		// String me = loginuser.artist_code;
		// String follower = follow 버튼을 누른 artist의 artist_code;
		FollowService service = new FollowServiceImpl();
		followDTO dto = service.FOLLOW_CHECK(me, follower);
		System.out.println("follow서블릿에서의 dto : "+dto);
		//String check = dto.getFollow_good_alive();
		if (dto == null) {
			service.FOLLOW_INSERT(me, follower);
			msg = follower + "님을 팔로우 했습니다.";
		} else if (dto.getFollow_good_alive().equals("1")) {
			System.out.println("follow서블릿에서의 dto의 check number : "+dto.getFollow_good_alive());
			service.FOLLOW_UNFOLLOW(me, follower);
			msg = follower + "님을 언팔로우 했습니다.";
		} else if (dto.getFollow_good_alive().equals("0")) {
			System.out.println("follow서블릿에서의 dto의 check number : "+dto.getFollow_good_alive());
			service.FOLLOW_REFOLLOW(me, follower);
			msg = follower + "님을 다시 팔로우 했습니다.";
		}
		
		request.setAttribute("msg", msg);
		System.out.println("follow서블릿에서 넘겨준 msg : "+msg);
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/followTest.jsp");
		rd.forward(request, response);
	}
}
