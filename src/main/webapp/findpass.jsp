<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<body>
<form id="passform" >
<div class="row">
  <div class="col-lg-12">
  <span class="label label-info">비밀번호 찾기</span>
  <span id="artist_email_check" style="color: red"></span>
  </div>
  <div class="col-lg-12">
<span class="label label-info">이메일</span>
<input type="text" name="textfield" id="artist_email">
<button type="button" class="btn btn btn-default" id="email_verify_pass"  >임시비밀번호 전송하기</button>
&nbsp;</div>
 <div class="col-lg-12">
 <br/>
<button type="button" class="btn btn btn-default" id="login" onclick="location.href='/FairMusic/login-no-sidebar.jsp'" >로그인 화면으로 돌아가기</button>
 </div>
</div>
</form>
</body>
</body>
</html>