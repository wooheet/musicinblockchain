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
  <span class="label label-info">��й�ȣ ã��</span>
  <span id="artist_email_check" style="color: red"></span>
  </div>
  <div class="col-lg-12">
<span class="label label-info">�̸���</span>
<input type="text" name="textfield" id="artist_email">
<button type="button" class="btn btn btn-default" id="email_verify_pass"  >�ӽú�й�ȣ �����ϱ�</button>
&nbsp;</div>
 <div class="col-lg-12">
 <br/>
<button type="button" class="btn btn btn-default" id="login" onclick="location.href='/FairMusic/login-no-sidebar.jsp'" >�α��� ȭ������ ���ư���</button>
 </div>
</div>
</form>
</body>
</body>
</html>