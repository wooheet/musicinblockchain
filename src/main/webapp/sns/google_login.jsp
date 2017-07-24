<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="858926206600-4civml71qto6t35fd8hvosi4so9ku55e.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    
</head>
<body>
	<div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
    <script>
      function onSignIn(googleUser) {
        // Useful data for your client-side scripts:
        var profile = googleUser.getBasicProfile();
        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
        console.log('Full Name: ' + profile.getName());
        console.log('Given Name: ' + profile.getGivenName());
        console.log('Family Name: ' + profile.getFamilyName());
        console.log("Image URL: " + profile.getImageUrl());
        console.log("Email: " + profile.getEmail());
        
        document.getElementById('ID').innerHTML = 
				'Thanks for logging in, ' + profile.getId() + '!'; 
			document.getElementById('Full Name').innerHTML = 
				'name, ' + profile.getName() + '!'; 
			document.getElementById('Email').innerHTML = 
				'yourEmailID, ' + profile.getEmail() + '!'; 

        // The ID token you need to pass to your backend:
        var id_token = googleUser.getAuthResponse().id_token;
        console.log("ID Token: " + id_token);
      };
      function signOut() {
  	    var auth2 = gapi.auth2.getAuthInstance();
  	    auth2.signOut().then(function () {
  	      console.log('User signed out.');
  	    });
  	  };
    </script>
    
 	 <a href="#" onclick="signOut();">Sign out</a>
    <div id="ID"> </div><br/>
	<div id="Full Name"></div><br/>
	<div id="Email"></div>
</body>
</html>