<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
   <title>Telephasic by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta name="google-signin-scope" content="profile email">
      <meta name="google-signin-client_id" content="858926206600-4civml71qto6t35fd8hvosi4so9ku55e.apps.googleusercontent.com">
	  <link rel="stylesheet" href="assets/css/main.css" />
      <script src="https://www.google.com/recaptcha/api.js" async defer></script>
      <script src="https://apis.google.com/js/platform.js" async defer></script> 
      <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="user-scalable=no, initial-scale=1.0,
	 maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
	 <script type="text/javascript">
		$(document).ready(function(){
			$("#email_verify_pass").on("click", function(){
				artist_email = passform.textfield.value;
				if(artist_email.length==0){
					alert("�̸����� �Է����ּ���")
				}else{
					$.post("/FairMusic/passFind.do", {"artist_email": artist_email}, success_email);
				}
			})			
		})
		
	function success_run(txt){
		$("#artist_email_check").html(txt)
	}
	   function FormSubmit() {
		      if (grecaptcha.getResponse() == "") {
		         alert("�κ��� �ƴ��� üũ�� �ּ���!");
		         return false;
		      
		      }else {
		         return true;
		      }
		      
      if (typeof (greCAPTCHA != 'undefined')) {
         if (greCAPTCHA.getResponsc() == "") { //�����ܿ��� �ѹ� �� üũ, 
         // ����ڰ� �����ϴ� ���� ������ ������ ���� ��ū �ο����� 
            alert("���Թ����ڵ带 Ȯ���� �ּ���.");
            return false;
         }
      } else {
         return false;
      }
   }
	</script> 
      <script type="text/javascript">
      /* ####################################################���̽��Ϸα���########################################################## */
      
      
      				var fb_code = "";
	 				var fb_name = "";
	 				var fb_state = null;
	 				
	 				
		function statusChangeCallback(response) {
	 		console.log('statusChangeCallback'); console.log(response); 
	 		// response ��ü�� ���� �α��� ���¸� ��Ÿ���� ������ �����ش�. 
	 		// �ۿ��� ������ �α��� ���¿� ���� �����ϸ� �ȴ�. 
	 		// FB.getLoginStatus().�� ���۷������� �� �ڼ��� ������ ���� �����ϴ�. 
	 		if (response.status === 'connected') { 
	 			// ���̽����� ���ؼ� �α����� �Ǿ��ִ�. 
	 				fb_code = response.id;
	 				fb_name = response.name;
	 				alert(fb_code);
	 				alert(fb_name);
	 			<%-- <%pageContext.forward("/layout/mainLayout.jsp"); %> --%>
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
			      appId      : '148079569074801',
			      cookie     : false,
			   // ��Ű�� ������ ������ �� �ֵ��� ��� 
			      xfbml      : true,
			   // �Ҽ� �÷������� ������ ó�� 
			      version    : 'v2.9'
			    });
			    FB.AppEvents.logPageView();   
			  };
		
		  
		  // SDK�� �񵿱������� ȣ�� 
		  (function(d, s, id) {
  			var js, fjs = d.getElementsByTagName(s)[0];
 			 if (d.getElementById(id)) return;
 			 js = d.createElement(s); js.id = id;
 			 js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=148079569074801";
 			 fjs.parentNode.insertBefore(js, fjs);
			}(document, 'script', 'facebook-jssdk'));
		  
		  	 
			// �α����� ������ �������� ������ �׷���API�� ȣ���Ѵ�. 
	 		// �� ȣ���� statusChangeCallback()���� �̷������. 
