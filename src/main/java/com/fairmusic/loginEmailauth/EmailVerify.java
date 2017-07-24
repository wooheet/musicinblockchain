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
		
		// �޴� ��� �̸��� �ּ� 
		String toEmail = request.getParameter("artist_email");  //request.getParameter("artist_id");
		String toName = toEmail;
		String subject = "FairMusic �̸��� �����Դϴ�.";
		String content = "������ȣ [" + authNum + "]";
		String authnum_check = request.getParameter("authnum_check");
		System.out.println("���� ��ȣ~~~~"+authnum_check);
		logic.sendMail(toEmail, toName, subject, content);
		System.out.println("���� �̸��ϼ���~~"+authNum);
		
		HttpSession ses = request.getSession();
		ses.setAttribute("authNum", authNum);
		
		
	}
}
