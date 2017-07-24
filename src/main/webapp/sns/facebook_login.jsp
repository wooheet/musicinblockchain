<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<script>
		function statusChangeCallback(response) {
	 		console.log('statusChangeCallback'); console.log(response); 
	 		// response ��ü�� ���� �α��� ���¸� ��Ÿ���� ������ �����ش�. 
	 		// �ۿ��� ������ �α��� ���¿� ���� �����ϸ� �ȴ�. 
	 		// FB.getLoginStatus().�� ���۷������� �� �ڼ��� ������ ���� �����ϴ�. 
	 		if (response.status === 'connected') { 
	 			// ���̽����� ���ؼ� �α����� �Ǿ��ִ�. 
	 			
	 			testAPI(); 
	 			} else if (response.status === 'not_authorized') { 
	 				// ���̽��Ͽ��� �α��� ������, �ۿ��� �α����� �Ǿ����� �ʴ�. 
	 				document.getElementById('status').innerHTML = 'Please log ' + 'into this app.'; 
	 			} else { 
	 					// ���̽��Ͽ� �α����� �Ǿ����� �ʴ�. ����, �ۿ� �α����� �Ǿ��ִ��� ���ΰ� ��Ȯ���ϴ�. 
	 					document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.'; 
	 			} 
	 		}
		  function checkLoginState() {
			    FB.getLoginStatus(function(response) {
			      statusChangeCallback(response);
			    });
			}
		  
		  window.fbAsyncInit = function() {
			    FB.init({
			      appId      : '349635012119334',
			      cookie     : true,
			   // ��Ű�� ������ ������ �� �ֵ��� ��� 
			      xfbml      : true,
			   // �Ҽ� �÷������� ������ ó�� 
			      version    : 'v2.8'
			    });
			    FB.AppEvents.logPageView();   
			  };
		
		  
		  // SDK�� �񵿱������� ȣ�� 
		  (function(d, s, id){
		     var js, fjs = d.getElementsByTagName(s)[0];
		     if (d.getElementById(id)) {return;}
		     js = d.createElement(s); js.id = id;
		     js.src = "//connect.facebook.net/en_US/sdk.js";
		     fjs.parentNode.insertBefore(js, fjs);
		   }(document, 'script', 'facebook-jssdk'));
		  
		
			// �α����� ������ �������� ������ �׷���API�� ȣ���Ѵ�. 
	 		// �� ȣ���� statusChangeCallback()���� �̷������. 
	 		function testAPI() { 
	 			console.log('Welcome! Fetching your information.... '); 
	 			FB.api('/me', function(response) { 
	 				
	 				console.log(JSON.stringify(response));
	 				console.log('���̵� : ' + response.id);
	 				console.log('Successful login for : ' + response.name); 
	 				console.log('email : ' + response.Email);
	 				
	 				document.getElementById('name').innerHTML = 
	 					'Thanks for logging in, ' + response.name + '!'; 
	 				document.getElementById('id').innerHTML = 
	 					'yourID, ' + response.id + '!'; 
	 				document.getElementById('email').innerHTML = 
	 					'yourEmailID, ' + response.Email + '!'; 
	 			}); 
	 			
	 		}

	</script>
		   
	<!-- �Ʒ��� �Ҽ� �÷��������� �α��� ��ư�� �ִ´�. �� ��ư�� �ڹٽ�ũ��Ʈ SDK�� �׷��� ����� �α��� ��ư�� �־ Ŭ���� FB.login() �Լ��� �����ϰ� �ȴ�. --> 
	
	<fb:login-button scope="public_profile,email" onlogin="checkLoginState();">
	</fb:login-button>

	<div id="fb-root"></div>	
		
	<div class="fb-login-button"   data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="true" data-auto-logout-link="true" data-use-continue-as="false"></div>
	
	<div id="name"> </div><br/>
	<div id="id"></div><br/>
	<div id="email"></div>

</body>
</html>

