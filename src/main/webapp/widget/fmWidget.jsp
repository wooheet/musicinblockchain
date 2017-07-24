<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="com.fairmusic.dto.audioDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.css'>
<link rel="stylesheet" href="/FairMusic/widget/css/widget.css">
<title></title>

<%String audio_code = (String)request.getAttribute("audio_code"); %>
<%System.out.println("오디오코드 받아오냐?"+audio_code); %>
<%audioDTO dto = (audioDTO)request.getAttribute("audioDto"); %>
<%System.out.println("디티오 받아오냐?"+dto); %>

<%String artistName = (String)request.getAttribute("artistName");%>


<%String audioPath = (String)request.getAttribute("audioPath");%>
<%String audioImagePath = (String)request.getAttribute("audioImage");%>
<% String audioindex = request.getParameter("audioindex"); %>
</head>
<body>
<%System.out.println("이미지패스"+audioImagePath); %>
<%if(dto.getAudio_alive().equals("1")){ %>
<% String imagename = audio_code+"."+dto.getAudio_image(); %> 
<div class="container">
  <div class="player" style="
background-image: URL('/FairMusic/FM_audio_image/<%= imagename%>')">
    <div class="like waves-effect waves-light">
      <i class="icon-heart"></i>
    </div>
    <div class="mask"></div>
    <ul class="player-info info-one">
      <li><%= dto.getAudio_title() %></li>
      <li><%= artistName%></li>
      <li>01:00</li>
    </ul>
    <ul class="player-info info-two">
      <li><%= dto.getAudio_title() %></li>
      <li><%= artistName%></li>
      <li><span id="duration"></span><i> / </i>01:00</li>
    </ul>
    <div id="play-button" class="unchecked">
      <i class="icon icon-play"></i>
    </div>
    <div class="control-row">
      <div class="waves-animation-one"></div>
      <div class="waves-animation-two"></div>
      <div id="pause-button">
        <i class="icon"></i>
      </div>
      <div class="seek-field">
        <input id="audioSeekBar" min="0" max="334" step="1" value="0" type="range" oninput="audioSeekBar()" onchange="this.oninput()">
      </div>
      <div class="volume-icon">
        <i class="icon-volume-up"></i>
      </div>
      <div class="volume-field">
        <input type="range" min="0" max="100" value="100" step="1" oninput="audio.volume = this.value/100" onchange="this.oninput()">
      </div>
    </div>
  </div>
</div>
<audio id="audio-player" ontimeupdate="SeekBar()" ondurationchange="CreateSeekBar()" preload="auto" loop>
<% System.out.println("오디오패스"+audioPath); %>
<%= "file:///"+audioPath %> 
 
<%String audioname = audio_code+"."+dto.getAudio_file(); %>
  <source src="/FairMusic/FM_audio_file/<%=audioname %>" type="audio/mpeg">
</audio>
<script src='https://code.jquery.com/jquery-2.1.1.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.js'></script>
<script src = '/FairMusic/widget/js/widget.js'></script>
<%}%>
</body>

</html>