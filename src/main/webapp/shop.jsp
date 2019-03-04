<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<c:set var="localhost" value="192.168.1.5"/>
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
			
			#leftlist{width:20%;float: left;margin-right: 20px;}
			#leftlist ul{list-style-type: none;margin: 0;background-color: #EDEDED;width: 100%;padding: 1px;}
			#leftlist ul li{padding-left: 5px;padding-top: 20px;padding-bottom: 20px;background-color: #EDEDED;filter: alpha(opacity: 70); opacity: 0.7;}
			
			#rightlist{width:70%;float: left;}
			#rightlist div{height: 500px;}
			
			.shoppingcar{width: 100%;margin: 0 auto;background-color:lightgray;padding-top: 6px;height: 60px;}
			#money{width: 90%;margin: 0 auto;text-align: center;}
			table{width: 100%;}
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
			<input type="text" hidden="" value="${localhost }" id="localhost"/>
			<nav class="navbar navbar-expand-lg main-navbar">
				<a class="header-brand" >
					<img src="assets/img/brand/logo1.png" class="header-brand-img" alt="Kharna-Admin  logo">
				</a>
				<div class="mr-auto"></div>
				<button onclick="location='order'" class="btn btn-sm btn-secondary" type="submit" style="background-color:#EDEDED;border-color: #EDEDED;font-size: 20px; "><i class="ion ion-document-text" style="color: #4e555b;"></i></button>
				&nbsp; 
				<button onclick="location='search.jsp'" class="btn btn-sm btn-secondary" type="submit" style="background-color:#EDEDED;border-color: #EDEDED;font-size: 20px; "><i class="ion ion-search" style="color: #4e555b"></i></button>

			</nav>



		<div class="ui-content" >

			<br /><br /><br /><br />
			<div id="headimg">
			</div>
			<div id="title">
				<hr />
				<p >Royaltea皇茶欢迎您入座&nbsp;<strong id="dId" style="color: red;">${sessionScope.dId }</strong>&nbsp;号餐桌</p>
				<hr />
			</div>
			<div id="content">
				<div id="leftlist" >

					<ul>
						<li>
							<img src="assets/img/hot.png" width="15px" height="15px"/>热销
						</li>
						<li>
							<img src="assets/img/cheap.png" width="15px" height="15px"/>优惠
						</li>
						<c:forEach items="${shopInfo}" var="list">
						<li>${list.ftName }</li>
						</c:forEach>
					</ul>
					<ul style="background-color: transparent;"></ul>
				</div>

				<div id="rightlist" data-role = "none">
					<table>
						<tr>
							<td ><strong>热销</strong></td>
						</tr>
						<c:forEach items="${hotInfo}" var="f">
						<tr onclick="showFood(this)" data-id="${f.fId }" data-sales="${f.sales }" data-dec="${f.fDec }" data-name="${f.fName }" data-img="${f.fImg }" data-price="${f.fPrice }" data-dprice="${f.fDprice }">
							<td rowspan="3"><img src="http://${localhost }:8080/royalbd/upload/${f.fImg }" width="100px" height="100px" /></td>
							<td><strong style="font-size: 1.5em;">${f.fName }</strong></td>
						</tr>
						<tr>
							<c:if test="${f.sales!=null }">
							<td>月售&nbsp;${f.sales }</td>
							</c:if>
							<c:if test="${f.sales==null }">
							<td>月售&nbsp;0</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<span style="color: red;font-size: 1.5em;">${f.fPrice }</span>
								<c:if test="${f.fPrice!=f.fDprice }">
								<span style="color: #9F9F9F;text-decoration:line-through;">${f.fDprice }</span>
								</c:if>
							</td>
							<td data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
								<c:if test="${f.num==null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:hidden;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:hidden;">0</span>
								</c:if>
								<c:if test="${f.num!=null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:visible ;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:visible;">${f.num }</span>
								</c:if>
								<a class="add${f.fId }" href="javascript:volid(0);"  onclick="addFood(this)"><img src="assets/img/add.png" width="22px" height="22px" /></a>
							</td>
						</tr>
						</c:forEach>
					</table>

					<table>
						<tr>
							<td ><strong>优惠</strong></td>
						</tr>
						<c:forEach items="${dcInfo}" var="f">
						<tr onclick="showFood(this)" data-id="${f.fId }" data-sales="${f.sales }" data-dec="${f.fDec }" data-name="${f.fName }" data-img="${f.fImg }" data-price="${f.fPrice }" data-dprice="${f.fDprice }">
							<td rowspan="3"><img src="http://${localhost }:8080/royalbd/upload/${f.fImg }" width="100px" height="100px" /></td>
							<td><strong style="font-size: 1.5em;">${f.fName }</strong></td></tr>
						<tr>
							<c:if test="${f.sales!=null }">
							<td>月售&nbsp;${f.sales }</td>
							</c:if>
							<c:if test="${f.sales==null }">
							<td>月售&nbsp;0</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<span style="color: red;font-size: 1.5em;">${f.fPrice }</span>
								<c:if test="${f.fPrice!=f.fDprice }">
								<span style="color: #9F9F9F;text-decoration:line-through;">${f.fDprice }</span>
								</c:if>
							</td>
							<td data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
								<c:if test="${f.num==null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:hidden;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:hidden;">0</span>
								</c:if>
								<c:if test="${f.num!=null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:visible ;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:visible;">${f.num }</span>
								</c:if>
								<a class="add${f.fId }" href="javascript:volid(0);"  onclick="addFood(this)"><img src="assets/img/add.png" width="22px" height="22px" /></a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<c:forEach items="${shopInfo}" var="ft">
					<table>
						<tr>
							<td ><strong>${ft.ftName }</strong></td>
						</tr>
						<c:forEach items="${ft.fList}" var="f">
						<tr onclick="showFood(this)" data-id="${f.fId }" data-sales="${f.sales }" data-dec="${f.fDec }" data-name="${f.fName }" data-img="${f.fImg }" data-price="${f.fPrice }" data-dprice="${f.fDprice }">						
							<td rowspan="3"><img src="http://${localhost }:8080/royalbd/upload/${f.fImg }" width="100px" height="100px" /></td>
							<td><strong style="font-size: 1.5em;">${f.fName }</strong></td></tr>
						<tr>
							<c:if test="${f.sales!=null }">
							<td>月售&nbsp;${f.sales }</td>
							</c:if>
							<c:if test="${f.sales==null }">
							<td>月售&nbsp;0</td>
							</c:if>
						</tr>
						<tr>
							<td>
								<span style="color: red;font-size: 1.5em;">${f.fPrice }</span>
								<c:if test="${f.fPrice!=f.fDprice }">
								<span style="color: #9F9F9F;text-decoration:line-through;">${f.fDprice }</span>
								</c:if>
							</td>
							<td data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
								<c:if test="${f.num==null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:hidden;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:hidden;">0</span>
								</c:if>
								<c:if test="${f.num!=null }">
								<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood(this)" style="visibility:visible ;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span class="num" style="visibility:visible;">${f.num }</span>
								</c:if>
								<a class="add${f.fId }" href="javascript:volid(0);"  onclick="addFood(this)"><img src="assets/img/add.png" width="22px" height="22px" /></a>
							</td>
						</tr>
						</c:forEach>
					</table>
					</c:forEach>
					<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

		</div>

		<footer class="fixed-bottom">
			<div class="shoppingcar" onclick="location='car'">
				<img src="assets/img/car.jpg" width="20%" height="60px" style="position: relative;top: -6px;"/>&nbsp;
				<span style="color: black;font-size: 2em;">¥<span data-total="${sessionScope.total }" id="total">0.0</span></span>&nbsp;
				<span style="color: #9F9F9F;text-decoration:line-through;font-size: 1.5em;display: none;">¥<span id="dtotal">0.0</span></span>
				<button class="btn btn-secondary root" onclick="location='clear'" type="submit" style="background-color:#EDEDED;border-color: #EDEDED;font-size: 20px;float: right;margin-top: 6px;margin-right: 5px;"><font color="#4e555b">结算</font></button>
			</div>
		</footer>
	</div>
	</div>
	</div>
	<c:if test="${carInfo!=null }">
	<div class="modal fade " id="carModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">购物车</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="goShop()"><span aria-hidden="true">&times;</span></button>

					</div>
					<div class="modal-body">
					<table>
						<c:forEach items="${carInfo}" var="f">
							
								<tr>
									<td><img src="http://${localhost }:8080/royalbd/upload/${f.fImg }" width="50px" height="50px" /></td>
									<td>${f.fName }</td>
									<td data-id="${f.fId }" data-price="${f.fPrice }" data-dprice="${f.fDprice }" data-name="${f.fName }" data-img="${f.fImg }">
										<a class="jian${f.fId }" href="javascript:volid(0);"  onclick="jianFood1(this)" style="visibility:visible ;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
										<span class="num" style="visibility:visible;">${f.num }</span>
										<a class="add${f.fId }" href="javascript:volid(0);"  onclick="addFood1(this)"><img src="assets/img/add.png" width="22px" height="22px" /></a>
									</td>
									<td>
										<span style="color: red;font-size: 1.5em;">¥<span>${f.fPrice*f.num }</span></span>
										<c:if test="${f.fPrice!=f.fDprice }">
										<span style="color: #9F9F9F;text-decoration:line-through;display:inline;">¥<span>${f.fDprice*f.num }</span></span>
										</c:if>
										<c:if test="${f.fPrice==f.fDprice }">
										<span style="color: #9F9F9F;text-decoration:line-through;display:none;">¥<span>${f.fDprice*f.num }</span></span>
										</c:if>
									</td>
								</tr>
							
						</c:forEach>
					</table>
					<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="color: black;font-size: 1.5em;">总价：&nbsp;¥<span id="total1">${cartotal }</span></span>&nbsp;
						<c:if test="${cartotal==cardtotal }">
						<span style="color: #9F9F9F;text-decoration:line-through;font-size: 1em;display: none;">¥<span id="dtotal1">${cardtotal }</span></span>
						</c:if>
						<c:if test="${cartotal!=cardtotal }">
						<span style="color: #9F9F9F;text-decoration:line-through;font-size: 1em;display: inline;">¥<span id="dtotal1">${cardtotal }</span></span>
						</c:if>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" onclick="goShop()">关闭</button>
						<button type="submit" class="btn btn-primary" onclick="location='clear'">结算</button>
					</div>
			</div>
		</div>
	</div>
	</c:if>
	<c:if test="${error!=null }">
	<div id="smallModal" class="modal fade" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">提示</h6>
						<button type="button" class="close" onclick="goShop()" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">${error}</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-success" onclick="goShop()" data-dismiss="modal" >关闭</button>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div>
		</c:if>
	<div class="modal fade " id="foodModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<form action="emp-update1" class="form-horizontal" method="post">
					<div class="modal-header">
						<h4 class="modal-title" id="myModalLabel">商品详情</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>

					</div>
					<div class="modal-body">
						<div id="img" style="width: 90%;height: 250px;background-image: url(assets/img/u=4201913542,3911873782&fm=26&gp=0.jpg);background-size: 100% 100%;margin: 0 auto;margin-top: 10px;"></div>
						<br/>
							<ul id="bigul">
								<li><strong id="name">珍珠奶茶</strong></li>
								<li id="sales">月售</li>
