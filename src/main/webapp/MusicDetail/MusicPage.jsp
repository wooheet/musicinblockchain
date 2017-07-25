<%@page import="java.util.ArrayList"%>
<%@page import="com.blocko.dto.BitcoinAdressDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@page import="com.fairmusic.dto.albumDTO"%>
<%@page import="com.fairmusic.dto.audioDTO"%>
<%@page import="com.fairmusic.dto.artistDTO"%>

<!DOCTYPE html>
<html>
<head>


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>

<style type="text/css">
.albumimage {
	width: 300px;
	height: 300px;
	border: 1px;
	border-style: solid;
	border-color: orange;
}
</style>


</head>
<body>
<%
audioDTO audiodto = (audioDTO) request.getAttribute("audioDTO");
%>
	<%
		albumDTO albumdto = (albumDTO) request.getAttribute("albumDTO");
	%>
	<%
		artistDTO artistdto = (artistDTO) request.getAttribute("artistDTO");
	%>
	
	<% ArrayList<BitcoinAdressDTO> blist = (ArrayList<BitcoinAdressDTO>)request.getAttribute("blist"); %>

	<div class="row">
		<div class="col-sm-12">

			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />


			<div class="row">

				<div class="col-lg-6">
					<jsp:include page="/widget.do" flush="true">
						<jsp:param value="<%=audiodto.getAudio_code()%>" name="audio_code" />
					</jsp:include>
				</div>
				<div class="col-lg-3">
					<%
						if (albumdto != null) {
					%>
					<%
						System.out.println(albumdto.getAlbum_image());
					%>
					<img alt="음반이미지" class="albumimage"
						src="/FairMusic/FM_album_image/<%=albumdto.getAlbum_image()%>"
						class="img-circle img-responsive">
					<%
						} else {
					%>
					<img alt="음반이미지" src="/FairMusic/images/noalbum.png">
					<%
						}
					%>
				</div>
				<div class="col-lg-3">
					<%
						if (artistdto.getArtist_image() != null) {
					%>
					<%
						System.out.println("아티스트 이미지 없음");
					%>
					<img alt="아티스트이미지" src="<%=artistdto.getArtist_image()%>">
					<%
						} else {
					%>
					<img alt="아티스트이미지" src="/FairMusic/images/NOARTI.png">
					<%
						}
					%>
				</div>

			</div>
			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />
			<div class="row">
				<div class="col-lg-12">
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo">음원정보보기</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo2">앨범정보보기</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo3">아티스트정보보기</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo4">뮤직비디오 재생</button>
					<div id="detailinfo" class="collapse">


						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<h1>
							곡 명 :
							<%=audiodto.getAudio_title()%></h1>
						<h2>
							장르 :
							<%=audiodto.getAudio_jenre()%></h2>
						<h2>
							설명 :
							<%=audiodto.getAudio_detail()%></h2>
						<h4>
							등록일자 :
							<%=audiodto.getAudio_date()%></h4>
						<%
							if (audiodto.getAudio_price() == null) {
						%>
						<h2><%=audiodto.getAudio_copyrighter()%></h2>
						<%
							} else {
						%>
						<h2>
							가격 :
							<%=audiodto.getAudio_price()%></h2>
						<%
							}
						%>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />



					</div>

					<div id="detailinfo2" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<%
							if (albumdto != null) {
						%>


						<h2>
							앨범 명 :
							<%=albumdto.getAlbum_title()%></h2>
						<h2>
							앨범 할인가 :
							<%=albumdto.getAlbum_dc()%></h2>
						<h2>
							앨범 소개 :
							<%=albumdto.getAlbum_detail()%></h2>
						<h2>
							앨범 등록일자 :
							<%=albumdto.getAlbum_date()%></h2>
						<%
							} else {
						%>
						<h3>해당 곡은 앨범이 없습니다.</h3>
						<%
							}
						%>

						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>

					<div id="detailinfo3" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />

						<h2>
							아티스트 명 :
							<%=artistdto.getArtist_name()%></h2>

						<%
							if (artistdto.getArtist_self_introduction() != null) {
						%>
						<h2><%=artistdto.getArtist_self_introduction()%></h2>
						<%
							} else {
						%>
						<h2>userInfo를 써놓지 않은 아티스트입니다</h2>
						<%
							}
						%>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>


					<div id="detailinfo4" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<%if(audiodto.getAudio_movie()!=null){ %>
						<video width = "640" height = "344" src="/FairMusic/FM_audio_video/<%=audiodto.getAudio_code()%>.<%=audiodto.getAudio_movie()%>" type = "video/mp4">당신 브라우저는 비디오 지원 안함</video>
						
						<%}else{ %>
						<h2>이 음악에는 뮤직비디오가 없습니다</h2>
						<%} %>
						
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>
				</div>

			</div>
			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />
			<div class="row">

				<div class="col-lg-4">
					<%
						String file_name = audiodto.getAudio_code() + "."
								+ audiodto.getAudio_file();
					%>
					<%
						System.out.println(audiodto.getAudio_code());
					%>
					<script type="text/javascript">
        function follow(){
            $.post("/FairMusic/follow_ajax.do",{"follower":"<%=artistdto.getArtist_code()%>"
						}, success_run)`
					};

					function success_run(txt) {
						alert(txt);
					}; 
					
					
				</script>
<script type="text/javascript">


function payMusic(){
	alert("페이뮤직 뜸");
		$.post("/FairMusic/audiobuy.do",{"audio_code":"<%=audiodto.getAudio_code()%>"
		}, success_money);
	};
	
	function success_money(txt) {
		$('#paymodalstart').trigger('click');
	}; 


</script>
					<h3>
						<a onclick="javascript:payMusic()">결제</a>
					</h3>
				</div>

				<h3>
					<a onclick="javascript:follow()">아티스트팔로우</a>
				</h3>
			</div>

			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />
			<div class="row">
				<div class="col-lg-12">기타</div>
			</div>
			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />
		</div>
	</div>



	<div class="modal fade" id="payResultModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-12">결제하였습니다.</div>
						<div class="row">
							<div class="col-lg-4">저작권자명</div>
							<div class="col-lg-4">비트코인 주소</div>
							<div class="col-lg-4">비율</div>
						</div>
						<% for(int i = 0; i< blist.size();i++){ %>
						<div class="row">
						
							<div class="col-lg-4">
								<h3>
									<span class="label label-default"><%= blist.get(i).getRighterName() %></span>
								</h3>
							</div>
							<div class="col-lg-4">
								<h3>
									<span class="label label-default"><%= blist.get(i).getBitcoinAdress() %></span>
								</h3>
							</div>
							<div class="col-lg-4">
								<h3>
									<span class="label label-default"><%= blist.get(i).getRighterVal() %></span>
								</h3>
							</div>
						</div>
						<%} %>
						</div>
				</div>
				<div class="modal-footer">

					<h3>
						<span class="label label-default">오디오의 가격은 <%=audiodto.getAudio_price()%>
							원 이므로,
						</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r1"></span>님에게
							<span id="r1val"></span> 원,</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r2"></span>님에게
							<span id="r2val"></span> 원,</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r3"></span>님에게
							<span id="r3val"></span> 원</span>
					</h3>
					<h3>이 바로 지급되었습니다.</h3>
					<button type="button" data-toggle="modal"
						data-target="#payResultModal" id="paymodalstart"
						name="paymodalstart" hidden="true" data-backdrop="static" data-keyboard="false">시작버튼</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>