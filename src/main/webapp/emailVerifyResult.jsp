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
      				alert("������ȣ�� �Է��ϼ���.");
      				return false;
      			}
      			if(form.authnum.value!=authNum){
      				alert("������ȣ�� ��ġ���� �ʽ��ϴ�. �ٽ� �Է����ּ���.");
      				form.authnum.value==";"
      				return false;
      			}
      			if(form.authnum.value==authNum){
      				alert("�����Ϸ�");
      				opener.document.userinput.mailCheck.value="�����Ϸ�";
      				self.close();
      			}      			
      		}
      
      </script>
</head>
<body>
<body>
<div class="row">
  <div class="col-lg-12"><span class="label label-info">�̸��� ����</span></div>
  <div class="col-lg-12">
<span class="label label-info">������ȣ 7�ڸ��� �Է��ϼ���</span>
	
		<input type="text" name ="authnum"/>
	
&nbsp;</div>
  <div class="col-lg-12">
  <form method="post" name ="authenform" onSubmit="return check();">
    <button type="button" class="btn btn-lg btn-default">Ȯ��</button>
    </form>
  &nbsp;</div>
</div>
</body>
</body>
</html>

