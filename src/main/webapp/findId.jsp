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
  	$(document).ready(function(){
  		$("#email_verify_id").on("click", function(){
  		 	if($("#artist_email").val()==""){
  				alert("�̸����� �Է��� �ּ���")	
  			}else{
  				 $.post("/FairMusic/emailFind.do", {"artist_email": $("#artist_email").val()}, success_email) 
  			} 
  		})
  	})
  	
  	function success_email(text){
  		$("#artist_email_check").html(text)
  	}

  </script>
</head>
<body>
<body>
<div class="row">
  <div class="col-lg-12">
  <span class="label label-info">���̵� ã��</span>&nbsp;&nbsp;
    <span id="artist_email_check" style="color: red"></span>
  </div>

  <div class="col-lg-12">
<span class="label label-info">�̸���</span>
<input type="text" name="textfield" id="artist_email">
&nbsp;</div>
  <div class="col-lg-12">
  
    <button type="button" class="btn btn-lg btn-default" id="email_verify_id">���̵� ã��</button>
  &nbsp;</div>
   
</div>
</body>
</body>
</html>