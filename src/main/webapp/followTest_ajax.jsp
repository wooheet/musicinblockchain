<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#ajaxbtn").on("click",function(){
			
			$.post("/FairMusic/follow_ajax.do",{"me":$("#me").val(),"follower":$("#follower").val()},success_run)				
		});
		$("#followinglistbtn").on("click",function(){
			
			$.get("/FairMusic/followingList.do?mycode="+follow_test.me.value,{"mycode":$("#me").val()},window.open("/FairMusic/followingList.do?mycode="+follow_test.me.value))				
		});
		$("#followerlistbtn").on("click",function(){
			
			$.get("/FairMusic/followerList.do?mycode="+follow_test.me.value,{"mycode":$("#me").val()},window.open("/FairMusic/followerList.do?mycode="+follow_test.me.value))				
		});
	});
	function success_run(txt){
		$("#result").html(txt);
	};
	</script>
</head>
<body>
	
	<h1>�ȷο� �׽�Ʈ</h1>
	<form name="follow_test">
		�� code : <input type="text" id="me" name="me"><br />
		�ȷο� code : <input type="text" id="follower" name="follower"><br />
		
	</form>
	<button type="button" id="ajaxbtn">�ȷο��ư</button><br />
	<div id="result" style="color: red;"></div><br />
	<button type="button" id="followinglistbtn">�ȷ��׸���Ʈ ��ȸ�ϱ�</button><br />
	<button type="button" id="followerlistbtn">�ȷο�����Ʈ ��ȸ�ϱ�</button><br />
	<!-- <a href="/FairMusic/followingList.do">�ȷ��� ����Ʈ</a> -->
	<!-- <a href="/FairMusic/followerList.do">�ȷο� ����Ʈ</a> -->

</body>
</html>