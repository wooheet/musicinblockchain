<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!docType html>
<html lang="ko">
<head>
	<title>카카오톡 로그인</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<a id="kakao-login-btn"></a>
	<script>
		$(document).ready(function(){
			Kakao.init("2c01299435b34c747838e7271ed23461");
			function getKakaotalkUserProfile(){
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						$("#kakao-profile").append(res.id,"<div/>");
						$("#kakao-profile").append(res.kaccount_email,"<div/>");
						$("#kakao-profile").append($("<img/>",{"src":res.properties.thumbnail_image}),"<div/>");
						$("#kakao-profile").append(res.properties.nickname+"님의 프로필 사진");
					},
					fail: function(error) {
						console.log(error);
					}
				});
			}
			function createKakaotalkLogin(){
				$("#kakao-logged-group .kakao-logout-btn").remove();
				/* var loginBtn = $("<a/>",{"class":"kakao-login-btn","text":"로그인"}); */
					Kakao.Auth.createLoginButton({
					    container: '#kakao-login-btn',
						persistAccessToken: true,
						persistRefreshToken: true,
						success: function(authObj) {
							getKakaotalkUserProfile();
							createKakaotalkLogout();
						},
						fail: function(err) {
							console.log(err);
						}
					});
				
				$("#kakao-logged-group").prepend(loginBtn)
			}
			function createKakaotalkLogout(){
				$("#kakao-login-btn").remove();
				var logoutBtn = $("<button/>",{"class":"kakao-logout-btn","text":"로그아웃"});
				logoutBtn.click(function(){
					Kakao.Auth.logout();
					createKakaotalkLogin();
					$("#kakao-profile").text("");
				});
				$("#kakao-logged-group").prepend(logoutBtn);
			}
			if(Kakao.Auth.getRefreshToken()!=undefined&&Kakao.Auth.getRefreshToken().replace(/ /gi,"")!=""){
				createKakaotalkLogout();
				getKakaotalkUserProfile();
			}else{
				createKakaotalkLogin();
			}
		});
	</script>
	<div id="kakao-logged-group"></div>
	<div id="kakao-profile"></div>
</body>
</html>