<%@page import="com.fairmusic.dto.artistDTO"%>
<%@page import="com.fairmusic.dto.MessageDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
  <title>Bootstrap Example</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		$("#send").on("click", function(){
  			$.post("/FairMusic/message_send.do", {"comment":$("#comment").val(),"to":$("#to").val()}, success_run)
  		})
  	})
  	
  	code = "";
  	function success_run(text){
  		$("#result").html(text);
  	}
  	
  	function ajax(dm_code){
  	 	code = dm_code;
  		$.post("/FairMusic/message_read.do", {"dm_code":dm_code}, success_read) 
  	}
  	function success_read(txt){
  		$("#read").html(txt);
  	}
  	
  	function send(){
  		location.href="/FairMusic/message_delete.do?dm_code="+code+"&state=2";
  	}
  </script>
</head>
<body>
<br/>
	<div class="row">
	<div class="col-sm-12">
	<% ArrayList<MessageDTO> Send_MSG = (ArrayList<MessageDTO>)session.getAttribute("Send_MessageList"); %>
	<% System.out.print("Send_MSG 사이드바 : "+Send_MSG); %>
 	<% artistDTO artistDTO = (artistDTO)session.getAttribute("artistDTO"); %> 
 	<% System.out.print("artistDTO 사이드바 : "+artistDTO); %>

	<button type="button" class="btn btn-info " data-toggle="modal" data-target="#messageModal">New Message</button>
 	<button type="button" class="btn btn-info " id="new_message" onclick="location.href='/FairMusic/new_message_load.do'">읽지 않은 메세지</button>
	<button type="button" class="btn btn-info " id="message" onclick="location.href='/FairMusic/message_load.do'">받은 메세지함</button>
	<button type="button" class="btn btn-info " id="send_message" onclick="location.href='/FairMusic/send_message_load.do'">보낸 메세지함</button>	
	 
	<br/><br/>
	<div class="row">
	<div class="col-sm-3">
	<ul class="list-group">
 		<% for(int i=0; i<Send_MSG.size(); i++){
			MessageDTO message = Send_MSG.get(i);%>
		<li class="list-group-item">
		<img src="<%= message.getArtist_image() %>" class="img-thumbnail" alt="Cinque Terre" width="30" height="30">
		<a onclick="ajax('<%=message.getDM_CODE()%>')"><%=message.getArtist_email()%> 님에게 보낸 메세지</a></li>
		<%} %> 
 	</ul>
	</div>
	<div class="col-sm-9">
		 <ol class="list-group">
			<li class="list-group-item disabled">내용 </li>
		    <li class="list-group-item">
		     	<div id="read"></div>
		    </li>	
		 </ol>	
		 <button value="삭제" id="msg_delete" onclick="send();">삭제</button>
 	</div>
 	</div>
 	</div>
 	</div>
  <div class="modal fade" id="messageModal" role="dialog">
    <div class="modal-dialog modal-lg">
    
      <!-- Modal content-->
      <form action="/Fairmusic/message_send.do" method="post">   
      <div class="modal-content">
         <div class = "modal-header">
         <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
         <h3>New Message</h3>
     </div>
    <div class = "modal-body">

         <h3>To</h3>
         <input name="To" type="text" id="to"/>
         <h3>Write your message </h3>
    <div class="form-group">
      <label for="comment"></label>
      <textarea class="form-control" rows="5" id="comment"></textarea>
    </div>
      </div>
        <div class="modal-footer">
			<span id="result" style="color: red"></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="close" data-dismiss="modal" aria-hidden="true" value="send" id="send"/>
        </div>
      </div>
      </form>
    </div>
  </div>	
  

</body>
</html>

