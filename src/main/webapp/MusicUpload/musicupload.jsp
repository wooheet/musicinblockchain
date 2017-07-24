<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@page import = "com.fairmusic.seong.fm_Code"%>
<%@page import="com.fairmusic.dto.albumDTO"%>
<%@page import="com.fairmusic.dto.audioDTO"%>
<!DOCTYPE html>

<html>

<head>

<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link
	href="//cdnjs.cloudflare.com/ajax/libs/foundation/5.3.3/css/foundation.min.css"
	rel="stylesheet" />



<style type="text/css">
#audio_fan_02.row.paddong {
	padding-top: 1px;
}

#dropzone {
	position: relative;
	border: 10px dotted #ff7088;
	border-radius: 20px;
	color: #ff7088;
	font: bold 24px/200px arial;
	height: 300px;
	margin: 30px auto;
	text-align: center;
	width: 300px;
}

#dropzone.hover {
	border: 10px solid #ffd0d1;
	color: #ffd0d1;
}

#dropzone.dropped {
	background: #ffd0d1;
	border: 10px solid #ff7088;
}

#dropzone div {
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}

#dropzone img {
	border-radius: 10px;
	vertical-align: middle;
	max-width: 95%;
	max-height: 95%;
}

#dropzone [type="file"] {
	cursor: pointer;
	position: absolute;
	opacity: 0;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
}

.real_audio_file {
	position: relative;
	left: 25%;
	background: #ffeeee;
	width: 500px;
	height: 200px;
	border: 4px dashed #ff7088;
}

.real_audio_file p {
	width: 100%;
	height: 100%;
	text-align: center;
	line-height: 170px;
	color: #ff7088;
	font-family: Arial;
}

.real_audio_file input {
	position: absolute;
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	outline: none;
	opacity: 0;
	padding: 0;
}
</style>

</head>



<body>
<% fm_Code code = new fm_Code();

