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
	
	<h1>팔로우 테스트</h1>
	<form name="follow_test">
		내 code : <input type="text" id="me" name="me"><br />
		팔로워 code : <input type="text" id="follower" name="follower"><br />
		
	</form>
	<button type="button" id="ajaxbtn">팔로우버튼</button><br />
	<div id="result" style="color: red;"></div><br />
	<button type="button" id="followinglistbtn">팔로잉리스트 조회하기</button><br />
	<button type="button" id="followerlistbtn">팔로워리스트 조회하기</button><br />
	<!-- <a href="/FairMusic/followingList.do">팔로잉 리스트</a> -->
	<!-- <a href="/FairMusic/followerList.do">팔로워 리스트</a> -->

</body>
</html>