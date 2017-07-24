<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	
</head>
<body>
<script type="text/javascript">
		function sharetwitter(url,text) {
			window.open("https://twitter.com/intent/tweet?text="+ text + "&url=" + url);
		}
	</script>
	<div><a href ="javascript:sharetwitter('http://localhost:8088/FairMusic/index.jsp','share')" ><img src="/FairMusic/images/tweet.PNG"></a> </div>
</body>
</html>