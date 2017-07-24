package com.fairmusic.artist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fairmusic.artist.service.ArtistServiceimpl;
import com.fairmusic.loginEmailauth.EmailLogic;

@WebServlet(name = "passFind", urlPatterns = { "/passFind.do" })
public class PassFindServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("PassFindServlet 실행~");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("artist_email");
		System.out.println("비밀번호찾기 이메일 : "+email);
		ArtistServiceimpl service = new ArtistServiceimpl();
		boolean check = service.emailCheck(email);
		String msg = "";
		EmailLogic logic = new EmailLogic();
		
		String newPass = "asdf"+logic.RandomNum();
		String toName = email;
		String subject = "FairMusic 임시 비밀번호입니다.";
		String content = "임시비밀번호 [" + newPass + "]";
		
		System.out.println("newPass : "+newPass);
		
		if(check==true){
			msg = "이메일이 전송되었습니다.";
			logic.sendMail(email, toName, subject, content);
			HttpSession ses = request.getSession();
			int result = service.pass_update(email, newPass);
			System.out.println(result+" 암호변경");
		}else{
			msg = "일치하는 사용자가 없습니다.";
		}
		pw.write(msg);
	}

}
