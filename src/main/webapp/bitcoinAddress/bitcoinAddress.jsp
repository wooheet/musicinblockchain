<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	
	 <form method="post" action="/FairMusic/bitcoinaddr">
		<div>��巹�� </div>
		<input type = "submit" value ="bitcoin�ּ� �߱�"><br/>
		��Ʈ���� �ּ� ==> ${MusicAddress}<br/>
		���� ��Ʈ���� �ܰ� ==>${balance} BTC <br/>
		
	</form>
	
	<form method="post" action="#">
	���� �ּ� : <input type="text" placeholder="bitcoin-Address">
	</form> 
	
	
</body>
</html>