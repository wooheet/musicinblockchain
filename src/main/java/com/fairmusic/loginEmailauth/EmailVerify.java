package com.fairmusic.loginEmailauth;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EmailVerify extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		EmailLogic logic = new EmailLogic();
		String authNum = logic.RandomNum();
		
		// 받는 사람 이메일 주소 
		String toEmail = request.getParameter("artist_email");  //request.getParameter("artist_id");
		String toName = toEmail;
		String subject = "FairMusic 이메일 인증입니다.";
		String content = "인증번호 [" + authNum + "]";
		String authnum_check = request.getParameter("authnum_check");
		System.out.println("서블릿 번호~~~~"+authnum_check);
		logic.sendMail(toEmail, toName, subject, content);
		System.out.println("여기 이메일서블릿~~"+authNum);
		
		HttpSession ses = request.getSession();
		ses.setAttribute("authNum", authNum);
		
		
	}
}
