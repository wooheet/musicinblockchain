<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    	<%@ page import="java.util.ArrayList" %>

<%@page import="com.fairmusic.dto.audioDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%ArrayList<audioDTO> havingAudioDTO = (ArrayList<audioDTO>)request.getAttribute("havingAudioDTO"); %>
<div class="row">
    <div class="col-lg-12"><span class="label label-info">������ ����</span></div>
  </div>
  <div class="row">
    <div class="col-lg-5"><span class="label label-info">�� ��</span></div>
    <div class="col-lg-1"><span class="label label-info">����</span></div>
    <div class="col-lg-3"><span class="label label-info">���������� �̵�</span></div>
    <div class="col-lg-3"><span class="label label-info">�ٿ�ε�</span></div>
  </div>
  <%System.out.println(havingAudioDTO); %>
  <%if(havingAudioDTO!=null){ %>
  	<%for(int i = 0; i <havingAudioDTO.size(); i++){ %>
  	<%	audioDTO dto = havingAudioDTO.get(i); %>
  <div class="row">
    <div class="col-lg-5"><h3><%= dto.getAudio_title()%></h3></div>
    <div class="col-lg-1"><h3><%= dto.getAudio_price()%></h3></div>
    <div class="col-lg-3"><h3><input type = "button" value = "<%= dto.getAudio_title()%>" name="<%=dto.getAudio_code()%>" onclick ="window.open('/FairMusic/audiopage.do?audio_code=<%=dto.getAudio_code()%>')"/></h3></div>
    <div class="col-lg-3"><h3><a href = "/FairMusic/audiodown.do?file_name=<%=dto.getAudio_code()%>.<%=dto.getAudio_file()%>">�ٿ�</a>"</h3></div>
  </div>
  	<%} %>
  <%}else{ %>
  <div class="row">
    <div class="col-lg-5"><h3>������ ������ �����ϴ�.</h3></div>
    </div>
    <%} %>
</body>
</html>