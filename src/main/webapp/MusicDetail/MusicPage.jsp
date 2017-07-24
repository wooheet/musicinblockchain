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
					<img alt="음반이미지"
						src="/FairMusic/images/noalbum.png<%-- <%=albumdto.getAlbum_image()%> --%>">
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
						System.out.println(artistdto.getArtist_image());
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
						<h2><%=audiodto.getAudio_title()%></h2>
						<h3><%=audiodto.getAudio_jenre()%></h3>
						<h6><%=audiodto.getAudio_detail()%></h6>
						<h6><%=audiodto.getAudio_date()%></h6>
						<% if(audiodto.getAudio_price()==null){ %>
						<h6><%=audiodto.getAudio_copyrighter()%></h6>
						<%}else{ %>
						<h6><%=audiodto.getAudio_price()%></h6>
						<%} %>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />



					</div>

					<div id="detailinfo2" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<%
							if (albumdto != null) {
						%>


						<h2><%=albumdto.getAlbum_title()%></h2>
						<h2><%=albumdto.getAlbum_dc()%></h2>
						<h2><%=albumdto.getAlbum_detail()%></h2>
						<h2><%=albumdto.getAlbum_date()%></h2>
						<%
							} else {
						%>
						<h3>해당 곡은 앨범에 없습니다.</h3>
						<%
							}
						%>

						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>

					<div id="detailinfo3" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />

						<h2><%=artistdto.getArtist_name()%></h2>

						<% if(artistdto.getArtist_self_introduction()!= null){ %>
												<h2><%=artistdto.getArtist_self_introduction()%></h2>
						<%
							}else{
						%>
						<h2>userInfo를 써놓지 않은 아티스트입니다</h2>
						<%} %>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>


					<div id="detailinfo4" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />

						<h2>이 음악에는 뮤직비디오가 없습니다</h2>

						<%-- <div align="center"
							class="embed-responsive embed-responsive-16by9">
							<video autoplay loop class="embed-responsive-item">
								<%
									String moviePa = audiodto.getAudio_code() + "."
											+ audiodto.getAudio_movie();
								%>
								<source src="<%=moviePa%>" type="video/mp4">
							</video>
						</div> --%>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>
				</div>

			</div>
			<br />
			<br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br />
			<br />
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
						}, success_run)
					};

					function success_run(txt) {
						alert(txt);
					}; 
				</script>
					<h3>
						<a
							href='/FairMusic/audiobuy.do?audio_code=<%=audiodto.getAudio_code()%>'>결제</a>
					</h3>
				</div>
				<%
					System.out.println(audiodto.getAudio_code() + "오디오디티오");
				%>
				<h3>
					<a onclick="javascript:follow()">아티스트팔로우</a>
				</h3>
			</div>

			<br />
			<br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br />
			<br />
			<div class="row">
				<div class="col-lg-12">기타</div>
			</div>
			<br />
			<br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br />
			<br />
		</div>
	</div>
</body>
</html>