<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){ 
	$(".temptemp").hover(function() {
		$("button").show();
		
		},function(){
			$("button").hide();
		});
});


</script>
<style type="text/css">
	img {
		width: 200px;
		height : 200px;
	}
	img:HOVER {
	
	}
	.mainimage{
	position: absolute;
	}
	button{
	margin-left : 80px;
	margin-top: 80px;
	position: absolute;
	color: white;
	}
	p:HOVER{
	 
	}
</style>

</head>
<body>
<form>
<p class = "mainimage">
	<img alt="temp icon" src="/FairMusic/images/temp.png" class = "temptemp">
</p>
	<button type="button" hidden="true"><h1>▶</h1></button>
</form>
</body>
</html>