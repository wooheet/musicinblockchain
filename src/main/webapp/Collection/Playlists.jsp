<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="Collection.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<header>
	 <br/>
        <jsp:include page="../CollectionTop.jsp"></jsp:include>
        <div class="label">Hear your own playlists and the playlists you’ve liked: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <input type="text" size = "30" value ="filter" style = "text-align:center; color:#cccccc;">
        
        <select name="filterSelect" style = "text-align:center; color:red;">
        	<option value="All">All</option>
    		<option value="Created">Created</option>
		    <option value="Liked">Liked</option>
		</select>
</div>
	 </header>
		<div id="content">
		        <div class="section3">
		            <div class="playlists_product">
		                <ul>
		                    <li><a href="#" alt="">music</a></li>
		                    <li><a href="#" alt="">music</a></li>
		                    <li><a href="#" alt="">music</a></li>
		                    <li><a href="#" alt="">music</a></li>
		                    <li><a href="#" alt="">music</a></li>
		                    <li><a href="#" alt="">music</a></li>
		                </ul>
		            </div>   
		        </div>
		 </div>
</body>
</html>