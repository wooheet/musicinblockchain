<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%
		String data = (String)request.getAttribute("msg");
		System.out.println("follow서블릿에서 넘어온 msg : "+data);
		String msg="";
		if(data!=null){
			msg=data;
		}
	%>
</head>
<body>
	<h1>팔로우 테스트</h1>
	<form name="follow_test" action="/FairMusic/follow.do" method="post">
		내 code : <input type="text" id="me" name="me"><br/>
		팔로워 code : <input type="text" id="follower" name="follower"><br/>
		<input type="submit" value="팔로우하기">
		
	</form>
	
	<a href="/FairMusic/followingList.do">팔로잉 리스트</a>
	<a href="/FairMusic/followerList.do">팔로워 리스트</a>
	
</body>
</html>