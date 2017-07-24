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
		System.out.println("PassFindServlet ����~");
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache, no-store");
		PrintWriter pw = response.getWriter();
		String email = request.getParameter("artist_email");
		System.out.println("��й�ȣã�� �̸��� : "+email);
		ArtistServiceimpl service = new ArtistServiceimpl();
		boolean check = service.emailCheck(email);
		String msg = "";
		EmailLogic logic = new EmailLogic();
		
		String newPass = "asdf"+logic.RandomNum();
		String toName = email;
		String subject = "FairMusic �ӽ� ��й�ȣ�Դϴ�.";
		String content = "�ӽú�й�ȣ [" + newPass + "]";
		
		System.out.println("newPass : "+newPass);
		
		if(check==true){
			msg = "�̸����� ���۵Ǿ����ϴ�.";
			logic.sendMail(email, toName, subject, content);
			HttpSession ses = request.getSession();
			int result = service.pass_update(email, newPass);
			System.out.println(result+" ��ȣ����");
		}else{
			msg = "��ġ�ϴ� ����ڰ� �����ϴ�.";
		}
		pw.write(msg);
	}

}
