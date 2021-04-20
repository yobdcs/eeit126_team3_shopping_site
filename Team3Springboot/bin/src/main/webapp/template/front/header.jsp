<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="header mb-5">
	<!--
      *** TOPBAR ***
      _________________________________________________________
      -->
	<div id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offer mb-3 mb-lg-0">
					<a href="#" class="btn btn-success btn-sm">活動專頁</a><a href="#" class="ml-1">目前尚無活動，敬請期待!</a>
				</div>
				<div class="col-lg-6 text-center text-lg-right">
					<ul class="menu list-inline mb-0">
						<li class="list-inline-item" id="loginLi"><a href="#" data-toggle="modal"
							data-target="#login-modal">登入</a></li>
						<li class="list-inline-item" id="regLi"><a href="insertpage.controller">註冊</a></li>
						<li class="list-inline-item"><a href="#">聯絡我們</a></li>
						<li class="list-inline-item"><a href="<c:url value="/ShowAll.controller" />">先前瀏覽</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="login-modal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true" class="modal fade">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">登入</h5>
						<button type="button" data-dismiss="modal" aria-label="Close"
							class="close">
							<span aria-hidden="true">&times</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- <form action="#" method="get"> -->
							<div class="form-group">
								<input id="email-modal" type="text" placeholder="帳號名稱"
									class="form-control">
							</div>
							<div class="form-group">
								<input id="password-modal" type="password"
									placeholder="密碼" class="form-control">
							</div>
							<p class="text-center">
								<button class="btn btn-primary" id="loginBt">
									<i class="fa fa-sign-in"></i> 確定
								</button>
							</p>
						<!-- </form> -->
						<p class="text-center text-muted" id="restext"></p>
						<p class="text-center text-muted">
							還沒有帳號嗎? 請點擊<a href="#"><strong>這裡</strong></a>註冊，過程只需一分鐘且能為您帶來更多優惠與服務!
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- *** TOP BAR END ***-->


	</div>
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a href="<c:url value='/' />" class="navbar-brand home"><img
				src="${pageContext.request.contextPath}/distribution/img/logo.png" alt="Obaju logo" class="d-none d-md-inline-block"><img
				src="${pageContext.request.contextPath}/distribution/img/logo-small.png" alt="Obaju logo"
				class="d-inline-block d-md-none"><span class="sr-only">Obaju
					- go to homepage</span></a>
			<div class="navbar-buttons">
				<button type="button" data-toggle="collapse"
					data-target="#navigation"
					class="btn btn-outline-secondary navbar-toggler">
					<span class="sr-only">Toggle navigation</span><i
						class="fa fa-align-justify"></i>
				</button>
				<button type="button" data-toggle="collapse" data-target="#search"
					class="btn btn-outline-secondary navbar-toggler">
					<span class="sr-only">Toggle search</span><i class="fa fa-search"></i>
				</button>
				<a href="#"
					class="btn btn-outline-secondary navbar-toggler"><i
					class="fa fa-shopping-cart"></i></a>
			</div>
			<div id="navigation" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a href="<c:url value='/' />" class="nav-link active">首頁</a></li>
