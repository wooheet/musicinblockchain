<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%-- 	<% String loginUser_google = (String)session.getAttribute("loginUser_google"); 
	if(loginUser_google==null){%>
	<jsp:include page="../top.jsp"></jsp:include>
	<% }else{ %>
	<jsp:include page="../top_google.jsp"></jsp:include>
	<% } %> --%>
	<jsp:include page="../top.jsp"></jsp:include>
	<div class="container-fluid text-center">
		<div class="row">
			<% if(request.getAttribute("leftpath")==null && request.getAttribute("rightpath")==null ){
				System.out.println("이경우다");%>
				 <div class="col-sm-1"></div> 
				<div class="col-sm-10">
					<jsp:include page="${viewpath}"></jsp:include>
				</div>
				 <div class="col-sm-1"></div> 
			<% }else if(request.getAttribute("leftpath")!=null && request.getAttribute("rightpath")!=null){ %>
				<div class="col-sm-3">
					<jsp:include page="${leftpath}"></jsp:include>
				</div>
				<div class="col-sm-6">
					<jsp:include page="${viewpath}"></jsp:include>
				</div>
				<div class="col-sm-3">
					<jsp:include page="${rightpath}"></jsp:include>
				</div>
			<% }else if(request.getAttribute("rightpath")==null){ %> 
				<div class="col-sm-3">
					<jsp:include page="${leftpath}"></jsp:include>
				</div>
				<div class="col-sm-9">
					<jsp:include page="${viewpath}"></jsp:include>
				</div>	
				<% }else if(request.getAttribute("leftpath")==null){ %>	
				<div class="col-sm-9">
					<jsp:include page="${viewpath}"></jsp:include>
				</div>	
				<div class="col-sm-3">
					<jsp:include page="${rightpath}"></jsp:include>
				</div>				
				<% } %>	
		</div>
	</div>
	
	<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>		
</body>
</html>