/* 	 		function testAPI() { 
	 			console.log('Welcome! Fetching your information.... '); 
	 			FB.api('/me', function(response) { 
	 				console.log(JSON.stringify(response));
	 				console.log('���̵� : ' + response.id);
	 				console.log('Successful login for : ' + response.name); 
	 				
	 				fb_code = response.id;
	 				fb_name = response.name;
	 				alert(fb_code);
	 				alert(fb_name);
	 				if(code!=""){
	 					fb_state = "success";
	 					 location.href="/FairMusic/login_fb.do?code="+fb_code+"&name="+encodeURIComponent(fb_name)+"&state="+fb_state; 
	 				}
	 				
	 				 document.getElementById('name').innerHTML = 
	 					'Thanks for logging in, ' + response.name + '!'; 
	 				document.getElementById('id').innerHTML = 
	 					'yourID, ' + response.id + '!'; 
	 			}); 
	 			
	 		} */
	 		
	 		function testAPI() {
	 	         FB.login(function(response) {
	 	                        if (response.authResponse) {
	 	                           console.log('Welcome!  Fetching your information.... ');
	 	                           FB.api('/me',function(response) {
	 	                              console.log('Good to see you, '
	 	                                    + response.email + '.');
	 	                              alert('Good to see you, '
	 	                                    + response.email + '.');
	 	                              alert('Good to see you, '
	 	                                    + response.id + '.');
	 	                              alert('Good to see you, '
	 	                                    + response.name + '.');
	 	                              
	 	                              /*fb_code = response.id;
	 	                              fb_name = response.name;
	 	                              state= "success"
	 	                               if(fb_code!=""){
	 	                            	  location.href="/FairMusic/login_fb.do?code="+fb_code+"&name="+encodeURIComponent(fb_name)+"&state="+fb_state; 
	 	                              } */
	 	                           });
	 	                        } else {
	 	                           console.log('User cancelled login or did not fully authorize.');
	 	                        }
	 	                     }, {scope : 'public_profile,email'});
	 	      };
			
	 	      
	 		function afterloginfacebook(){
	 			/* alert("login facebook?"); */
	 			//location.href="/FairMusic/login_fb.do?code="+fb_code+"&name="+encodeURIComponent(fb_name)+"&state="+fb_state;
	 		};

	</script>
	<!-- īī���� ���� -->
	<script type='text/javascript'>
    Kakao.init('2c01299435b34c747838e7271ed23461');
    function loginWithKakao() {
		Kakao.Auth.login({
			throughTalk : false,
			success: function(authObj) {
				/* alert(JSON.stringify(authObj)); */
		        Kakao.API.request({
		          url: '/v1/user/me',
		          success: function(res) {
		            /* alert(JSON.stringify(res)); */
		        	  code = res.id;
		        	  name = res.properties.nickname;
		        	  state = null;
		        	  if(code!=""){
		        		  state = "success";
		        		  location.href="/FairMusic/login_kk.do?code="+code+"&name="+encodeURIComponent(name)+"&state="+state;
		        	  } 
		          },
		          fail: function(error) {
		            alert(JSON.stringify(error));
		          }
		        });
	 	         if(authObj){
	      			 location.href="/FairMusic/login_kk.do?code="+code+"&name="+name+"&state="+state;
	    		} 
		      },
		      fail: function(err) {
		        alert(JSON.stringify(err));
		      }
		    });
		};
	function logoutWithKakao() {
		Kakao.Auth.logout(function(e){
    		if(e){
      			 location.href='login-no-sidebar.jsp';
    		}
    	});
	};

