<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="iii.team3.product.model.ProductBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>Product Update</title>
    <%@ include file="/template/front/head.jsp"%>
</head>
<body>
	<!-- navbar-->
		<!--
      *** TOPBAR ***
      _________________________________________________________
      -->
      <%@ include file="/template/front/header.jsp"%>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<c:url value='/home'/>">首頁</a></li>
								<li aria-current="page" class="breadcrumb-item active">商品修改</li>
							</ol>
						</nav>
					</div>
					<div id="checkout" class="col-lg-9">
						<div class="box">
							<form></form>
							<form action="../selectMethod" method="post" enctype="multipart/form-data">
							<%
   							ProductBean bean = (ProductBean)session.getAttribute("bean");
							%>
								<h1>商品修改</h1>
								<div class="content py-3">
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="firstname">商品名稱</label> 
												<input type="hidden" name="pAccount" value="<%=bean.getUserName() %>" />
												<input type="hidden" name="pId" value="<%=bean.getProductId() %>"/>
												<input type="hidden" name="oldName" value="<%=bean.getProductName()%>" /> 
												<input id="productName" type="text" class="form-control" name="uName" maxlength="200" value="<%=bean.getProductName()%>" />
											</div>
										</div>
									</div>
									<div class="row">
										<div  class="col-md-6">
											<div id="productNameResult" class="form-group">
											</div>
										</div>
									</div>
									<!-- /.row-->
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="company">商品價格</label> 
												<input class="form-control" id="productPrice" type="text" name="uPrice" size="20"
												 maxlength="8" oninput="value=value.replace(/[^\d]/g,'')" value="<%=bean.getProductPrice() %>" />
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="street">商品數量</label> 
												<input class="form-control" id="productAmount" type="text" name="uAmount" size="20"
													   maxlength="3" oninput="value=value.replace(/[^\d]/g,'')" value="<%=bean.getProductAmount()%>" />
											</div>
										</div>
										<div class="col-md-6">
											<div id="priceResult" class="form-group"></div>
										</div>
										<div class="col-md-6">
											<div id="amountResult" class="form-group"></div>
										</div>
									</div>
									<!-- /.row-->
									<div class="row">
										<div class="col-md-6 col-lg-3">
											<div class="form-group">
												<label for="city">商品狀況</label> 
												<select name="uType" size="1"class="form-control">
													<option value="全新">全新</option>
													<option value="二手">二手</option>
												</select>
											</div>
										</div>
										<div class="col-md-6 col-lg-3">
											<div class="form-group">
												<label for="zip">商品類別</label> 
												<select name="uCategory" size="1" class="form-control">
													<option value="3C">3C</option>
													<option value="clothes">衣服</option>
													<option value="furnitures">家電</option>
													<option value="foods">食品</option>
													<option value="exercise">運動</option>
													<option value="cosmetics">美妝</option>
													<option value="luxuries">精品</option>
													<option value="pets">寵物</option>
													<option value="toys">玩具</option>
													<option value="others">其他</option>
												</select>
											</div>
										</div>
										<div class="col-md-6 col-lg-3">
											<div class="form-group">
												<label for="state">商品所在地</label> 
												<select name="uLocation" size="1" class="form-control">
													<option value="新北">新北</option>
													<option value="台北">台北</option>
													<option value="桃園">桃園</option>
													<option value="新竹">新竹</option>
													<option value="苗栗">苗栗</option>
													<option value="台中">台中</option>
													<option value="彰化">彰化</option>
													<option value="雲林">雲林</option>
													<option value="嘉義">嘉義</option>
													<option value="台南">台南</option>
													<option value="高雄">高雄</option>
													<option value="屏東">屏東</option>
													<option value="台東">台東</option>
													<option value="花蓮">花蓮</option>
													<option value="宜蘭">宜蘭</option>
													<option value="南投">南投</option>
													<option value="金門">金門</option>
													<option value="澎湖">澎湖</option>
												</select>
											</div>
										</div>
										<div class="col-md-6 col-lg-3">
											<div class="form-group">
												<label for="lastname">圖片上傳</label> 
												<input type='file' name="uImgLink" id="newImgInput" class="form-control" />
											</div>
										</div>
									
										<div class="col-md-6">
											<div class="form-group">
												<label for="email">付款方式</label><br/>
												<label><input type="checkbox" name="upayType" value=0 checked />ATM</label> 
												<label><input type="checkbox" name="upayType" value=1 />貨到付款</label>
												<label><input type="checkbox" name="upayType" value=2 />信用卡</label> 
												<label><input type="checkbox" name="upayType" value=3 />面交</label>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="phone">運送方式</label><br/>
												<label><input type="checkbox" name="ushipType" value=0 checked />郵寄</label>
												<label><input type="checkbox" name="ushipType" value=1 />超商</label>
												<label><input type="checkbox" name="ushipType" value=2 />面交</label>
											</div>
										</div>
										<div class="col-md-6">
											<div id="payResult" class="form-group"></div>
										</div>
										<div class="col-md-6">
											<div id="shipResult" class="form-group"></div>
										</div>
										<div class="col-md-12">
											<div class="form-group">
												<label for="street">商品說明</label>
												<textarea id="productDescription" name="uDescription" rows="6" cols="40"
													class="form-control"><%=bean.getProductDescription() %></textarea>
											</div>
										</div>
										<div class="col-md-12">
											<div id="DescriptionResult" class="form-group"></div>
										</div>
									</div>
									<!-- /.row-->
								</div>
								<div class="box-footer" align = "right">
									<a href="<c:url value='../memberListPage' />" class="btn btn-outline-secondary"><i
										class="fa fa-chevron-left"></i>回前頁</a>
									<input id = "updateProduct" type="submit" name="productUpdateOrDelete" value="更新" class="btn btn-outline-secondary btn-info" />
									<input type="submit" name="productUpdateOrDelete" value="刪除" class="btn btn-outline-secondary btn-info" />
									<input type="submit" name="productUpdateOrDelete" value="上架" class="btn btn-outline-secondary btn-info" />
									<input type="submit" name="productUpdateOrDelete" value="下架" class="btn btn-outline-secondary btn-info" />
								</div>
							</form>
						</div>
						<!-- /.box-->
					</div>
					<!-- /.col-lg-9-->
					<div class="col-lg-3">
						<div id="order-summary" class="card">
							<div class="card-header">
								<h3 class="mt-4 mb-4" style="text-align: center">圖片預覽</h3>
							</div>
								<div class="card"
									style="height: 400px; justify-content: center;">
									<img class="newImg" style="height: auto; margin-right: 0" src="../../image/<%= bean.getUserName() + bean.getProductName()%>.jpg"/>
								</div>
						</div>
					</div>
					<!-- /.col-lg-3-->
				</div>
			</div>
		</div>
	</div>
	<!--
    *** FOOTER ***
    _________________________________________________________

	<!-- /#footer-->
	<!-- *** FOOTER END ***-->


	<!--
    *** COPYRIGHT ***
    _________________________________________________________

	<!-- *** COPYRIGHT END ***-->
	<!-- JavaScript files-->
  <%@ include file="/template/front/footer.jsp"%>
	<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
	<script>
		$('input#newImgInput').on('change', function(e) {
			const file = this.files[0];
			const objectURL = URL.createObjectURL(file);
			$('img.newImg').attr('src', objectURL);
		});
	</script>
	<script>
	var updateProduct = document.getElementById("updateProduct");
	var productNameResult = document.getElementById("productNameResult");
	var priceResult = document.getElementById("priceResult");
	var amountResult = document.getElementById("amountResult");
	var DescriptionResult = document.getElementById("DescriptionResult");
	var payResult = document.getElementById("payResult");
	var shipResult = document.getElementById("shipResult");
	
	updateProduct.onclick = function(){
	var hasError = false;
	var productNameCheck = document.getElementById("productName").value;
	var priceCheck = document.getElementById("productPrice").value;
	var amountCheck = document.getElementById("productAmount").value;
	var DescriptionCheck = document.getElementById("productDescription").value;
	var payCheck = $("input[name='upayType']:checked").length;
	var shipCheck = $("input[name='ushipType']:checked").length;
	
		if(!productNameCheck){
			productNameResult.innerHTML = "<font color='red' size='-1'>商品名稱請勿空白</font>";
			hasError = true;
		}else{
			productNameResult.innerHTML = "";
		}
		
		if(!priceCheck){
			priceResult.innerHTML = "<font color='red' size='-1'>價格請勿空白</font>";
			hasError = true;
		}else{
			priceResult.innerHTML = "";
		}
		
		if(!amountCheck){
			amountResult.innerHTML = "<font color='red' size='-1'>數量請勿空白</font>";
			hasError = true;
		}else{
			amountResult.innerHTML = "";
		}

		if(!DescriptionCheck){
			DescriptionResult.innerHTML = "<font color='red' size='-1'>商品說明請勿空白</font>";
			hasError = true;
		}else{
			DescriptionResult.innerHTML = "";
		}
		
		if(payCheck == 0){
			payResult.innerHTML = "<font color='red' size='-1'>請至少勾選一種付款方式</font>";
			hasError = true;
		}else{
			payResult.innerHTML = "";
		}
		
		if(shipCheck == 0){
			shipResult.innerHTML = "<font color='red' size='-1'>請至少勾選一種運送方式</font>";
			hasError = true;
		}else{
			shipResult.innerHTML = "";
		}
		
		if(hasError){
			return false;	
		}
	}

	</script>
</body>
</html>