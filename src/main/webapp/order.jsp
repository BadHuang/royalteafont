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
	<body>
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
								<c:forEach items="${orders}" var="order">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
										<input type="text" hidden="" value="${sessionScope.dId }" id="did">
											<h4 style="display: inline;">#${order.oId }</h4><h4 style="display: inline;margin-left: 80px;">桌号：${order.odId  }</h4>
											<span>创建时间：${order.oTimes }</span>
										</div>
										<div class="card-body">
											<div class="table-responsive">
												<table style="text-align: center;">
													<c:forEach items="${order.oiList}" var="f">
														
															<tr>
																<td width="25%"><img src="http://royalbd.hzryxx.cn/upload/${f.fImg }" width="50px" height="50px" /></td>
																<td width="25%">${f.fName }</td>
																<td width="15%" data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
																	<span class="num" style="visibility:visible;">*${f.fNum }</span>
																</td>
																<td >
																	<c:if test="${f.fPrice!=f.fDprice }">
																	<span style="font-size: 1.3em;">¥<span>${f.fDprice*f.fNum }</span></span>
																	<span style="color: #9F9F9F;text-decoration:line-through;display:inline;font-size: 0.8em;">¥<span>${f.fPrice*f.fNum }</span></span>
																	</c:if>
																	<c:if test="${f.fPrice==f.fDprice }">
																	<span style="font-size: 1.3em;">¥<span>${f.fDprice*f.fNum }</span></span>
																	<span style="color: #9F9F9F;text-decoration:line-through;display:none;font-size: 0.8em;">¥<span>${f.fPrice*f.fNum }</span></span>
																	</c:if>
																</td>
															</tr>
														
													</c:forEach>
												</table>
												
												<br/>
												<div></div>
												<div class="ml-auto">
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;
													<span style="font-size: 1.5em;">总额：&nbsp;¥<span id="total1">${order.oDtotal }</span></span>
													<br/>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<span style="font-size: 1em;">优惠：&nbsp;¥<span id="total1">${order.oTotal-order.oDtotal }</span></span>
													
												</div>
												<br/>
												就餐方式：
												
												<c:if test="${order.oOut==0 }">
												  堂食
											 	 </c:if>
											 	 <c:if test="${order.oOut!=0 }">
												  外带
											 	 </c:if>
												  <br/>
												  备注：${order.oDec }
											
											</div>
										</div>
									</div>
								</div>
							</c:forEach>

			<footer class="fixed-bottom">
				<div class="shoppingcar" >
				&nbsp;&nbsp;&nbsp;&nbsp;
					<button onclick="goShop()" class="btn btn-secondary" type="submit" style="background-color:#EDEDED;border-color: #EDEDED;font-size: 20px;float: right;margin-top: 6px;margin-right: 115px;"><font color="#4e555b">继续购买</font></button>
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
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="location='orders'">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">支付成功</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" data-dismiss="modal" onclick="location='orders-add'" >关闭</button>
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
			alert(out);
			alert(dec);
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
				total.html(prices[0]);
				dtotal.html(prices[1]);
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