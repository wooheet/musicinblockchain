<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<script type="text/javascript">
      		function check(){
      			var form = document.authenform;
      			var authNum = ${authNum};
      			
      			if(!form.authnum.value){
      				alert("인증번호를 입력하세요.");
      				return false;
      			}
      			if(form.authnum.value!=authNum){
      				alert("인증번호가 일치하지 않습니다. 다시 입력해주세요.");
      				form.authnum.value==";"
      				return false;
      			}
      			if(form.authnum.value==authNum){
      				alert("인증완료");
      				opener.document.userinput.mailCheck.value="인증완료";
      				self.close();
      			}      			
      		}
      
      </script>
</head>
<body>
<body>
<div class="row">
  <div class="col-lg-12"><span class="label label-info">이메일 검증</span></div>
  <div class="col-lg-12">
<span class="label label-info">인증번호 7자리를 입력하세요</span>
	
		<input type="text" name ="authnum"/>
	
&nbsp;</div>
  <div class="col-lg-12">
  <form method="post" name ="authenform" onSubmit="return check();">
    <button type="button" class="btn btn-lg btn-default">확인</button>
    </form>
  &nbsp;</div>
</div>
</body>
</body>
</html>

