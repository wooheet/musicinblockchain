<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%@ page import="java.util.ArrayList" %>
<%@page import="com.fairmusic.dto.audioDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>



<meta charset="utf-8">
<!-- fbshare -->
  <meta property="og:url"           content="http://naver.com" />
  <meta property="og:type"          content="website" />
  <meta property="og:title"         content="FairMusic" />
  <meta property="og:description"   content="Your description" />
  <meta property="og:image"         content="http://localhost:8088/FairMusic/images/M.PNG" />
  <!-- tweetshare -->
  
  <script type="text/javascript">
		function sharetwitter(url,text) {
			window.open("https://twitter.com/intent/tweet?text="+ text + "&url=" + url);
		}
	</script>
	
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="/FairMusic/widget/js/widget.js"></script>
	<style>
.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.desc {
	padding: 15px;
	text-align: center;
}

#content .section1 div {
	margin-top: 10px;
	height: 300px;
	text-align: center;
}

#content .music_product ul li {
	list-style: none;
	float: left;
	margin: 0 15px 0 0;
	width: 200px;
	height: 200px;
	border: 1px solid #cccccc;
	box-sizing: border-box;
	cursor: pointer;
}

.mainimg{
width: 400px;
border: 1px;
border-color: orange;
}
.mainimgno{
width: 400px;
height : 200px;
border: 1px;
border-color: orange;
}
</style>

<script type="text/javascript">
/* 	
	$(document).ready(function() {
		for (var i = 0; i < 10; i++) {
			$("<h1>무한 스크롤</h1>").appendTo("div#mainview");
		}
	});
	
	$(document).ready(function() {
		//스크롤 이벤트 발생 시
		$(window).scroll(function() {
			var scrollHeight = $(window).scrollTop() + $(window).height();
			var documentHeight = $(document).height();
			if (scrollHeight = documentHeight) {
				for (var i = 0; i < 20; i++) {
					$("<h2>무한 스크롤2 </h2>").appendTo("div#mainview");
				}
			}
		});
	}); */
	
</script>
</head>
<body>

<div id="mainview">
      <div class="row">
      <div class="12u">
      <br/><br/>
      <jsp:include page="/ten.do"></jsp:include>

       <ol class="list-group">
               <%ArrayList<audioDTO> dtolist = (ArrayList<audioDTO>)request.getAttribute("recent10"); %>
        <% if(dtolist!=null){%>
        <%int size = dtolist.size(); %>
        <%if(size!=0){ %>
        <%for(int i = 0; i < size;i++){ %>
        <%audioDTO dto = dtolist.get(i); %>
         <li class="list-group-item disabled"><%=dto.getAudio_date() %></li>
          <li class="list-group-item">


        
        <h3>
						<span class="label label-default">
						<%=dto.getAudio_title() %>
						</span>
					</h3>
        <br/>
		<%if(dto.getAudio_image()!=null){ %>
		<a href="/FairMusic/audiopage.do?audio_code=<%=dto.getAudio_code()%>" ><img class = "mainimg" alt="사진" src="/FairMusic/FM_audio_image/<%=dto.getAudio_code()%>.<%=dto.getAudio_image()%>"></a>
		<%}else{ %>
		<a href="/FairMusic/audiopage.do?audio_code=<%=dto.getAudio_code()%>" ><img class = "mainimgno" alt="사진" src="/FairMusic/images/line.png"></a>
		<%} %>
<hr/>
 

          
          </li>
          		<%} %>
		<%} %>
	<%} %>
          
          
          
      </ol>
      </div>
      </div>
      	<div id="fb-root"></div>
		<script>(function(d, s, id) {
			  var js, fjs = d.getElementsByTagName(s)[0];
				  if (d.getElementById(id)) return;
				  js = d.createElement(s); js.id = id;
				  js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&version=v2.9&appId=349635012119334";
				  fjs.parentNode.insertBefore(js, fjs);
				}
				(document, 'script', 'facebook-jssdk'));
		</script>
		
		  <span><a href ="javascript:sharetwitter('http://localhost:8088/FairMusic/index.jsp','share')" ><img src="/FairMusic/images/tweet.PNG"></a> </span>
		  
		  <div class="fb-share-button" data-href="http://naver.com" 
		  data-layout="box_count" data-size="small" data-mobile-iframe="true"><a class="fb-xfbml-parse-ignore" target="_blank" 
		  href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse">공유하기</a>
		  </div>
		  
   </div>
   
</body>
</html>