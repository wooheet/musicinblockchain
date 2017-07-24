<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page import="java.util.ArrayList" %>
<%@page import="com.fairmusic.dto.albumDTO"%>
<%@page import="com.fairmusic.dto.audioDTO"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
	
		 div #bg {
		  position:  absolute; 
 		  margin-left: 2%; margin-right: auto; display: block;
		  min-width: 90%;
		  min-height: 95.5%;
		  background-image: url('../images/certificate2.jpg');
		  background-repeat: no-repeat;
		 }  
	
		.modal-dialog.modal-80size {
		  width: 80%;
		  height: 80%;
		  margin: 0;
		  padding: 0;
		}
		
		.modal-content.modal-80size {
		  margin-left: 20%;
		}		
		.tx{
			border : 1px solid grey;
		}
		
	</style>
	
			<script type="text/javascript">
				var state = 0;
				$(document).ready(function() {
					$("#create").on("click",function() {
						if (state == 1) {
								alert("이미 생성했습니다.")
						} else { 
							$.get("/FairMusic/MyBitcoinAddr",{ },success_addr)
						} 
					})
					
					$("#delete").on("click",function() {
						$.get("/FairMusic/MyBitcoinAddrDelete",{ },success_deladdr)
					})
					
					$("#btcaddr").on("click",function() {
						$.get("/FairMusic/MyBitcoinAddr",{ },success_addr)
					})
					
					$("#search").on("click",function() {
						$.get("/FairMusic/BlockChainSearch",{"btcval" : $("#btcval").val()},success_search)
					})
					
					$("#txsearch").on("click",function() {
						$.get("/FairMusic/TransactionSearch",{"txval" : $("#txval").val()},success_txsearch)
					}) 
					
					$("#BlockchainStatus").on("click",function() {
							$.get("/FairMusic/BlockChainStatus",{ },success_status)
					})
					
					$("#TransactionStatus").on("click",function() {
							$.get("/FairMusic/TransactionStatus",{ },success_txstatus)
					})

				})

				function success_addr(txt) {
					data = txt.split(",");
				    state2 = data[0]; 
				    addr = data[1];
				    pk = data[2];
				    if(state2==0){
				    	$("#mybtc").html("<br/>"+addr);
				    }else{
				    	state = 1;
				    	alert("bitcoin Address : "+addr+"\n PrivateKey : "+pk+"\n privateKey는 타인에게 공유되서는 안됩니다. \n 개인적으로 메모를 해두시길 바랍니다.")
				    	$("#mybtc").html("<br/>"+addr);
				    }
					
				}
					
				function success_deladdr(txt) {
					if(txt==1){
						alert("삭제 완료")
						$("#mybtc").html("");	
					}else{
						alert("주소를 생성해 주세요.")	
					}
					
				}

				function success_search(txt) {	    
					$("#btcsearch").html("잔액 <br/>0."+txt+" BTC"); 
				}
				
				function success_txsearch(txt) {	    
					 $("#txId").html(txt);  
				/* 	for (var i = 0; i < txt.length; i++) {
						$("<td style ="color:red;"></td>").appendTo("#txId");
					} */
				}

				function success_txstatus(txt) {
				/* 	data = txt.split(",");
					txId = data[0]; 
					inputscnt = data[1];
					outscnt = data[2]; 
					$("#txId2").html(txId); 
					$("#inputs").html(inputscnt); 
					$("#outs").html(outscnt);  */
					 $("#txId2").html(txt);  
				}
		
				function success_status(txt) {
					data = txt.split(",");
					BestBlock = data[0]; 
					ParentId = data[1];
					Height = data[2]; 
					BlockConfirmationTime = data[3];
					$("#BestBlock").html(BestBlock);
					$("#ParentId").html(ParentId);
					$("#Height").html(Height);
					$("#BlockConfirmationTime").html(BlockConfirmationTime);
				} 
			</script>