<!-- 					<li class="nav-item dropdown menu-large"><a href="#"
						data-toggle="dropdown" data-hover="dropdown" data-delay="200"
						class="dropdown-toggle nav-link">Men<b class="caret"></b></a>
						<ul class="dropdown-menu megamenu">
							<li>
								<div class="row">
									<div class="col-md-6 col-lg-3">
										<h5>Clothing</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">T-shirts</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Shirts</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Pants</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Accessories</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>Shoes</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>Accessories</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>Featured</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
										</ul>
										<h5>Looks and trends</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
										</ul>
									</div>
								</div>
							</li>
						</ul></li> -->
					<!-- <li class="nav-item dropdown menu-large"><a href="#"
						data-toggle="dropdown" data-hover="dropdown" data-delay="200"
						class="dropdown-toggle nav-link">Ladies<b class="caret"></b></a>
						<ul class="dropdown-menu megamenu">
							<li>
								<div class="row">
									<div class="col-md-6 col-lg-3">
										<h5>Clothing</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">T-shirts</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Shirts</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Pants</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Accessories</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>Shoes</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>Accessories</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Casual</a></li>
										</ul>
										<h5>Looks and trends</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Trainers</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Sandals</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Hiking shoes</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<div class="banner">
											<a href="#"><img src="distribution/img/banner.jpg" alt=""
												class="img img-fluid"></a>
										</div>
										<div class="banner">
											<a href="#"><img src="distribution/img/banner2.jpg" alt=""
												class="img img-fluid"></a>
										</div>
									</div>
								</div>
							</li>
						</ul></li> -->
					<li class="nav-item dropdown menu-large"><a href="#"
						data-toggle="dropdown" data-hover="dropdown" data-delay="200"
						class="dropdown-toggle nav-link">會員功能<b class="caret"></b></a>
						<ul class="dropdown-menu megamenu">
							<li>
								<div class="row">
									<div class="col-md-6 col-lg-3">
										<h5>商城</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="<c:url value='/' />" class="nav-link">首頁</a></li>
											<!-- <li class="nav-item"><a href="#" class="nav-link">Category - sidebar left</a></li>
											<li class="nav-item"><a href="#" class="nav-link">Category - sidebar right</a></li>
											<li class="nav-item"><a href="#" class="nav-link">Category - full width</a></li> -->
											<li class="nav-item"><a href="<c:url value="/product/listPage" />" class="nav-link">商品列表</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>會員資訊</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="insertpage.controller" class="nav-link">註冊會員</a></li>
											<!-- <li class="nav-item"><a href="#"
												class="nav-link">Order history detail</a></li> -->
											<!-- <li class="nav-item"><a href="#"
												class="nav-link">Wishlist</a></li> -->
											<li class="nav-item"><a href="<c:url value="/updatepage.controller" />" class="nav-link">修改會員資料</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>會員功能</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="<c:url value="/shoppingCart/gotoShoppingCartPage" />"
												class="nav-link">購物車</a></li>
											<li class="nav-item"><a href="<c:url value="/shoppingCart/transactionBack/overview" />"
												class="nav-link">交易紀錄查詢</a></li>
											<li class="nav-item"><a href="<c:url value="/product/goAddProduct" />"
												class="nav-link">商品上架</a></li>
											<li class="nav-item"><a href="<c:url value="/product/memberListPage" />"
												class="nav-link">商品修改</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<!-- <h5>Pages and blog</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a href="#"
												class="nav-link">Blog listing</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Blog Post</a></li>
											<li class="nav-item"><a href="#" class="nav-link">FAQ</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Text page</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Text page - right sidebar</a></li>
											<li class="nav-item"><a href="#" class="nav-link">404
													page</a></li>
											<li class="nav-item"><a href="#"
												class="nav-link">Contact</a></li>
										</ul> -->
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
				<div class="navbar-buttons d-flex justify-content-end">
					<!-- /.nav-collapse-->
					<div id="search-not-mobile" class="navbar-collapse collapse"></div>
					<a data-toggle="collapse" href="#search"
						class="btn navbar-btn btn-primary d-none d-lg-inline-block"><span
						class="sr-only">Toggle search</span><i class="fa fa-search"></i></a>
					<div id="basket-overview"
						class="navbar-collapse collapse d-none d-lg-block">
						<a href="<c:url value="/shoppingCart/gotoShoppingCartPage" />" class="btn btn-primary navbar-btn"><i
							class="fa fa-shopping-cart"></i><span>購物車</span></a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<div id="search" class="collapse">
		<div class="container">
		
		<iframe id="fileloader" src="productnames/products_names.txt" onload="start()" style="display: none;"></iframe>			
			<form role="search" class="ml-auto">
				<div class="input-group">
					<input id="myInput" type="text" name="myProduct" class="form-control" placeholder="商品名稱">
					<div class="input-group-append">
						<button type="button" class="btn btn-primary">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</header>
<script src="js/autocomplete.js"></script>
<script>
//window.onload = function(){
	var ss = "${sessionScope.loginBean.account}"
	if(ss.length != 0){
		var loginLi = document.getElementById("loginLi");
		var regLi = document.getElementById("regLi");
		loginLi.innerHTML="<a>登入中 : </a><a href=''>"+ss+"</a>";
		regLi.innerHTML="<a href='javascript:' id='a'>登出</a>";
		var a = document.getElementById("a");
		a.onclick = function(){
			var xhra = new XMLHttpRequest();
			xhra.open("GET","<c:url value='/logout.controller' />",true);
			xhra.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhra.send();

			xhra.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhra.readyState == 4 && (xhra.status == 200 || xhra.status == 201) ) {
					var resTex = xhra.responseText;
					if(resTex === "sucess"){
						window.location.reload();
					}
				} 
			}
		}
	}else{
		var loginBt = document.getElementById("loginBt");
		loginBt.onclick = function(){
			var accValue = document.getElementById("email-modal").value;
			var pwValue = document.getElementById("password-modal").value;
			var xhrlo = new XMLHttpRequest();
			xhrlo.open("POST","<c:url value='/checkAccPw.controller' />",true);
			xhrlo.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhrlo.send("account="+ accValue+"&password="+pwValue);

			xhrlo.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhrlo.readyState == 4 && (xhrlo.status == 200 || xhrlo.status == 201) ) {
					var resTex = xhrlo.responseText;
						//alert(xhr.responseText);
						var restext = document.getElementById("restext");
					if(resTex === "sucess"){
						restext.innerHTML="sucess";
						window.location.reload();
					}else if(resTex === "no found"){
						restext.innerHTML="找不到此帳號";
					}else if(resTex === "error"){
						restext.innerHTML="密碼錯誤";
					}
				} 
			}

		}
	}
//}


</script>