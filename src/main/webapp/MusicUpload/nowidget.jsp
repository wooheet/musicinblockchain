<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-sm-3"><img src="temp.png" class="img-circle img-responsive" alt="Placeholder image"></div>
    <div class="col-sm-9">
      <div class="row">
        <div class="col-sm-2">
          <button type="button" class="btn btn-primary"> ▷</button>
        </div>
        <div class="col-sm-8"><span class="label label-default">한준희</span></div>
        <div class="col-sm-2"><span class="label label-default">06/29</span></div>
        <div class="col-sm-10"><span class="label label-info">지현이는 이모티콘 참 다채롭네</span></div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <audio controls></audio>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <button type="button" class="btn btn-success">POST</button>
        </div>
        <div class="col-sm-3">
          <button type="button" class="btn btn-success">구매하기</button>
        </div>
        <div class="col-sm-3">
          <button type="button" class="btn btn-success"> 상세페이지</button>
        </div>
        <div class="col-sm-3">
          <div class="btn-group">
            <button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">공유<span class="caret"></span></button>
            <ul class="dropdown-menu">
              <li role="presentation" class="dropdown-header">Dropdown header 1</li>
              <li role="presentation"><a href="#">First Link</a></li>
              <li role="presentation" class="disabled"><a href="#">Disabled Link</a></li>
              <li role="presentation" class="divider"></li>
              <li role="presentation"><a href="#">Separated Link</a></li>
            </ul>
          </div>
        </div>
        <div class="col-sm-3 col-sm-offset-9">
          <p><span class="label label-default"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>5 </span>&nbsp;</p>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>