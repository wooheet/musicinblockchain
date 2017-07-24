<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<html>
	<head>
<meta name="viewport" content="width=device-width, initial-scale=1">	

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	</head>
	<body>
			<jsp:include page="top.jsp"></jsp:include>
	<div class="container-fluid text-center">
		<div class="row">
				<div class="col-sm-9">
					<jsp:include page="content.jsp"></jsp:include>
				</div>
				<div class="col-sm-3">
					<jsp:include page="layout/Side_Right.jsp"></jsp:include>
				</div>
		</div>
	</div>
				<jsp:include page="/serpath.do"></jsp:include>

				<!-- Scripts -->

 			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script> 
	</body>
</html>