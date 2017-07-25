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
					<img alt="�����̹���" class="albumimage"
						src="/FairMusic/FM_album_image/<%=albumdto.getAlbum_image()%>"
						class="img-circle img-responsive">
					<%
						} else {
					%>
					<img alt="�����̹���" src="/FairMusic/images/noalbum.png">
					<%
						}
					%>
				</div>
				<div class="col-lg-3">
					<%
						if (artistdto.getArtist_image() != null) {
					%>
					<%
						System.out.println("��Ƽ��Ʈ �̹��� ����");
					%>
					<img alt="��Ƽ��Ʈ�̹���" src="<%=artistdto.getArtist_image()%>">
					<%
						} else {
					%>
					<img alt="��Ƽ��Ʈ�̹���" src="/FairMusic/images/NOARTI.png">
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
						data-target="#detailinfo">������������</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo2">�ٹ���������</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo3">��Ƽ��Ʈ��������</button>
					<button type="button" class="btn btn-info" data-toggle="collapse"
						data-target="#detailinfo4">�������� ���</button>
					<div id="detailinfo" class="collapse">


						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<h1>
							�� �� :
							<%=audiodto.getAudio_title()%></h1>
						<h2>
							�帣 :
							<%=audiodto.getAudio_jenre()%></h2>
						<h2>
							���� :
							<%=audiodto.getAudio_detail()%></h2>
						<h4>
							������� :
							<%=audiodto.getAudio_date()%></h4>
						<%
							if (audiodto.getAudio_price() == null) {
						%>
						<h2><%=audiodto.getAudio_copyrighter()%></h2>
						<%
							} else {
						%>
						<h2>
							���� :
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
							�ٹ� �� :
							<%=albumdto.getAlbum_title()%></h2>
						<h2>
							�ٹ� ���ΰ� :
							<%=albumdto.getAlbum_dc()%></h2>
						<h2>
							�ٹ� �Ұ� :
							<%=albumdto.getAlbum_detail()%></h2>
						<h2>
							�ٹ� ������� :
							<%=albumdto.getAlbum_date()%></h2>
						<%
							} else {
						%>
						<h3>�ش� ���� �ٹ��� �����ϴ�.</h3>
						<%
							}
						%>

						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>

					<div id="detailinfo3" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />

						<h2>
							��Ƽ��Ʈ �� :
							<%=artistdto.getArtist_name()%></h2>

						<%
							if (artistdto.getArtist_self_introduction() != null) {
						%>
						<h2><%=artistdto.getArtist_self_introduction()%></h2>
						<%
							} else {
						%>
						<h2>userInfo�� ����� ���� ��Ƽ��Ʈ�Դϴ�</h2>
						<%
							}
						%>
						<br /> <img src="/FairMusic/images/infodown.png" /> <br />
					</div>


					<div id="detailinfo4" class="collapse">
						<br /> <img src="/FairMusic/images/infoup.png" /> <br />
						<%if(audiodto.getAudio_movie()!=null){ %>
						<video width = "640" height = "344" src="/FairMusic/FM_audio_video/<%=audiodto.getAudio_code()%>.<%=audiodto.getAudio_movie()%>" type = "video/mp4">��� �������� ���� ���� ����</video>
						
						<%}else{ %>
						<h2>�� ���ǿ��� ���������� �����ϴ�</h2>
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
	alert("���̹��� ��");
		$.post("/FairMusic/audiobuy.do",{"audio_code":"<%=audiodto.getAudio_code()%>"
		}, success_money);
	};
	
	function success_money(txt) {
		$('#paymodalstart').trigger('click');
	}; 


</script>
					<h3>
						<a onclick="javascript:payMusic()">����</a>
					</h3>
				</div>

				<h3>
					<a onclick="javascript:follow()">��Ƽ��Ʈ�ȷο�</a>
				</h3>
			</div>

			<br /> <br /> <img src="/FairMusic/images/miniline.png" /> <br />
			<br /> <br />
			<div class="row">
				<div class="col-lg-12">��Ÿ</div>
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
						<div class="col-lg-12">�����Ͽ����ϴ�.</div>
						<div class="row">
							<div class="col-lg-4">���۱��ڸ�</div>
							<div class="col-lg-4">��Ʈ���� �ּ�</div>
							<div class="col-lg-4">����</div>
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
						<span class="label label-default">������� ������ <%=audiodto.getAudio_price()%>
							�� �̹Ƿ�,
						</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r1"></span>�Կ���
							<span id="r1val"></span> ��,</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r2"></span>�Կ���
							<span id="r2val"></span> ��,</span>
					</h3>
					<h3>
						<span class="label label-default"><span id="r3"></span>�Կ���
							<span id="r3val"></span> ��</span>
					</h3>
					<h3>�� �ٷ� ���޵Ǿ����ϴ�.</h3>
					<button type="button" data-toggle="modal"
						data-target="#payResultModal" id="paymodalstart"
						name="paymodalstart" hidden="true" data-backdrop="static" data-keyboard="false">���۹�ư</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>