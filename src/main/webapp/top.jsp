<%@page import="com.fairmusic.dto.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.fairmusic.dto.artistDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="css/main.css" />
<title>Insert title here</title>

<script type="text/javascript">
</script>
</head>
<body>
 <% artistDTO user = (artistDTO) session.getAttribute("user"); %>
 <% ArrayList<MessageDTO> newMSG = (ArrayList<MessageDTO>) session.getAttribute("newMessageList"); %>
 <%if(user==null){%> 
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
					   <% }else{ %>
		<div id="header-wrapper">
		<form method="post" action="/FairMusic/view.do?viewpath=../Search/search.jsp&rightpath=Side_Right.jsp" name="mainform">
		<div id="header" class="container">
			<nav id="nav">
				<ul>
					<li><a href="/FairMusic/view.do?viewpath=../content.jsp&rightpath=Side_Right.jsp" >FairMusic</a></li>
					<li><a href="/FairMusic/view.do?viewpath=../Collection.jsp" >Collection</a></li>
					<li><input type="text" size="40" /></li>	
					<li><input type="submit" value="search"/></li>
					<li><a class="dropdown-toggle" data-toggle="dropdown" href="#">user</a>
					<ul>
						<!-- <li><a href="/FairMusic/followingList.do">Mypage</a></li> -->
						<li><a href="/FairMusic/second.do">Mypage</a></li>
						<li><a href="/FairMusic/have.do">HavingMusic</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../blockchainstatus/blockchainstatus.jsp">BlockChainStatus</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Playlists.jsp">PlayList</a></li>
						<li><a href="/FairMusic/followingList.do">Following</a></li>
						<li><a href="/FairMusic/view.do?viewpath=../Collection/Stations.jsp">Tracks</a></li>
					</ul>
				</li>
							
				<!-- <li><a href="/FairMusic/new_message_load.do">Message+</a></li> -->
					<% if(newMSG.size()!=0){ %>
					<li><img src="/FairMusic/images/newMSG.png" width="60" height="40" onclick="location.href='/FairMusic/new_message_load.do'"></li>
					<%}else{ %>
					<li><img src="/FairMusic/images/MSG.png"  width="60" height="40" onclick="location.href='/FairMusic/new_message_load.do'"></li>
					<%} %>
				<li><a href="/FairMusic/logout.do">Logout</a></li>
				</ul>
							</nav>
						</div>
						</form>
					</div>	
					<% } %>					   
	<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>						
							
</body>
</html>