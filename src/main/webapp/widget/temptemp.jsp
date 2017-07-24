<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<body>
<div class="container">
  <link href='https://fonts.googleapis.com/css?family=Noticia+Text:400,700' rel='stylesheet' type='text/css'>
  
  <div class="content">
    <div class="album-cover">  
      <img src="http://static.djbooth.net/pics-tracks/chrisbrown-dontthinktheyknow.jpg"/>
      <p>play</p>      
    </div>

    <div class="text">
      <p class="now-playing">
        <span style="color:#999">Now playing:</span> Don't Think They Know
      </p>      
      <audio controls>
        <source src="" type="audio/mpeg"/>
      </audio>      

      <h1>Chris Brown ft. Aaliyah</h1>
      <h2>Don't Think They Know</h2> 
    </div>
   <p class="resize-msg">ERROR:You need to make your window bigger for this to work.<p>
  </div>

</div>
<script type="text/javascript">

//When page loads hide the following
$('.album-cover img').hide(0);//Chris Brown cover
$('audio').hide(0);//Audio player
$('.now-playing').hide(0);//Now playing text

//When album cover is clicked the following toggle
$('.album-cover').click(function() {
  $('.album-cover img').fadeToggle(200);//Chris Brown cover fade in or out
  $('audio').toggle(2000);//Audio player
  $('h1,h2').toggle(1000);//Text that says Artist and track name
  $('.now-playing').toggle(2000);//Now playing text
});

</script>


<style type="text/css">
body {
  background:#FDB813;
  font-family: 'Noticia Text', serif;
  margin-top:5%;
}
.container {
  max-width:960px;
  margin:0 auto;
}
.content {
  background:#fff;
  overflow:hidden;
  box-sizing:border-box;
  padding:20px;
  height:140px;
  overflow:hidden;
}
.album-cover{
  height:100px;
  width:100px;
  background:#9A3334;  
  float:left;
  cursor:pointer;
}
.album-cover img {
  width:100px;
  height:100px;
}
.album-cover p {
  color:#fff;
  font-size:2em;
  margin:0;
  text-align:center;
  line-height:100px;
}
.text h1, h2 {
  float:left;
  margin:0px;
}
.text h1 {
  color:#3399FF;
  padding-right:20px;
}
.text h2 {
  color:#999;
}
.text {
  float:left;
  width:auto;
  height:100px;
  line-height:100px;
  margin-left:5%;
  border-top:1px solid #dadada;
  border-bottom:1px solid #dadada;
}
.text audio {
  margin-top:20px;
}
.now-playing {
  margin:0;
  float:left;
  margin-right:20px;
}
/*------------------Media Querie----------------*/
.resize-msg {
  display:none;
}
@media only screen and (min-width : 150px) and (max-width : 854px){
  .resize-msg {
    display:block;
  }
}

</style>
</body>
</html>