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
       <ol class="list-group">
         <li class="list-group-item disabled">조성원님의 최근 게시글</li>
          <li class="list-group-item">

<jsp:include page="/ten.do"></jsp:include>
        <%ArrayList<audioDTO> dtolist = (ArrayList<audioDTO>)request.getAttribute("recent10"); %>
        <% if(dtolist!=null){%>
        <%int size = dtolist.size(); %>
        <%if(size!=0){ %>
        <%for(int i = 0; i < size;i++){ %>
        <%audioDTO dto = dtolist.get(i); %>
        
		<a href="/FairMusic/audiopage.do?audio_code=<%=dto.getAudio_code()%>">바로가기</a>
		<button type = "button" onclick ="window.open('/FairMusic/audiopage.do?audio_code=<%=dto.getAudio_code()%>')"> 상세페이지 이동 </button>
<hr/>
		<%} %>
		<%} %>
	<%} %> 
<%-- 		<jsp:include page="/widget.do">
		<jsp:param value="33857szat02s2q8h21l3" name="audio_code"/>
		<jsp:param value="1" name="audioindex"/>
		</jsp:include>   --%>
		

		

		 
 	 	   
	 
		
<%--<a href= "/FairMusic/widget.do">서블릿->웹</a>
         <jsp:include page ="/widget.do"></jsp:include> --%>
 			<%-- <jsp:include page="<%= application.getContextPath()%>/widget/fmWidget.jsp">
         <jsp:param value="e6ddn02ie17ngn4a1l44" name="audio_code"/>
         </jsp:include>  --%>
         
<%--          <%
	RequestDispatcher dispather = request.getRequestDispatcher("/widget.do?audio_code=e6ddn02ie17ngn4a1l44");
         
	dispather.include(request,response);
%> --%>
<%-- <% if(request.getRequestURL().equals("http://localhost:8088/FairMusic/layout/mainLayout.jsp")){ %>
<jsp:include page="/widget.do">
		<jsp:param value="e6ddn02ie17ngn4a1l44" name="audio_code"/>
		</jsp:include>
<%} %> --%>
<%--          <% if(request.getRequestURL().equals("http://localhost:8088/FairMusic/layout/mainLayout.jsp")){ %>
         <jsp:include page="../widget/fmWidget.jsp">
         <jsp:param value="e6ddn02ie17ngn4a1l44" name="audio_code"/>
         </jsp:include>
         <%}else{ %>
         <jsp:include page="widget/fmWidget.jsp">
         <jsp:param value="e6ddn02ie17ngn4a1l44" name="audio_code"/>
         </jsp:include>
         <%} %> --%>
         
         
       
         <%-- <jsp:include page="/widget/temp2widget.jsp"></jsp:include> --%>
<!--           </li>
          <li class="list-group-item disabled">한준희님의 최근 게시글</li>
          <li class="list-group-item">
          <a href="#"><img src="/FairMusic/images/M.PNG" class="img-thumbnail" alt="Cinque Terre" width="200" height="200"></a>
          <a href="#">한준희</a>-<a href="#"> 냠냠송</a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          </li>
          <li class="list-group-item disabled">우해원님의 최근 게시글</li>
          <li class="list-group-item">
          <a href="#"><img src="/FairMusic/images/M.PNG" class="img-thumbnail" alt="Cinque Terre" width="200" height="200"></a>
          <a href="#">한준희</a>-<a href="#"> 수박송</a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          <a href="#"><img src="/FairMusic/images/like.PNG" class="img-thumbnail" alt="Cinque Terre" width="20" height="20"></a>
          </li>    -->   
          
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