<!-- 								data-id="" data-price="" data-dprice="" data-name="" data-img="" -->
								<li >
								<span id="price" style="color: red;font-size: 1.5em;font-weight:bold;">15.5</span>
								<span id="dprice" style="color: #9F9F9F;text-decoration:line-through;">14.5</span>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="javascript:volid(0);" id="ijian"  onclick="jianFood(this)" style="visibility:hidden;"><img src="assets/img/jian.png" width="22px" height="22px" /></a>
								<span id="num1" style="visibility:hidden;">0</span>
								<a href="javascript:volid(0);" id="iadd"  onclick="addFood(this)"><img src="assets/img/add.png" width="22px" height="22px" /></a>
								</li>
								<li id="dec" style="margin-top:15px;"></li>
							</ul>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</form>
			</div>
		</div>
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


		var oDiv = document.getElementById("leftlist");
		var oUl = oDiv.getElementsByTagName("ul")[0];
		var aLi = oUl.getElementsByTagName("li");
		var aDiv = document.getElementById("rightlist").getElementsByTagName("table");
		var ulHeight = oDiv.offsetTop;
		var oMon = document.getElementById("money");


		oUl.style.height=($(document).height()-56.2)+"px";

		aLi[0].style.backgroundColor="white";
		aLi[0].style.filter = "alpha(opacity:100%)";
		aLi[0].style.opacity = 1;

		document.onscroll=function(){

			if($(window).scrollTop()>(ulHeight-56.2)){
				oUl.style.position="fixed";
				oUl.style.top="56.2px";
				oUl.style.width="20%";
			}else{
				oUl.style.position="relative";
				oUl.style.top="0";
				oUl.style.width="100%";
			}
			for(var q=0; q<aLi.length; q++){
				if($(window).scrollTop()>=(aDiv[q].offsetTop-60)){
					for(var i=0; i<aLi.length; i++){
						aLi[i].style.backgroundColor="#EDEDED";
						aLi[i].style.filter = "alpha(opacity:70%)";
						aLi[i].style.opacity = 0.7;
					}
					aLi[q].style.backgroundColor="white";
					aLi[q].style.filter = "alpha(opacity:100%)";
					aLi[q].style.opacity = 1;
				}
			}
		}
		for(var k=0; k<aLi.length;k++){
			(function(){
				var p = k;
				aLi[k].onclick=function(){
					for(var i=0; i<aLi.length; i++){
						aLi[i].style.backgroundColor="#EDEDED";
						aLi[i].style.filter = "alpha(opacity:70%)";
						aLi[i].style.opacity = 0.7;
					}
					aLi[p].style.backgroundColor="white";
					aLi[p].style.filter = "alpha(opacity:100%)";
					aLi[p].style.opacity = 1;
					scrollTo(0,aDiv[p].offsetTop-56.2);
				}
			})();
		}

		$('#myModal').modal().css({
			'margin-top': function () {
				return ($(this).height() * 1.5);
			}
		});
		
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
			var dId = $('#dId').html();
			location='shop?dId='+dId;
		}

		function showFood(obj){
			var id = $(obj).data('id');
			var name = $(obj).data('name');
			var price = $(obj).data('price');
			var dprice = $(obj).data('dprice');
			var dec = $(obj).data('dec');
			var img = $(obj).data('img');
			var sales = $(obj).data('sales');
			var num = $(obj).next().next().find('.num').html();
			var li = $('#num1').parent();
			var iadd = $('#iadd');
			var ijian = $('#ijian');
			iadd.addClass('add'+id);
			ijian.addClass('jian'+id);
			li.data('id',id);
			li.data('name',name);
			li.data('price',price);
			li.data('dprice',dprice);
			li.data('img',img);
			$('#name').html(name);
			$('#price').html(price);
			if(price==dprice){
				$('#dprice').css("display","none");
			}
			$('#dprice').html(dprice);
			var localhost = $("#localhost").val();
			$('#img').css('background-image','url(http://'+localhost+':8080/royalbd/upload/'+img+')');
			$('#dec').html(dec);
			$('#sales').html("月售 "+sales);
			$('#num1').html(num);
			if(num!='0'){
				$('#num1').css("visibility","visible");
				$('#num1').prev().css("visibility","visible");
			}else{
				$('#num1').css("visibility","hidden");
				$('#num1').prev().css("visibility","hidden");
			}
			
			$('#foodModal').modal("show");
		}

		$('#carModal').modal("show");
		$('#smallModal').modal("show");
		

		function addFood(obj){
			var add = $(obj);
			var num = Number(add.prev().html())+1;
			var id = add.parent().data('id');
			var name = add.parent().data('name');
			var price = add.parent().data('price');
			var dprice = add.parent().data('dprice');
			var img = add.parent().data('img');
			var c = 'add'+id;
			var adds = $('.'+c);
			if(num==1){
					adds.prev().prev().css("visibility","visible");
					adds.prev().html(num);
					adds.prev().css("visibility","visible");
			}else{
					adds.prev().html(num);
			}
			
			$.ajax({
                type:"POST",
                url:"car-add",
                data: {
                	fId:id,
                	fName:name,
                	fImg:img,
                	fPrice:price,
                	fDprice:dprice,
                	num:num
                	},
                success:function (price) {
                	var prices = price.split(',');
                	var total = $('#total');
        			var dtotal = $('#dtotal');
        			total.html(prices[0]);
        			dtotal.html(prices[1]);
                	if(prices[0]!=prices[1]){
                		dtotal.parent().css('display','inline');
                	}
                    
                }
            })
			
		}
		
		function addFood1(obj){
			addFood(obj);
			var add1 = $(obj);
			var price = add1.parent().data('price');
			var dprice = add1.parent().data('dprice');
			var nprice = add1.parent().next().children("span:first-child").children().html();
			var ndprice = add1.parent().next().children("span:last-child").children().html();
			var price1 = new Decimal(price);
			var dprice1 = new Decimal(dprice);
			var nprice1 = new Decimal(nprice);
			var ndprice1 = new Decimal(ndprice);
			var newprice = price1.plus(nprice1);
			var newdprice = dprice1.plus(ndprice1);
			add1.parent().next().children("span:first-child").children().html(newprice.toString());
			add1.parent().next().children("span:last-child").children().html(newdprice.toString());
			if(!newprice.equals(newdprice)){
				add1.parent().next().children("span:last-child").css("display","inline");
			}
			var total1 = $("#total1");
			var dtotal1 = $("#dtotal1");
			var total11 = new Decimal(total1.html());
			var dtotal11 = new Decimal(dtotal1.html());
			var newtotal = price1.plus(total11);
			var newdtotal = dprice1.plus(dtotal11);
			total1.html(newtotal.toString());
			dtotal1.html(newdtotal.toString());
			if(total1.html() != dtotal1.html()){
				dtotal1.parent().css('display','inline');
			}
		}
		
		
		function jianFood(obj) {
			var jian = $(obj);
			var num = Number(jian.next().html())-1;
			var id = jian.parent().data('id');
			var name = jian.parent().data('name');
			var price = jian.parent().data('price');
			var dprice = jian.parent().data('dprice');
			var img = jian.parent().data('img');
			var c = 'jian'+id;
			var jians = $('.'+c);
			if (num==0){
				jians.css("visibility","hidden");
				jians.next().html('0');
				jians.next().css("visibility","hidden");
			}else{
				jians.next().html(num);
			}
			
			$.ajax({
                type:"POST",
                url:"car-jian",
                data: {
                	fId:id,
                	fName:name,
                	fImg:img,
                	fPrice:price,
                	fDprice:dprice,
                	num:num
                	},
                success:function (price) {
                	var prices = price.split(',');
                	var total = $('#total');
        			var dtotal = $('#dtotal');
        			total.html(prices[0]);
        			dtotal.html(prices[1]);
                	if(prices[0]!=prices[1]){
                		dtotal.parent().css('display','inline');
                	}else{
                		dtotal.parent().css('display','none');
                	}
                    
                }
            })
			
		}
		
		function jianFood1(obj){
			jianFood(obj);
			var jian1 = $(obj);
			var price = jian1.parent().data('price');
			var dprice = jian1.parent().data('dprice');
			var nprice = jian1.parent().next().children("span:first-child").children().html();
			var ndprice = jian1.parent().next().children("span:last-child").children().html();
			var price1 = new Decimal(price);
			var dprice1 = new Decimal(dprice);
			var nprice1 = new Decimal(nprice);
			var ndprice1 = new Decimal(ndprice);
			var newprice = nprice1.minus(price1);
			var newdprice = ndprice1.minus(dprice1);
			jian1.parent().next().children("span:first-child").children().html(newprice.toString());
			jian1.parent().next().children("span:last-child").children().html(newdprice.toString());
			if(newprice.equals(newdprice)){
				jian1.parent().next().children("span:last-child").css("display","none");
			}
			var total1 = $("#total1");
			var dtotal1 = $("#dtotal1");
			var total11 = new Decimal(total1.html());
			var dtotal11 = new Decimal(dtotal1.html());
			var newtotal = total11.minus(price1);
			var newdtotal = dtotal11.minus(dprice1);
			total1.html(newtotal.toString());
			dtotal1.html(newdtotal.toString());
			if(total1.html() == dtotal1.html()){
				dtotal1.parent().css('display','none');
			}
		}

		$(".root").bind('click', function(event) {
			event.stopPropagation();
		});
		
	</script>
	</body>
</html>