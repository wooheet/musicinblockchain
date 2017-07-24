<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form id = "test" action ="/FairMusic/musicupload.do" method="post" enctype="multipart/form-data">
	<fieldset>
	
		<legend>파일 업로드</legend>
		<input id = "file" name = "files-upload" type = "file"><br/>
		<input type = "submit" value = "업로드"> 
	
	</fieldset>


</form>
</body>
</html>