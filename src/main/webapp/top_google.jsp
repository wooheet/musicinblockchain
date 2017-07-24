<%-- <%@page import="com.fairmusic.dto.artistDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/main.css" />
<title>Insert title here</title>
<script type="text/javascript">
function signOut() {
		alert("호출돼???")
	    var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	      console.log('User signed out.');
	    });
	  };
</script>
</head>
<body>
 <% String loginUser_google = (String)session.getAttribute("loginUser_google"); 
 	if(loginUser_google==null){%> 
	<div id="header-wrapper">
		<form method="post" action="/FairMusic/view.do?viewpath=../Search/search.jsp&rightpath=Side_Right.jsp" name="mainform">
		<div id="header" class="container">
			<nav id="nav">
				<ul>
					<li><a href="/FairMusic/view.do?viewpath=../content.jsp&rightpath=Side_Right.jsp" >FairMusic</a></li>
					<li><input type="text" size="40" /></li>	
					<li><input type="submit" value="search"/></li>
					<li><a href="regist-no-sidebar.jsp">Create Account</a></li>
					<li><a href="login-no-sidebar.jsp">Login</a></li>
					</ul>
								</nav>
						</div>
						</form>
					</div>
					<%}else{ %>
		<div id="header-wrapper">
		<form method="post" action="/FairMusic/view.do?leftpath=Side_Left.jsp&viewpath=../Search/search.jsp&rightpath=Side_Right.jsp" name="mainform">
		<div id="header" class="container">
			<nav id="nav">
				<ul>
					<li><a href="/FairMusic/view.do?leftpath=Side_Left.jsp&viewpath=../content.jsp&rightpath=Side_Right.jsp" >FairMusic</a></li>
					<li><a href="/FairMusic/view.do?viewpath=../Collection.jsp" >Collection</a></li>
					<li><input type="text" size="40" /></li>	
					<li><input type="submit" value="search"/></li>
					<!-- <li><a href="#">Upload</a></li> -->
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">user</a>
					<ul>
						<li><a href="/FairMusic/view.do?viewpath=../MusicUpload/myFMpage.jsp">Mypage</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Likes.jsp">Likes</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Playlists.jsp">PlayList</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Following.jsp">Following</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Stations.jsp">Tracks</a></li>
					</ul>
				</li>
							
				<li><a href="/FairMusic/view.do?leftpath=Side_Left_Message.jsp">Message</a></li>
				<li><a href="/FairMusic/logout_Google.do" onclick="signOut();">Logout</a></li>
				</ul>
							</nav>
						</div>
						</form>
					</div>				
					   <%} %>
	<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>						
							
</body>
</html> --%>