String audio_code = code.uniqueCode(20);
%>
<% session.setAttribute("audio_code", audio_code);%>

	
	<form id="audioUploadForm" name="audioUploadForm" method="post"
		enctype="multipart/form-data" action="/FairMusic/audio.do">

		<div role="tabpanel">

			<ul class="nav nav-tabs" role="tablist">

				<li role="presentation" class="active"><a href="#audio_fan_01"
					data-toggle="tab" role="tab" aria-controls="tab1">���� �⺻����</a></li>

				<li role="presentation"><a href="#audio_fan_02"
					data-toggle="tab" role="tab" aria-controls="tab2">���� �й� ����</a></li>

				<li role="presentation"><a href="#audio_fan_03"
					data-toggle="tab" role="tab" aria-controls="tab3">�������� ���ε�</a></li>

				<li role="presentation"><a href="#audio_fan_04"
					data-toggle="tab" role="tab" aria-controls="tab4">+��������</a></li>



			</ul>

			<div id="tabContent1" class="tab-content">

				<div role="tabpanel" class="tab-pane fade in active"
					id="audio_fan_01">

					<div class="row">

						<div class="col-xs-4">

							<div id="dropzone">

								<div>dropzone</div>

								<input type="file" accept="image/png, application/pdf"
									id="image_file" name="image_file" />

							</div>

						</div>

						<div class="col-xs-8">

							<div class="row">

								<div class="col-xs-2">

									<span class="label label-info">���� ��</span>

								</div>

								<div class="col-xs-10">

									<input type="text" name="audio_title" id="audio_title"
										required="required">

								</div>

								<div class="col-xs-2">

									<span class="label label-info">�帣</span>

								</div>

								<div class="col-xs-10">

									<select name="audio_genre" id="audio_genre">
										<option>�߶��</option>
										<option>Ʈ��Ʈ</option>
										<option>��</option>
										<option>����</option>
										<option>����</option>
										<option>��������</option>
										<option>����</option>
										<option>��</option>
										<option>�ο�</option>
										<option>����</option>
										<option>����</option>
										<option>��Ʈ��</option>
										<option>Ŭ����</option>
										<option>����Ż</option>
										<option>����</option>
										<option>OST</option>
										<option>����</option>
										<option>�ִ�</option>
									</select>

								</div>

								<div class="col-xs-2">

									<span class="label label-info">�ٹ�</span>
								</div>

								<div class="col-xs-10">

									<select name="audio_album" id="audio_album">
										<%
											ArrayList<albumDTO> dtoalbumlist = (ArrayList<albumDTO>)request.getAttribute("myalbumlist");
										%>
										<%
											if(dtoalbumlist!=null){
																				for(int i = 0; i <dtoalbumlist.size();i++){
																					albumDTO dto = dtoalbumlist.get(i);
										%>
										<%
											System.out.println(dto.getAlbum_title());
										%>
										<option value="<%= dto.getAlbum_code()%>"><%=dto.getAlbum_title()%></option>
										<%
											}
																	}
										%>
									</select>
								</div>
								<div class="col-xs-2">
									<span class="label label-info">�Ұ�</span>
								</div>
								<div class="col-xs-10">
									<textarea name="audio_detail" id="audio_detail"></textarea>



								</div>

							</div>

						</div>

					</div>



				</div>

				<div role="tabpanel" class="tab-pane fade" id="audio_fan_02">

					<div class="row">

						<div class="col-sm-12">

							<select class="form-control" id="ccl_check" name="ccl_check">

								<option>����</option>

								<option>����������</option>

								<option>����̿����</option>

								<option>����</option>

							</select>

							<div id="audio_price" hidden="true">

								<input type="text" placeholder="0 BTC" id="btc_value"
									name="btc_value">

							</div>

						</div>

					</div>

					<div class="row">

						<div class="col-sm-1"></div>



						<div class="col-sm-10">

							<div id="copy_money" hidden="true">

								<div class="row">

									<div class="col-sm-6">

										<span class="label label-primary" id="rightName">���۱��� ��</span>

									</div>

									<div class="col-sm-3">

										<span class="label label-primary" id="percent">���� ����</span>

									</div>

									<div class="col-sm-3">

										<span class="label label-primary">���� ���</span>

									</div>

								</div>

								<div class="row" class="cp1">

									<div class="col-sm-6">

										<input type="text" name="cp1name" id="cp1name">

									</div>

									<div class="col-sm-3">

										<input type="text" name="cp1rate" id="cp1rate">

									</div>

									<div class="col-sm-3">
										<script type="text/javascript">
											var state1 = 0;
											var state2 = 0;
											var state3 = 0;
											$(document).ready(function() {
													$("#create1").on("click",function() {	
														if($("#cp1name").val()=="" || $("#cp1rate").val()=="" || $("#btc_value").val()==""){
															alert("���� ��� �Է��� �ּ���! ���� ���� ��� 0 �Է�")
														}else{
															if (state1 == 1) {
																alert("�̹� �����߽��ϴ�.")
															}else{
																$.post("/FairMusic/bitcoinaddr",{
																	"cpname" : $("#cp1name").val(),
																		"cprate" : $("#cp1rate").val()*$("#btc_value").val()
																		},success_run1);
															}
														}
													})
													$("#create2").on("click",function() {	
														if($("#cp2name").val()=="" || $("#cp2rate").val()=="" ||
																$("#btc_value").val()==""){
															alert("���� ��� �Է��� �ּ���! ���� ���� ��� 0 �Է�")
														}else{
															if (state2 == 1) {
																alert("�̹� �����߽��ϴ�.")
															}else{
																$.post("/FairMusic/bitcoinaddr",{
																	"cpname" : $("#cp2name").val(),
																		"cprate" : $("#cp2rate").val()*$("#btc_value").val()
																		},success_run2);
															}
														}
													})
													$("#create3").on("click",function() {
												
														if($("#cp3name").val()=="" || $("#cp3rate").val()=="" ||
																$("#btc_value").val()==""){
															alert("���� ��� �Է��� �ּ���! ���� ���� ��� 0 �Է�")
														}else{
															if (state3 == 1) {
																alert("�̹� �����߽��ϴ�.")
															}else{
																$.post("/FairMusic/bitcoinaddr",{
																	"cpname" : $("#cp3name").val(),
																		"cprate" : $("#cp3rate").val()*$("#btc_value").val()
																		},success_run3);
															}
														}
													})
											})

											function success_run1(txt) {
												state1 = 1;
												 data = txt.split(",");
											      addr = data[0]; 
											      val = data[1];
											         
												$("#createAddr1").html(addr+"<br/>"+val);
											}

										/* 	var state2 = 0;
											$(document).ready(function() {
													$("#create2").on("click",function() {
											if (state2 == 1) {
													alert("�̹� �����߽��ϴ�.")
											}else if($("#cp2name").val()==null || $("#cp2rate").val()==null || $("#btc_value").val()==null ){
												alert("���� ��� �Է��� �ּ���! ���� ���� ��� 0 �Է�")
											} else {
												$.post("/FairMusic/bitcoinaddr",{
							  							"cpname" : $("#cp2name").val(),
															"cprate" : $("#cp2rate").val()*$("#btc_value").val()
														},success_run2)
													}
												})
											}) */

											function success_run2(txt) {
												state2 = 1;
												data = txt.split(",");
											      addr = data[0]; 
											      val = data[1];
												$("#createAddr2").html(addr+"<br/>"+val);
											}
											
										
											/* $(document).ready(function() {
												$("#create3").on("click",function() {
													if (state3 == 1) {
															alert("�̹� �����߽��ϴ�.")
													}else if($("#cp3name").val()==null || $("#cp3rate").val()==null || $("#btc_value").val()==null ){
														alert("���� ��� �Է��� �ּ���! ���� ���� ��� 0 �Է�")
													} else {
														$.post("/FairMusic/bitcoinaddr",{
															"cpname" : $("#cp3name").val(),
																"cprate" : $("#cp3rate").val()*$("#btc_value").val()
														},success_run3)
													}

												})
											}) */

											function success_run3(txt) {
												state3 = 1;
												data = txt.split(",");
											      addr = data[0]; 
											      val = data[1];
												$("#createAddr3").html(addr+"<br/>"+val);
											}
										</script>
										<button type="button" class="btn btn-info" id="create1">����</button>
										<button type="button" class="btn btn-info" data-toggle="modal"
											data-target="#PayModal">���</button>

									</div>

									<!-- =====================================���  ���===================================================== -->
									<div class="modal fade" id="PayModal" role="dialog">
										<div class="modal-dialog modal-lg">
											<!-- Modal content-->
											<div class="modal-content">
												<div class="modal-header">
													<h3>bitcoin Adress</h3>
												</div>
												<div class="modal-body">
													<div class="row">
														<div class="col-lg-12">
															<span class="label label-info">Bitcoin Adress</span>
														</div>
														<div class="col-lg-12">
															<input type="text" name="btcaddr" id="btcaddr" />
														</div>
													</div>

												</div>

												<div class="modal-footer">
													<button type="submit" class="btn btn-lg btn-default"
														id="email_verify_check">Ȯ��</button>
												</div>

											</div>
										</div>
									</div>




								</div>
								<div id="createAddr1" style="color: red;"></div>
								<div class="row" class="cp2">

									<div class="col-sm-6">

										<input type="text" name="cp2name" id="cp2name">

									</div>

									<div class="col-sm-3">

										<input type="text" name="cp2rate" id="cp2rate">

									</div>

									<div class="col-sm-3">

										<button type="button" class="btn btn-info" id="create2">����</button>

										<button type="button" class="btn btn-info" data-toggle="modal"
											data-target="#PayModal2">���</button>

									</div>


								</div>
								<div id="createAddr2" style="color: red;"></div>
								<!-- =====================================���  ���===================================================== -->
								<div class="modal fade" id="PayModal2" role="dialog">
									<div class="modal-dialog modal-lg">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h3>bitcoin Adress</h3>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-lg-12">
														<span class="label label-info">Bitcoin Adress</span>
													</div>
													<div class="col-lg-12">
														<input type="text" name="btcaddr" id="btcaddr" />
													</div>
												</div>

											</div>

											<div class="modal-footer">
												<button type="submit" class="btn btn-lg btn-default"
													id="email_verify_check">Ȯ��</button>
											</div>

										</div>
									</div>
								</div>

								<div class="row" class="cp3">

									<div class="col-sm-6">

										<input type="text" name="cp3name" id="cp3name">

									</div>

									<div class="col-sm-3">

										<input type="text" name="cp3rate" id="cp3rate">

									</div>

									<div class="col-sm-3">

										<button type="button" class="btn btn-info" id="create3">����</button>

										<button type="button" class="btn btn-info" data-toggle="modal"
											data-target="#PayModal3">���</button>

									</div>

								</div>
								<div id="createAddr3" style="color: red;"></div>


								<!-- ====================================���  ���===================================================== -->
								<div class="modal fade" id="PayModal3" role="dialog">
									<div class="modal-dialog modal-lg">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h3>bitcoin Adress</h3>
											</div>
											<div class="modal-body">
												<div class="row">
													<div class="col-lg-12">
														<span class="label label-info">Bitcoin Adress</span>
													</div>
													<div class="col-lg-12">
														<input type="text" name="btcaddr" id="btcaddr" />
													</div>
												</div>

											</div>

											<div class="modal-footer">
												<button type="submit" class="btn btn-lg btn-default"
													id="email_verify_check">Ȯ��</button>
											</div>

										</div>
									</div>
								</div>

							</div>

							<div id="ccl_info" hidden="true">

								<div class="row">

									<div class="col-sm-6">

										<span class="label label-primary">�����ϼ���~~~</span>

									</div>

								</div>

							</div>

						</div>





						<div class="col-sm-1"></div>

					</div>

				</div>



				<div role="tabpanel" class="tab-pane fade" id="audio_fan_03">

					<div class="row">



						<div class="col-xs-12">

							<fieldset>

								<legend>Audio File</legend>

								<div class="real_audio_file" id="real_audio_div"
									name="real_audio_div">

									<input type="file" id="audio_file" name="audio_file" accept = "audio/*">

									<p>

										Drag your <b>Audio</b> here! or click in this area.

									</p>

								</div>

							</fieldset>

						</div>

					</div>

					<div class="row">

						<div class="col-xs-12">

							<fieldset>

								<legend>����</legend>


							</fieldset>

						</div>

					</div>

				</div>

				<div role="tabpanel" class="tab-pane fade" id="audio_fan_04">

					<div class="row">

						<div class="col-xs-12">

							<fieldset>



								<h1>Load An mp4 file</h1>

								<input type="file" id="the-video-file-field"
									name="the-video-file-field" accept = "video/*">

								<div id="data-vid" class="large-8 columns">

									<!--video will be inserted here.-->

								</div>

								<h2 id="name-vid"></h2>

								<p id="size-vid"></p>

								<p id="type-vid"></p>



							</fieldset>

						</div>

					</div>



				</div>

			</div>

			<div></div>

		</div>



	</form>





</body>

</html>