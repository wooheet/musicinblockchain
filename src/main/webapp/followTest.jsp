<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<%
		String data = (String)request.getAttribute("msg");
		System.out.println("follow�������� �Ѿ�� msg : "+data);
		String msg="";
		if(data!=null){
			msg=data;
		}
	%>
</head>
<body>
	<h1>�ȷο� �׽�Ʈ</h1>
	<form name="follow_test" action="/FairMusic/follow.do" method="post">
		�� code : <input type="text" id="me" name="me"><br/>
		�ȷο� code : <input type="text" id="follower" name="follower"><br/>
		<input type="submit" value="�ȷο��ϱ�">
		
	</form>
	
	<a href="/FairMusic/followingList.do">�ȷ��� ����Ʈ</a>
	<a href="/FairMusic/followerList.do">�ȷο� ����Ʈ</a>
	
</body>
</html>