<%@page import="io.blocko.apache.http.impl.client.AIMDBackoffManager"%>
<%@page import="com.subgraph.orchid.Document"%>
<%@page import="com.fairmusic.dto.artistDTO"%>
<%@page import="com.blocko.dto.BlockChainStatusDTO"%>
<%@page import="com.fairmusic.dto.followDTO"%>
<%@page import="com.blocko.controller.MyBtcAddrReq"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@page import="com.fairmusic.dto.albumDTO"%>
<%@page import="com.fairmusic.dto.audioDTO"%>
<%@page import="com.blocko.dto.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/FairMusic/MusicUpload/js/range.js"></script>


<style>
.loadingpage {
	background: #0d8aa5;
}

.loading {
	background: #0d8aa5;
	position: absolute;
	left: 50%;
	top: 50%;
	margin: -60px 0 0 -60px;
	background: #fff;
	width: 100px;
	height: 100px;
	border-radius: 100%;
	border: 10px solid #19bee1;
}

.loading:after {
	content: '';
	background: trasparent;
	width: 140%;
	height: 140%;
	position: absolute;
	border-radius: 100%;
	top: -20%;
	left: -20%;
	opacity: 0.7;
	box-shadow: rgba(255, 255, 255, 0.6) -4px -5px 3px -3px;
	animation: rotate 2s infinite linear;
}

@
keyframes rotate { 0% {
	transform: rotateZ(0deg);
}

100%
{
transform




:


 


rotateZ




(360
deg


);
}
}
div #stampstatus>#bg {
	position: absolute;
	margin-left: 2%;
	margin-right: auto;
	display: block;
	min-width: 90%;
	min-height: 95.5%;
	background-image: url('../images/certificate2.jpg');
	background-repeat: no-repeat;
}

.modal-dialog.modal-80size {
	width: 80%;
	height: 80%;
	margin: 0;
	padding: 0;
}

.modal-content.modal-80size {
	margin-left: 20%;
	/*  height: 10%;
		   width: 100%;
		  min-height: 80%; */
}
/* 		.modal-content.modal-80size.modal-body.header{
		  height: 120%;
		  min-height: 120%;
		  text-align: center;
		  margin-left: 200%;
		}  */
</style>

</head>
<body>			
	<%
	
	audioDTO audiodto = (audioDTO)request.getAttribute("audiodto");
	String musicHash = (String)request.getAttribute("musicHash");
	String txId = (String)request.getAttribute("txId");
	int Confirmations = (Integer)request.getAttribute("Confirmations");
	
	%>
	<div class="row">
		<div class="col-sm-12">
		<br/>
		<br/>
		
			<img src="/FairMusic/images/miniline.png" />
		</div>
	</div>
	<div class="row">
		<div class="col-sm-3">
			<img src="/FairMusic/images/temp.png"
				class="img-circle img-responsive" alt="Placeholder image">
		</div>
		<div class="col-sm-9">
			<div class="row">
				<div class="col-sm-5">
					<h1><span class="label label-info"><%=audiodto.getAudio_title()%></span></h1>
				</div>

				<div class="col-sm-4 col-sm-offset-0"></div>
				<div class="col-sm-3"><%=audiodto.getAudio_code()%></div>
				<div class="col-sm-12">
					<fieldset>
						<legend>musicHash</legend>
								<div class="row">	
	
									<div class="col-lg-4">
									<h3><span class="label label-default">musicHash</span></h3>
									
									</div>
									<div class="col-lg-8">
									<h3><span class="label label-default"><%= musicHash%></span></h3>
									</div>
								</div>
					</fieldset>
				</div>
				<div class="col-sm-12">
					<fieldset>
						<legend>txId</legend>
								<div class="row">
									<div class="col-lg-4">
									<h3><span class="label label-default">txId</span></h3>
									
									</div>
									<div class="col-lg-8">
									<h3><span class="label label-default"><%= txId%></span></h3>
									</div>
								</div>
					</fieldset>
				</div>
				<div class="col-sm-12">
					<fieldset>
						<legend>Confirmations</legend>
								<div class="row">
									<div class="col-lg-4">
									<h3><span class="label label-default">Confirmations</span></h3>
									
									</div>
									<div class="col-lg-8">
									<h3><span class="label label-default"><%= Confirmations%></span></h3>
									</div>
								</div>
					</fieldset>
				</div>
				<div class="col-sm-12">
					<fieldset>
						<legend>ㄴㅇㄹㄴㅇㄹ</legend>
								<div class="row">
									<div class="col-lg-4">
									<h3><span class="label label-default">ㄴㅇㄹㅇㄴ</span></h3>
									
									</div>
									<div class="col-lg-8">
									<h3><span class="label label-default">타임스탬프자리</span></h3>
									</div>
								</div>
					</fieldset>
				</div>
				
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<img src="/FairMusic/images/miniline.png" />
			</br/>
		</div>
	</div>


</body>
</html>
