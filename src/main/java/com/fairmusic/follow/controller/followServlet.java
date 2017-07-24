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
		
		System.out.println("follow���������� �� �ڵ� : "+me);
		System.out.println("follow���������� �ȷο� �ڵ� : "+follower);
		String msg = "";
		// String me = loginuser.artist_code;
		// String follower = follow ��ư�� ���� artist�� artist_code;
		FollowService service = new FollowServiceImpl();
		followDTO dto = service.FOLLOW_CHECK(me, follower);
		System.out.println("follow���������� dto : "+dto);
		//String check = dto.getFollow_good_alive();
		if (dto == null) {
			service.FOLLOW_INSERT(me, follower);
			msg = follower + "���� �ȷο� �߽��ϴ�.";
		} else if (dto.getFollow_good_alive().equals("1")) {
			System.out.println("follow���������� dto�� check number : "+dto.getFollow_good_alive());
			service.FOLLOW_UNFOLLOW(me, follower);
			msg = follower + "���� ���ȷο� �߽��ϴ�.";
		} else if (dto.getFollow_good_alive().equals("0")) {
			System.out.println("follow���������� dto�� check number : "+dto.getFollow_good_alive());
			service.FOLLOW_REFOLLOW(me, follower);
			msg = follower + "���� �ٽ� �ȷο� �߽��ϴ�.";
		}
		
		request.setAttribute("msg", msg);
		System.out.println("follow�������� �Ѱ��� msg : "+msg);
		
		RequestDispatcher rd =
				request.getRequestDispatcher("/followTest.jsp");
		rd.forward(request, response);
	}
}