</script>
</head>
<body class="no-sidebar">
      <div id="page-wrapper">

         <!-- Main -->
            <div id="header-wrapper">
               <div class="container" id="main">
                  <div class="\35 0\25">
                  <!-- Content -->
                     <article id="content">
                        <header>
                           <h2>�α���</h2>
                        </header>
                     </article>
                  </div>
               </div>
            </div>

         <!-- Footer -->
            <div id="footer-wrapper">
               <div id="footer" class="container">
                  
                  <div class="row">
                     <section class="12u">
                        <form method="post" action="/FairMusic/login.do" onSubmit = "return FormSubmit();">
                           <div class="row 50%">
                              <div class="12u">
                           	   <h3 style="color: red">��ġ�ϴ� ������ �����ϴ�. �ٽ� �õ����ּ���.</h3><br/><br/>
                                 <input name="email" placeholder="���̵�" type="text"  id="email" style="color: black;"/>
                              </div>
                              <div class="12u">
                                 <input name="pass" placeholder="��й�ȣ" type="password" id="pass" style="color: black;"/>
                              </div>
                              
                              <!-- facebook########################### -->
								<div class="fb-login-button" data-max-rows="1" data-size="large"
									data-button-type="continue_with" data-show-faces="false"
									data-auto-logout-link="true" data-use-continue-as="false" data-scope="public_profile,email" onlogin="afterloginfacebook();">
									</div>
								<!-- kakao########################### -->
								<div>
								<a id="custom-login-btn" href="javascript:loginWithKakao()">
										<img
										src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg"
										width="260" />
									</a>
								</div>	
								<div>
									<a href="javascript:logoutWithKakao()">kakao logout</a>
								</div>
								
								<!-- google########################### -->
								<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
								<script type="text/javascript">
								      function onSignIn(googleUser) {
								    	var login="";
								        // Useful data for your client-side scripts:
								        var profile = googleUser.getBasicProfile();
								        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
								        console.log('Full Name: ' + profile.getName());
								        console.log('Given Name: ' + profile.getGivenName());
								        console.log('Family Name: ' + profile.getFamilyName());
								        console.log("Image URL: " + profile.getImageUrl());
								        console.log("Email: " + profile.getEmail());
									 	name = profile.getGivenName();
								        Email = profile.getEmail();
								        id = profile.getId();
								        if(name!=null && Email!=null && id!=null){
								        	loginUser_google = "success";
								        }else{
								        	loginUser_google = null;
								        }
								         
								   		  /*  document.getElementById('ID').innerHTML = 
												'Thanks for logging in, ' + profile.getId() + '!'; 
											document.getElementById('Full Name').innerHTML = 
												'name, ' + profile.getName() + '!'; 
											document.getElementById('Email').innerHTML = 
												'yourEmailID, ' + profile.getEmail() + '!'; 
								        // The ID token you need to pass to your backend:
								        var id_token = googleUser.getAuthResponse().id_token;
								        console.log("ID Token: " + id_token); */
								        location.href="/FairMusic/login_google.do?loginUser_google="+loginUser_google+"&code="+id+"&name="+encodeURIComponent(name);
								      };
								      function signOut() {
								  	    var auth2 = gapi.auth2.getAuthInstance();
								  	    auth2.signOut().then(function () {
								  	      console.log('User signed out.');
								  	    });
								  	  };
								    </script>
								    
								 	 <a href="#" onclick="signOut();">Sign out</a>
								 <!-- google########################### -->
	
	
								<div id="name"></div>
								<br />
								<div id="id"></div>
								
                              <div class="2u 12u" align="right">
                                 <ul class="actions">
                                    <li><input type="submit" value="�α���" /></li>
                                 </ul>
                              </div>
                              <div class="3u 12u">
                                 <input type="button" value="���̵� ã��" data-toggle="modal"
                  data-target="#findidModal" />
                              </div>
                              <div class="3u 12u">
                                 <input type="button" value="��й�ȣ ã��" data-toggle="modal"
                  data-target="#findpassModal" />
                              </div>
                              <div class="3u 12u">
                                 <input type="button" value="ȸ������" onclick="location.href='regist-no-sidebar.jsp'"/>
                              </div>
                              <div class="3u 12u">
                                 <input type="button" value="���ư���" onclick="location.href='/FairMusic/index.jsp'"/>
                              </div>
                              
                              <!-- �κ�����  -->
                            <div class="g-recaptcha"data-sitekey="6LeWpScUAAAAAEZHSU8Ofsqp1B06zp7EZCi1Oem_" style="float: right;"></div>
                           </div>
                           
                        </form>
                     </section>
                  </div>
               </div>
               <div id="copyright" class="container">
                  <ul class="menu">
                     <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="/FairMusic/index.jsp">FariMusic</a></li>
                  </ul>
               </div>
            </div>

      </div>
         
   
   <!--  ���̵�ã��     -->
   
    <div class="modal fade" id="findidModal" role="dialog">
       <div class="modal-dialog modal-lg">
         <!-- Modal content-->
      <div class="modal-content">
         <div class = "modal-header">
         <h3>���̵� ã��</h3>
      </div>
        <div class = "modal-body">
 			<jsp:include page="/findId.jsp"></jsp:include>
        </div>
        <div class="modal-footer">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
        </div>
     	 </div>
      </div>
   </div>  
   
   
   
   
   <!-- ��й�ȣã��  -->
     
    <div class="modal fade" id="findpassModal" role="dialog">
       <div class="modal-dialog modal-lg">
         <!-- Modal content-->
      <div class="modal-content">
         <div class = "modal-header">
         <h3>���̵� ã��</h3>
      </div>
        <div class = "modal-body">
 		 	<jsp:include page="/findpass.jsp"></jsp:include> 
        </div>
        <div class="modal-footer">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button>
        </div>
     	 </div>
      </div>
   </div>   
   </body>
</html>