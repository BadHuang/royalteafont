<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<c:set var="localhost" value="129.204.127.42"/>
	<head lang="en">
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width,initial-scale=1"/>
		<title></title>
		<!--Bootstrap.min css-->
		<link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
		<!--Style css-->
		<link rel="stylesheet" href="assets/css/style.css">
		<!--Icons css-->
		<link rel="stylesheet" href="assets/css/icons.css">

		<style>
			.ui-content{padding: 0;}
			#headimg{width: 90%;height: 180px;background-image: url(assets/img/timg.jpg);background-size: 100% 100%;margin: 0 auto;}
			#title{width: 90%;margin: 0 auto;text-align: center;}
			
			#floatlist{width:20%;float: left;margin-right: 30px;position: fixed;display: none;}
			#floatlist ul{list-style-type: none;background-color: #EDEDED;margin: 0;padding: 5px;}
			#floatlist ul li{padding-top: 20px;padding-bottom: 20px;}
			
			#content{margin-top: 20px;}
			
			
			
			#rightlist{width:90%;margin: 30px;}
			#rightlist div{height: 500px;}
			
			.shoppingcar{width: 100%;margin: 0 auto;background-color:lightgray;padding-top: 6px;height: 60px;}
			#money{width: 90%;margin: 0 auto;text-align: center;}
			table{width: 95%;}
			#bigul{list-style-type: none;padding-left: 20px;}
			#bigul li{margin-top: 5px;margin-bottom: 5px;}
			.ui-page-theme-a a:visited, html .ui-bar-a a:visited, html .ui-body-a a:visited, html body .ui-group-theme-a a:visited {
			    color: black;
			}
			.ui-page-theme-a a, html .ui-bar-a a, html .ui-body-a a, html body .ui-group-theme-a a{
				color: black;
				font-weight: inherit;
			}
			a:link{text-decoration: none;}
			a:active{}
			a:visited{text-decoration: none;}
			a:hover{text-decoration: none;}

		</style>


		

	</head>
	<body onbeforeunload="return fun1()">
	<div data-role="page" id="pageone">
			<nav class="navbar navbar-expand-lg main-navbar">
				<a class="header-brand">
					<img src="assets/img/brand/logo1.png" class="header-brand-img" alt="Kharna-Admin  logo">
				</a>
			</nav>



		<div class="ui-content" >

			<br /><br /><br/><br/>
			<div id="title">
			<input type="text" hidden="" value="${sessionScope.dId }" id="did">
			</div>
			<div id="content">

								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
										<input type="text" hidden="" value="${sessionScope.dId }" id="did">
										<i class="ion ion-chevron-left" onclick="goShop()" style="position: relative;left: -10px;"></i>
											<h4 style="display: inline;">订单详情</h4><h4 style="display: inline;margin-left: 100px;">桌号：${sessionScope.dId }</h4>
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table style="text-align: center;">
													<c:forEach items="${orderInfo}" var="f">
														
															<tr>
																<td width="25%"><img src="http://royalbd.hzryxx.cn/upload/${f.fImg }" width="50px" height="50px" /></td>
																<td width="25%">${f.fName }</td>
																<td width="15%" data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
																	<span class="num" style="visibility:visible;">*${f.num }</span>
																</td>
																<td >
																	<c:if test="${f.fPrice!=f.fDprice }">
																	<span style="color: black;font-size: 1.3em;">¥<span>${f.fDprice*f.num }</span></span>
																	<span style="color: #9F9F9F;text-decoration:line-through;display:inline;font-size: 0.8em;">¥<span>${f.fPrice*f.num }</span></span>
																	</c:if>
																	<c:if test="${f.fPrice==f.fDprice }">
																	<span style="color: black;font-size: 1.3em;">¥<span>${f.fDprice*f.num }</span></span>
																	<span style="color: #9F9F9F;text-decoration:line-through;display:none;font-size: 0.8em;">¥<span>${f.fPrice*f.num }</span></span>
																	</c:if>
																</td>
															</tr>
														
													</c:forEach>
												</table>
												
												<br/>
												<div></div>
												<div class="ml-auto">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												
													<c:if test="${cartotal==cardtotal }">
													<span style="color: black;font-size: 1.3em;">小计：&nbsp;¥<span id="dtotal1">${cardtotal }</span></span>
													<span style="color: #9F9F9F;font-size: 0.8em;text-decoration:line-through;font-size: 1em;display: none;">¥<span id="total1">${cartotal }</span></span>
													</c:if>
													<c:if test="${cartotal!=cardtotal }">
													<span style="color: black;font-size: 1.3em;">小计：&nbsp;¥<span id="dtotal1">${cardtotal }</span></span>
													<span style="color: #9F9F9F;font-size: 0.8em;text-decoration:line-through;font-size: 1em;display: inline;">¥<span id="total1">${cartotal }</span></span>
													</c:if>
												</div>
												<br/>
												就餐方式：
												  <input type="radio" value="0" name="out" checked="checked"/> 堂食
												  <input type="radio" value="1" name="out" /> 外带
												  <br/><br/>
												  支付方式：
												  <input type="radio" value="0" name="pay" checked="checked"/> <img src="assets/img/wx.jpeg" width="40px" height="40px">
												  <input type="radio" value="1" name="pay" /> <img alt="" src="assets/img/zfb.jpeg" width="40px" height="40px">
												  <br/> <br/>
												  备注：
												  <textarea name="dec" rows="4" cols="32" placeholder="请输入少于50字的备注" maxlength="50" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)"
									pattern="^.{0,50}$" oninvalid="setCustomValidity('请输入少于50字的描述');" oninput="setCustomValidity('');" ></textarea>
											
											</div>
										</div>
									</div>
								</div>

			<footer class="fixed-bottom">
				<div class="shoppingcar" >
				&nbsp;&nbsp;&nbsp;&nbsp;
					<span style="color: black;font-size: 2em;">¥<span data-total="${sessionScope.total }" id="total">0.0</span></span>&nbsp;
					<span style="color: #9F9F9F;text-decoration:line-through;font-size: 1.5em;display: none;">¥<span id="dtotal">0.0</span></span>
					<button onclick="finish()" class="btn btn-secondary" type="submit" style="background-color:#EDEDED;border-color: #EDEDED;font-size: 20px;float: right;margin-top: 6px;margin-right: 5px;"><font color="#4e555b">确认支付</font></button>
				</div>
			</footer>
	</div>
	</div>
	</div>
	<div id="smallModal" class="modal fade" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">提示</h6>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location='order'">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">支付成功</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="location='order'" >关闭</button>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div>
	

	<!--Jquery.min js-->
	<script src="assets/js/jquery.min.js"></script>

	<!--Bootstrap.min js-->
	<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

	<!--assets/js/jquery.cookie.js-->
	<script src="assets/js/jquery.cookie.js"></script>

	<!--assets/js/jquery.cookie.js-->
	<script src="assets/js/decimal.js"></script>

	<script>

		function finish(){
			var out = $('input[name="out"]:checked').val();
			var dec = $('textarea[name="dec"]').val();
			$.ajax({
                type:"POST",
                url:"order-add",
                data: {
                	oOut:out,
                	oDec:dec
                	},
                success:function (data) {
                	$('#smallModal').modal("show");
                    
                }
            })
		}

		
		$(function () {
			
        	var total = $('#total');
			var dtotal = $('#dtotal');
			var data = total.data("total");
			if (data!=null&&data!=''){
				var prices = data.split(',');
				total.html(prices[1]);
				dtotal.html(prices[0]);
	        	if(prices[0]!=prices[1]){
	        		dtotal.parent().css('display','inline');
	        	}else{
	        		dtotal.parent().css('display','none');
	        	}
			}
			
		});
		
		function goShop(){
			var dId = $('#did').val();
			location='shop?dId='+dId;
		}


		

		
		
	</script>
	</body>
</html>