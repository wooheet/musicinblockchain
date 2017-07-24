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
		<div>어드레스 </div>
		<input type = "submit" value ="bitcoin주소 발급"><br/>
		비트코인 주소 ==> ${MusicAddress}<br/>
		나의 비트코인 잔고 ==>${balance} BTC <br/>
		
	</form>
	
	<form method="post" action="#">
	보낼 주소 : <input type="text" placeholder="bitcoin-Address">
	</form> 
	
	
</body>
</html>