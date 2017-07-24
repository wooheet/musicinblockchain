<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<h3>BitcoinSend</h3>
	
	<div class="col-sm-4">
	<input type = "text" name="MyAddress" placeholder="MyBitcoinAddress"><br/>
		<button type="button" class="btn btn-info btn-lg"
			data-toggle="modal" data-target="#PayModal">PAY</button>
	</div>
     
   <div class="modal fade" id="PayModal" role="dialog">
      <div class="modal-dialog modal-lg">
         <!-- Modal content-->
      <div class="modal-content">
         <div class = "modal-header">
         <h3>비트코인 결제</h3>
      </div>
        <div class = "modal-body">
	      <div class="row">
				<div class="col-lg-12">
					<span class="label label-info">나의 비트코인 주소</span>
					<span id="email_verify_result" style="color: red"></span>
				</div>
				
				<div class="col-lg-12">
					<div id="timer_s" style="color: red"></div>
				</div>
				
				<div class="col-lg-12">

					<input type="text" name="authnum"  id="authnum_check"/>
					<span id="authnum_check_result"></span>
				</div>
				<div class="col-lg-12">
					<button type="submit" class="btn btn-lg btn-default" id="email_verify_check">Send</button>
				</div>
			</div>
			
        </div>
        <div class="modal-footer">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">보내기 완료</button>
        </div>
      </div>
      </div>
   </div>
   
</body>
</html> 
