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
		audioDTO audiodto = (audioDTO) request.getAttribute("audiodto");
	ArrayList<BitcoinAdressDTO> bitlist = (ArrayList<BitcoinAdressDTO>)request.getAttribute("bitlist");
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
		
				<% if(audiodto.getAudio_image()==null){%>
		<%System.out.println("오디오이미지 없음요"); %>
			<img src="/FairMusic/images/temp.png"
				class="img-circle img-responsive" alt="Placeholder image">
				<%}else{ %>
			<img src="/FairMusic/FM_audio_image/<%=audiodto.getAudio_code()%>.<%=audiodto.getAudio_image() %>" />
			<%} %>
				
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
						<legend>판매관리</legend>
						
							<h4>
								<%
									if (audiodto.getAudio_price() != null) {
								%>
								<div class="row">
									<div class="col-lg-12">
										<div class="row">
											<div class="col-lg-4">
												<h3><span class="label label-info">이름</span></h3>
											</div>
											<div class="col-lg-4">
												<h3><span class="label label-info">비트코인 계좌</span></h3>
											</div>
											<div class="col-lg-4">
												<h3><span class="label label-info">수익 비율 </span></h3>
											</div>
										</div>
										<% int size = bitlist.size();
										
											for(int i = 0; i<size;i++){
											BitcoinAdressDTO bdto = bitlist.get(i);
											%>
										<div class="row">
											<div class="col-lg-4">
												<h3><span class="label label-default"><%=bdto.getRighterName()%></span></h3>
											</div>
											<div class="col-lg-4">
												<h3><span class="label label-default"><%=bdto.getBitcoinAdress()%></span></h3>
											</div>
											<div class="col-lg-4">
												<h3><span class="label label-default"><%=bdto.getRighterVal()%></span></h3>
											</div>
										</div>
										<%} %>
									</div>
								</div>
								<%
									} else {
								%>
								<div class="row">
									<div class="col-lg-12">
									<h3><span class="label label-default">이 곡은 무료로 제공되는 컨텐츠입니다.</span></h3>
									
									</div>
								</div>

								<%
									}
								%>
							</h4>
						
					</fieldset>

				</div>
				<div class="col-sm-12">
					<fieldset>
						<legend>판매현황</legend>
						
							<h4>
							<h3><span class="label label-default">판매량</span> : <span class="label label-default">0</span></h3>
							
								<%
									if (audiodto.getAudio_price() != null) {
								%>
							<br/><h3><span class="label label-default">곡 [<%=audiodto.getAudio_title()%>]의 수익 : [0]</span></h3>

								<%
									}else{
								%>
								<br/><h3><span class="label label-default">곡 [<%=audiodto.getAudio_title()%>]은 [<%=audiodto.getAudio_copyrighter() %>]로 선택하셨기 때문에, 수익은 없습니다.</span></h3>
								<%} %>
								
							</h4>
						
					</fieldset>

				</div>
				<div class="col-sm-12">
					<fieldset>
						<legend>음원관리</legend>
							<button type="button" class="btn btn-primary" onclick="location.href = '/FairMusic/audiomanage.do?audio_code=<%=audiodto.getAudio_code()%>'"><h4>곡 삭제</h4></button>
						
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
