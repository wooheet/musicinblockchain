
package com.fairmusic.loginEmailauth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "email_check", urlPatterns = { "/email_check.do" })
public class EmailVeryfy_check extends HttpServlet {
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("EmailVeryfy_check 서블릿");
      response.setContentType("text/html;charset=euc-kr");
      response.setHeader("cache-control", "no-cache, no-store");
      PrintWriter pw = response.getWriter();
      HttpSession ses = request.getSession();
      String authNum = (String)ses.getAttribute("authNum");
      String authNum_check = (String)request.getParameter("authnum_check");
      
      System.out.println("authNum : "+authNum);
      System.out.println("authnum_check : "+authNum_check);
      
      String msg = "";
      String result = "0";
      
      if(authNum_check.equals("")){
         msg = "인증번호를 입력해주세요.";
         result = "0";
      }else if(!authNum.equals(authNum_check)){
         msg = "인증번호가 일치하지 않습니다.";
         result = "0";
      }else if(authNum.equals(authNum_check)){
         msg = "인증되었습니다.";
         result = "1";
      }
      
      String test = msg+"/"+result;

      System.out.println("EmailVeryfy_check result : "+result);
      pw.print(test);
      
   }

}