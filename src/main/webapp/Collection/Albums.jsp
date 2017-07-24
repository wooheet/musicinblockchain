<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="Collection.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<body>
	 <header>
	 <br/>
	 	<jsp:include page="../CollectionTop.jsp"></jsp:include>
        <div class="label">Hear the tracks you’ve liked: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;View
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" size = "30" value ="filter" style = "text-align:center; color:#cccccc;"></div>
	 </header>
	 <div id="content">
        <div class="section4">
            <div class="Albums_product">
                <ul>
                    <li><a href="#" alt="">likeAlbum</a></li>
                    <li><a href="#" alt="">likeAlbum</a></li>
                    <li><a href="#" alt="">likeAlbum</a></li>
                    <li><a href="#" alt="">likeAlbum</a></li>
                    <li><a href="#" alt="">likeAlbum</a></li>
                    <li><a href="#" alt="">likeAlbum</a></li>
                </ul>
            </div> 
            <div class="Albums_product">
                <ul>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                </ul>
            </div> 
            <div class="Albums_product">
                <ul>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                    <li><a href="#" alt="">likemusic</a></li>
                </ul>
            </div>         
        </div>
    </div>
</body>
</html>