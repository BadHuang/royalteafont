<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
	</head>
	<body class="app ">
	
		<div id="spinner"></div>
		
		<div id="app">
			<div class="main-wrapper" >
			
				
				<div class="app-content">
					<section class="section" data-toggle="section">
                    	<ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">商品管理</a></li>
                            <li class="breadcrumb-item active" aria-current="page">食品管理</li>
                        </ol>

						<div class="row">
								<div class="col-lg-12">
									<div class="card">
										<div class="card-header">
											<h4>食品表</h4>
										</div>
										<div class="card-body">
											<form class="form-inline mr-auto" action="food-search">
												<c:if test="${sessionScope.emp.roleRule==1 }">
												<ul class="navbar-nav mr-auto">
													<li><a href="#" data-toggle="modal" data-target="#addModal" class="nav-link nav-link-lg"><button class="btn btn-primary" type="button"><i class="ion ion-plus"></i>添加</button></a></li>
												</ul>
												</c:if>
												<c:if test="${sessionScope.emp.roleRule==0 }">
												<ul class="navbar-nav mr-auto">
													<li><a href="#" data-toggle="modal" data-target="" class="nav-link nav-link-lg root"><button class="btn btn-primary" type="button"><i class="ion ion-plus"></i>添加</button></a></li>
												</ul>
												</c:if>
												<div class="search-element">
													<select class="form-control" name="type">
														  <option value ="">所有菜品</option>
														  <c:forEach items="${foodtypeInfo}" var="ft">
															<c:choose> 
					
															 <c:when test="${ft.ftId==sessionScope.foodKey.type }">    <!--如果 --> 
																<option value="${ft.ftId }" selected="selected">
																${ft.ftName }
																</option>
															 </c:when>      
															
															  <c:otherwise>  <!--否则 -->    
																<option value="${ft.ftId }">
																${ft.ftName }
																</option>
															  </c:otherwise> 
															
															</c:choose>
															
															</c:forEach>
													</select>
													&nbsp;
													<select class="form-control" name="pstatus">
														  <option value =0>价格状态</option>
														  <c:if test="${foodKey.pstatus==0 || sessionScope.foodKey.pstatus==null }">
															<option value = 1 >原价</option>
															<option value = 2>折扣</option> 
														</c:if>
														 <c:if test="${sessionScope.foodKey.pstatus==1 }">
															<option value = 1 selected="selected">原价</option>
															<option value = 2>折扣</option> 
														</c:if>
														<c:if test="${sessionScope.foodKey.pstatus==2 }">
															<option value = 1 >原价</option>
															<option value = 2 selected="selected">折扣</option> 
														</c:if>
													</select>
													&nbsp;
													<select class="form-control" name="status">
														  <option value =0>商品状态</option>
														  <c:if test="${foodKey.status==0 || sessionScope.foodKey.status==null }">
															<option value = 1 >上架</option>
															<option value = 2>下架</option> 
														</c:if>
														 <c:if test="${sessionScope.foodKey.status==1 }">
															<option value = 1 selected="selected">上架</option>
															<option value = 2>下架</option> 
														</c:if>
														<c:if test="${sessionScope.foodKey.status==2 }">
															<option value = 1 >上架</option>
															<option value = 2 selected="selected">下架</option> 
														</c:if>
													</select>
													&nbsp;
													<input class="form-control" type="search" placeholder="搜索菜名" aria-label="Search" name="name" value="${sessionScope.foodKey.name }">
													<button class="btn btn-primary btn-abc" type="submit"><i class="ion ion-search"></i></button>
												</div>
											</form>
											<br />
											<div class="table-responsive">
												<table class="table table-bordered mb-0 text-nowrap">
													<tr>
														<th>#</th>
														<th>菜名</th>
														<th>菜品</th>
														<th>图片</th>
														<th>价格</th>
														<th>状态</th>
														<th>描述</th>
														<th>操作</th>
													</tr>
													<c:set var="count" value="0" />
													<c:forEach items="${pageInfo.list}" var="food">
													<c:set var="count" value="${count+1 }" />
											          <tr>
											            <td>${count+(pageInfo.pageNum-1)*5}</td>
											            <td style="padding: 0px;width: 110px">
											            	<img alt="无" src="upload/${food.fImg }" width="100px" height="70px">
											            </td>
											            <td>${food.fName}</td>
											            <td>${food.ftName}</td>
											            <td style="width: 130px">
											            <c:if test="${sessionScope.emp.roleRule==1 }">
												            <c:if test="${food.fPrice==food.fDprice}">
												            ¥${food.fPrice}
												            <a href="food-updateDc?fId=${food.fId }&&pageNo=${pageInfo.pageNum }" class="dec"><i class="fa fa-edit"></i>折扣</a>
												            </c:if>
												            <c:if test="${food.fPrice!=food.fDprice}">
												            <font color='red'>¥${food.fDprice}</font>(¥${food.fPrice})
												            <a href="food-updateDc?fId=${food.fId }&&pageNo=${pageInfo.pageNum }" class="dec" ><i class="fa fa-edit"></i>折扣</a>
												        	</c:if>
											            </c:if>
											            <c:if test="${sessionScope.emp.roleRule==0 }">
												            <c:if test="${food.fPrice==food.fDprice}">
												            ${food.fPrice}
												            <a href="#" class="dec root"><i class="fa fa-edit"></i>折扣</a>
												            </c:if>
												            <c:if test="${food.fPrice!=food.fDprice}">
												            <font color='red'>${food.fDprice}</font>(${food.fPrice})
												            <a href="#" class="dec root" ><i class="fa fa-edit"></i>折扣</a>
												        	</c:if>
												        </c:if>
											            </td>
											            <td>
											            	<c:if test="${food.fStatus==0}">
											            	<label class="custom-switch">
																<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" onclick="checkboxOnclick(this)" value="true" checked="checked">
																<input id="status" type="hidden" value="${food.fId }" />
																<span class="custom-switch-indicator"></span>
															</label>
															</c:if>
															<c:if test="${food.fStatus==1}">
											            	<label class="custom-switch">
																<input type="checkbox" name="custom-switch-checkbox" class="custom-switch-input" onclick="checkboxOnclick(this)" value="true" >
																<input id="status" type="hidden" value="${food.fId }" />
																<span class="custom-switch-indicator"></span>
															</label>
															</c:if>
											            </td>
											            <td  >${food.fDec}</td>
											            <td>
											            <c:if test="${sessionScope.emp.roleRule==1 }">
															<a href="food-update?fId=${food.fId }&&pageNo=${pageInfo.pageNum }" class="btn btn-warning" >修改</a>
															<a href="javascript:void(0)" class="btn btn-danger" onclick="showDeleteModal(this)">删除	<input type="hidden" value="${food.fId }" /></a>
											            </c:if>
											            <c:if test="${sessionScope.emp.roleRule==0 }">
											            	<a href="#" class="btn btn-warning root" >修改</a>
															<a href="javascript:void(0)" class="btn btn-danger root" >删除	<input type="hidden" value="${food.fId }" /></a>
											            </c:if>
											            </td>
											          </tr>
											          </c:forEach>
												</table>
											</div>
											<br/>
											
									        <nav aria-label="Page navigation example">
									        <span style="color:black">
									        	当前<font style="color:#66CD00"> ${pageInfo.pageNum }</font> / <font style="color:#66CD00">${pageInfo.pages }</font>页,
									        	共<font style="color:#66CD00"> ${pageInfo.total }</font> 条记录</span>
												<ul class="pagination  mb-0 pull-right">
													
													<li class="page-item">
														<a class="page-link" href="food?pageNo=${pageInfo.firstPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">首页</font></font></a>
													</li>
													
													<c:if test="${pageInfo.hasPreviousPage }">
													<li class="page-item">
														<a class="page-link" href="food?pageNo=${pageInfo.pageNum-1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">上一页</font></font></a>
													</li>
													</c:if>
													<c:if test="${pageInfo.hasNextPage }">
													<li class="page-item">
														<a class="page-link" href="food?pageNo=${pageInfo.pageNum+1}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">下一页</font></font></a>
													</li>
													</c:if>
													<li class="page-item">
														<a class="page-link" href="food?pageNo=${pageInfo.lastPage}"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">最后页</font></font></a>
													</li>
												</ul>
											</nav>
										</div>
									</div>
								</div>
						</div>	
					</section>
				</div>

				<footer class="main-footer">
					<div class="text-center">
						Copyright &copy;Royaltea 2018. Design By<a href="#"> ZhuoRan Huang</a>
					</div>
				</footer>

			</div>
		</div>
		<!-- 删除 -->
		<div id="smallModal" class="modal fade" aria-hidden="true" style="display: none;">
			<div class="modal-dialog modal-sm" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h6 class="tx-14 mg-b-0 tx-uppercase tx-inverse tx-bold">提示</h6>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<input type="hidden" id="deleteId" />
						<p class="mb-0">您确认要删除该条信息吗？</p>
					</div><!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="deleteBtn">删除</button>
						<button type="button" class="btn btn-success" data-dismiss="modal" >关闭</button>
					</div>
				</div>
			</div><!-- modal-dialog -->
		</div>
		<!-- 添加 -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="food-add" class="form-horizontal" method="post" enctype="multipart/form-data">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">添加食品</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">菜名：</label>
								<div class="col-sm-9">
									<input type="text" required="required" pattern="^[\u4e00-\u9fa5]{2,10}$" class="form-control" name="fName" placeholder="请输入2-10位的中文"
									 oninvalid="setCustomValidity('请输入2-10位中文');" oninput="setCustomValidity('');"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜品：</label>
								<div class="col-sm-9">
									<select required="required" name="ftId" class="form-control">
										<option value="">请选择菜品</option>
										
										<c:forEach items="${foodtypeInfo}" var="ft">
										<option value="${ft.ftId }">
											${ft.ftName }
										</option>
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图片上传：</label>
								<div class="col-sm-9">
								<input type=file name="img" id="doc" onchange="showImage();" >												
								</div>
								<div id="localImag">
				                    <img id="preview" width=-1 height=-1 style="diplay:none" />
				                </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">价格：</label>
								<div class="col-sm-9">
									<input type="text" required="required"  class="form-control" name="fPrice" placeholder="请输入价格" 
									 pattern="^[0-9]+([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入小数不超过一位的数字');" oninput="setCustomValidity('');"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">状态：</label>
								<div class="col-sm-9">
									<label class="checkbox-inline">
									  <input type="radio" value="0" name="fStatus" checked="checked"/> 上架
									</label>
									<label class="checkbox-inline">
									  <input type="radio" value="1" name="fStatus" /> 下架
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述：</label>
								<div class="col-sm-9">
									<textarea name="fDec" rows="7" cols="60" placeholder="请输入少于50字的描述" maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)"
									pattern="^.{0,50}$" oninvalid="setCustomValidity('请输入少于50字的描述');" oninput="setCustomValidity('');" ></textarea>
								</div>
							</div>
											
							

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">添加</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		
		<!--Jquery.min js-->
		<script src="assets/js/jquery.min.js"></script>

		<!--popper js-->
		<script src="assets/js/popper.js"></script>

		<!--Tooltip js-->
		<script src="assets/js/tooltip.js"></script>

		<!--Bootstrap.min js-->
		<script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

		<!--Jquery.nicescroll.min js-->
		<script src="assets/plugins/nicescroll/jquery.nicescroll.min.js"></script>

		<!--Scroll-up-bar.min js-->
		<script src="assets/plugins/scroll-up-bar/dist/scroll-up-bar.min.js"></script>

		<!--mCustomScrollbar js-->
		<script src="assets/plugins/scroll-bar/jquery.mCustomScrollbar.concat.min.js"></script>
		
		<!--Sidemenu js-->
		<script src="assets/plugins/toggle-menu/sidemenu.js"></script>

		<!--Scripts js-->
		<script src="assets/js/scripts.js"></script>
		
		<script type="text/javascript">
    function showImage() {
        var docObj = document.getElementById("doc");
        var f=$(docObj).val();
        var imgObjPreview = document.getElementById("preview");
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
        {
            alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            $(docObj).val('');
            return false;
        }
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性  
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '220px';
            imgObjPreview.style.height = '200px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();  
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜  
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag");
            //必须设置初始大小  
            localImagId.style.width = "150px";
            localImagId.style.height = "200px";
          
            //图片异常的捕捉，防止用户修改后缀来伪造图片 
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                        .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>
<script type="text/javascript">
    function showImage1() {
        var docObj = document.getElementById("doc1");
        var f=$(docObj).val();
        var imgObjPreview = document.getElementById("preview1");
        if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
        {
            alert("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
            $(docObj).val('');
            return false;
        }
        if (docObj.files && docObj.files[0]) {
            //火狐下，直接设img属性  
            imgObjPreview.style.display = 'block';
            imgObjPreview.style.width = '220px';
            imgObjPreview.style.height = '200px';
            //imgObjPreview.src = docObj.files[0].getAsDataURL();  
            //火狐7以上版本不能用上面的getAsDataURL()方式获取，需要一下方式  
            imgObjPreview.src = window.URL.createObjectURL(docObj.files[0]);
        } else {
            //IE下，使用滤镜  
            docObj.select();
            var imgSrc = document.selection.createRange().text;
            var localImagId = document.getElementById("localImag1");
            //必须设置初始大小  
            localImagId.style.width = "150px";
            localImagId.style.height = "200px";
          
            //图片异常的捕捉，防止用户修改后缀来伪造图片 
            try {
                localImagId.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                localImagId.filters
                        .item("DXImageTransform.Microsoft.AlphaImageLoader").src = imgSrc;
            } catch (e) {
                alert("您上传的图片格式不正确，请重新选择!");
                return false;
            }
            imgObjPreview.style.display = 'none';
            document.selection.empty();
        }
        return true;
    }
</script>
		
		<script type="text/javascript">
		$(".page-link").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".btn-warning").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".btn-abc").bind('click', function(event) {
			event.stopPropagation();
		});
		$("#doc").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".dec").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".custom-switch-indicator").bind('click', function(event) {
			event.stopPropagation();
		});
		$(".custom-switch-input").bind('click', function(event) {
			event.stopPropagation();
		});
		
		</script>
		<script type="text/javascript">
		// 打开询问是否删除的模态框并设置需要删除的大修的ID
		function showDeleteModal(obj) {
		    var delete_id = $(obj).children("input").val();// 获取隐藏的ID
		    $("#deleteId").val(delete_id);// 将模态框中需要删除的大修的ID设为需要删除的ID
		    $("#smallModal").modal("show");
		}
		function deleteHaulinfo() {
		    var deleteId = $("#deleteId").val();
		    $.ajax({
                type:"POST",
                url:"food-delete",
                data: {fId:deleteId},
                success:function (data) {
                	if(data=="true"){
                		window.location.reload();
                        alert("删除成功");
                	}else{
                		alert("删除失败");
                	}
                    
                }
            })
		}

		$(function() {
			// 删除大修模态框的确定按钮的点击事件
			$("#deleteBtn").click(function() {
				// ajax异步删除
				deleteHaulinfo();
			});
		});
	
		</script>
		<c:if test="${updateInfo!=null }"> 
		<!-- 修改 -->
	
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="food-update1" class="form-horizontal" method="post" enctype="multipart/form-data">
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">修改员工</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">菜名：</label>
								<div class="col-sm-9">
									<input type="text" required="required" value="${updateInfo.fName }" pattern="^[\u4e00-\u9fa5]{2,10}$" class="form-control" name="fName" placeholder="请输入2-10位的中文"
									 oninvalid="setCustomValidity('请输入2-10位中文');" oninput="setCustomValidity('');"/>
									 <input type="hidden" value="${updateInfo.fId }" required="required"  class="form-control" name="fId" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">菜品：</label>
								<div class="col-sm-9">
									<select required="required" name="ftId" class="form-control">
										<option value="">请选择菜品</option>
										
										<c:forEach items="${foodtypeInfo}" var="ft">
										<c:choose> 

										 <c:when test="${ft.ftId==updateInfo.ftId }">    <!--如果 --> 
											<option value="${ft.ftId }" selected="selected">
											${ft.ftName }
											</option>
										 </c:when>      
										
										  <c:otherwise>  <!--否则 -->    
											<option value="${ft.ftId }">
											${ft.ftName }
											</option>
										  </c:otherwise> 
										
										</c:choose>
										
										</c:forEach>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">图片上传：</label>
								<div class="col-sm-9">
								<input type=file name="img" id="doc1" onchange="showImage1();" >												
								</div>
								<div id="localImag1">
				                    <img id="preview1" width=-1 height=-1 style="diplay:none" />
				                </div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">价格：</label>
								<div class="col-sm-9">
									<input type="text" required="required" value="${updateInfo.fPrice }" class="form-control" name="fPrice" placeholder="请输入价格" 
									 pattern="^[0-9]+([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入小数不超过一位的数字');" oninput="setCustomValidity('');"/>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">状态：</label>
								<div class="col-sm-9">
									<c:choose> 
										 <c:when test="${updateInfo.fStatus == 0}">    <!--如果 --> 
											<label class="checkbox-inline">
											  <input type="radio" value="0" name="fStatus" checked="checked"/> 上架
											</label>
											<label class="checkbox-inline">
											  <input type="radio" value="1" name="fStatus" /> 下架
											</label>
										 </c:when>      
										  <c:otherwise>  <!--否则 -->    
											<label class="checkbox-inline">
											  <input type="radio" value="0" name="fStatus" /> 上架
											</label>
											<label class="checkbox-inline">
											  <input type="radio" value="1" name="fStatus" checked="checked"/> 下架
											</label>
										  </c:otherwise> 
									</c:choose>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label">描述：</label>
								<div class="col-sm-9">
									<textarea name="fDec" rows="7" cols="60"  maxlength="100" onchange="this.value=this.value.substring(0, 100)" onkeydown="this.value=this.value.substring(0, 100)" onkeyup="this.value=this.value.substring(0, 100)"
									placeholder="请输入少于50字的描述"  >${updateInfo.fDec }</textarea>
								</div>
							</div>					
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$('#updateModal').modal("show");
		</script>
		</c:if>
		<c:if test="${dcInfo!=null }"> 
		<!-- 修改折扣 -->
		<div class="modal fade" id="dcModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<form action="food-updateDc1" class="form-horizontal" method="post" >
						<div class="modal-header">
							<h4 class="modal-title" id="myModalLabel">修改折扣</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="col-sm-3 control-label">菜名：</label>
								<div class="col-sm-9">
									<input type="text" required="required" readonly="readonly" value="${dcInfo.fName }" pattern="^[\u4e00-\u9fa5]{2,10}$" class="form-control" name="fName" placeholder="请输入2-10位的中文"
									 oninvalid="setCustomValidity('请输入2-10位中文');" oninput="setCustomValidity('');"/>
									 <input type="hidden" value="${dcInfo.fId }" required="required"  class="form-control" name="fId" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">价格：</label>
								<div class="col-sm-9">
									<input type="text" required="required" readonly="readonly" value="¥${dcInfo.fPrice }" class="form-control" name="fPrice" placeholder="请输入价格" 
									 pattern="^[0-9]+([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入小数不超过一位的数字');" oninput="setCustomValidity('');"/>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">折扣价格：</label>
								<div class="col-sm-9">
									<c:if test="${dcInfo.fDprice!=dcInfo.fPrice }">
									<input type="text" required="required" readonly="readonly" value="¥${dcInfo.fDprice }&nbsp; (${dcInfo.fDc }折)" class="form-control" name="fPrice" placeholder="请输入价格" 
									 pattern="^[0-9]+([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入小数不超过一位的数字');" oninput="setCustomValidity('');"/>
									</c:if>
									<c:if test="${dcInfo.fDprice==dcInfo.fPrice }">
									<input type="text" required="required" readonly="readonly" value="无" class="form-control" name="fPrice" placeholder="请输入价格" 
									 pattern="^[0-9]+([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入小数不超过一位的数字');" oninput="setCustomValidity('');"/>
									</c:if>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label">折扣：</label>
								<div class="col-sm-9">
									<input type="text" required="required" class="form-control" name="fDc" placeholder="请输入0.0～9.9范围的数字" 
									 pattern="^[0-9]{0,1}([.]{1}[0-9]{0,1}){0,1}$" oninvalid="setCustomValidity('请输入0.0～9.9范围的数字');" oninput="setCustomValidity('');"/>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">修改</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		$('#dcModal').modal("show");
		</script>
		</c:if>
		<script type="text/javascript">
		var roots = $(".root");
		roots.click(function() {
			  alert("抱歉，您没有权限进行此项操作");
		});
		
		</script>
		<script type="text/javascript"> 

		

		function checkboxOnclick(checkbox){
			var delete_id = $(checkbox).next().val();
			if ( checkbox.checked == true){
			//Action for checked
				$.ajax({
	                type:"POST",
	                url:"status-update",
	                data: {fId:delete_id,status:0},
	                success:function (data) {
	                	if(data=="true"){
	                        alert("上架成功");
	                	}else{
	                		alert("上架失败");
	                	}
	                    
	                }
	            })
			 
			}else{
			//Action for not checked
			 $.ajax({
                type:"POST",
                url:"status-update",
                data: {fId:delete_id,status:1},
                success:function (data) {
                	if(data=="true"){
                        alert("下架成功");
                	}else{
                		alert("下架失败");
                	}
                    
                }
            })
			}
		}
		
	    </script>
	</body>
</html>