</head>
<body>

		<div class="row"><br/><br/><br/><br/><br/>
			<div class="col-sm-3">
				<img src="/FairMusic/images/temp.png"
					class="img-circle img-responsive" alt="Placeholder image">
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-12">
						<fieldset>
							<legend style=" font: italic bold 1.5em/1em Georgia, serif ;">FairMusic에서 나의 블록체인의 상태를 확인하세요<br/><br/><br/></legend><br/>
								<span  style=" font: italic bold 1.5em/1em Georgia, serif ; color: black;">FairMusic은 음원 저작권을 블록체인 상에 보관함으로써 <br/><br/><br/>저작권자들의 창작물 권리를 보호해줍니다.<br/><br/><br/>블록체인에 삽입된 음원 검색 및 블록체인 세부 거래 정보를 검색해보세요!
								 <br>
							</span>
						</fieldset>
						&nbsp;
					</div>
				</div>
			</div>
		</div>
		
	<div class="row">
		<div class="col-sm-9">
			<div role="tabpanel">
				<ul class="nav nav-tabs" role="tablist">						
						
					<li role="presentation" id ="btcaddr"><a href="#pane1" data-toggle="tab"
					role="tab" aria-controls="tab2">My Bitcoin Address</a></li>
					
					<li role="presentation" id ="bitcoinsearch"><a href="#pane2" data-toggle="tab"
						role="tab" aria-controls="tab3">Bitcoin balance</a></li>
						
					<li role="presentation" id ="transactionsearch"><a href="#pane3" data-toggle="tab"
					role="tab" aria-controls="tab3">TransactionSearch</a></li>
						
					<li role="presentation" id ="BlockchainStatus"><a href="#pane4" data-toggle="tab"
					role="tab" aria-controls="tab4">BlockStatus</a></li>
					
					<li role="presentation" id ="TransactionStatus"><a href="#pane5" data-toggle="tab"
					role="tab" aria-controls="tab4">TransactionStatus</a></li>
						
				</ul>
		
				<div id="tabContent1" class="tab-content">
					
						<div role="tabpanel" class="tab-pane fade" id="pane1"><br/>
							<table class="table">
								<thead>
									<tr>
										<th>Create</th>
										<th>Bitcoin Address</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
										<tr>
											<td><input type="button" value="Create Bitcoin" class="btn btn-info btn-lg "  id="create"/></td>
											<td id="mybtc" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red;"></td>
											<td><input type="button" value="Delete" class="btn btn-info btn-lg "  id="delete"/></td>
										</tr>
										
										
								</tbody>
							</table>
							
						</div>
						
						
						<div role="tabpanel" class="tab-pane fade" id="pane2"><br/>
						<form role="form" class="form-horizonta">
							<table class="table">
									<thead>
										<tr>
											<th>BlockChainSearch</th>
											<th>result</th>
											<th>Search</th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td><input type="text" name="btcval" placeholder="bitcoin Address" id="btcval" size="70" style= "font-size:12pt; color:#ff0000; font-weight:bold; border: 1px solid #ff0000;"></td>
												<td id="btcsearch" style ="color:red;"></td>
												<td><input type="button" value="Search" class="btn btn-info btn-lg "  id="search"/></td>
											</tr>
									</tbody>
							</table>
						</form>
						</div>
						
						<div role="tabpanel" class="tab-pane fade" id="pane3"><br/>
							<form role="form" class="form-horizontal">
							<table  class="table">
									<thead>
										<tr>
											<th>TransactionSearch</th>
										</tr>
									</thead>
									<tbody>
											<tr>
												<td><input type="text" name="txval" placeholder="bitcoin Address" id="txval" size="70" style= "font-size:12pt; color:#ff0000; font-weight:bold; border: 1px solid #ff0000;"></td>
												<td><input type="button" value="Search" class="btn btn-info btn-lg "  id="txsearch"/></td>
											</tr>
									</tbody>
									
							</table>
									
								<div id="txId" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red;"></div>
							</form>
						</div>
						
						
						<div role="tabpanel" class="tab-pane fade" id="pane4"><br/>
								<table class="table">
									<thead>
										<tr>
											<th>Lately Block ID</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>BestBlock</th>
											<th id="BestBlock" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red; text-align : left;" ></th>
										</tr>
										<tr>
											<th>ParentId</th>
											<td id="ParentId" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red; text-align : left;"></td>
										</tr>
										<tr>
											<th>Height</th>
											<td id="Height" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red;text-align : left;"></td>
										</tr>
										<tr>
											<th>BlockConfirmationTime</th>
											<td id="BlockConfirmationTime" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red;text-align : left;" ></td>
										</tr>
									</tbody>
								</table>
						</div>
						
						<div role="tabpanel" class="tab-pane fade" id="pane5"><br/>
								<table class="table">
									<thead>
										<tr>
											<th>Transaction ID(lately 10)</th>
											
										</tr>
									</thead>
									<tbody>
										<tr>
											<th>txIds</th>
										</tr>
									</tbody>
								</table>

								<div id="txId2" style ="font: italic bold 1.5em/1em Georgia, serif ;color:red;text-align : left;"></div> 
						</div>
				</div>
			</div>``
		</div>
	</div>


</body>
</html>
