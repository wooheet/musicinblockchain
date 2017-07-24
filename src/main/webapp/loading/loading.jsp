<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
 {
  background: #0d8aa5;
}

.loading {
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

@keyframes rotate {
  0% {
    transform: rotateZ(0deg);
  }
  100% {
    transform: rotateZ(360deg);
  }
}


</style>
</head>
<body>
<div class="loading"></div>
</body>
</html>