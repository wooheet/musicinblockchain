package com.fairmusic.follow.controller;

import java.io.IOException;
import java.io.PrintWriter;

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

@WebServlet(name = "follow_ajax", urlPatterns = { "/follow_ajax.do" })
public class followAjaxServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("euc-kr");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		PrintWriter pw = response.getWriter();
		HttpSession ses = request.getSession();
		artistDTO loginuser = (artistDTO)ses.getAttribute("user");
		String me = loginuser.getArtist_code();
		String follower = request.getParameter("follower");

		System.out.println("follow서블릿에서의 내 코드 : " + me);
		System.out.println("follow서블릿에서의 팔로워 코드 : " + follower);
		String msg = "";
		// String me = loginuser.artist_code;
		// String follower = follow 버튼을 누른 artist의 artist_code;
		FollowService service = new FollowServiceImpl();
		followDTO dto = service.FOLLOW_CHECK(me, follower);
		artistDTO mydto = service.FOLLOW_GETID_BYCODE(me);
		artistDTO followerdto = service.FOLLOW_GETID_BYCODE(follower);
		System.out.println("follow서블릿에서의 dto : " + dto);
		// String check = dto.getFollow_good_alive();
		
		if(me.equals(follower)){
			msg="본인은 팔로우하지 않아도 되지 않을까요?";
		}
		else if (me.equals("") | follower.equals("")) {
			msg="잘못된 명령입니다.";
		}else{
			if (dto == null) {
				service.FOLLOW_INSERT(me, follower);
				msg = mydto.getArtist_name()+"님이 "+followerdto.getArtist_name() + "님을 팔로우 했습니다.";
			} else if (dto.getFollow_good_alive().equals("1")) {
				System.out.println("follow서블릿에서의 dto의 check number : "
						+ dto.getFollow_good_alive());
				service.FOLLOW_UNFOLLOW(me, follower);
				msg = mydto.getArtist_name()+"님이 "+followerdto.getArtist_name() + "님을 언팔로우 했습니다.";
			} else if (dto.getFollow_good_alive().equals("0")) {
				System.out.println("follow서블릿에서의 dto의 check number : "
						+ dto.getFollow_good_alive());
				service.FOLLOW_REFOLLOW(me, follower);
				msg = mydto.getArtist_name()+"님이 "+followerdto.getArtist_name() + "님을 다시 팔로우 했습니다.";
			}
		}

		System.out.println("follow서블릿에서 넘겨준 msg : " + msg);

		pw.print(msg);
	}
}
