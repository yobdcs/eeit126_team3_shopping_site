<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/js/autocomplete.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<header class="header mb-5">
	<!--
      *** TOPBAR ***
      _________________________________________________________
      -->
	<div id="top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offer mb-3 mb-lg-0">
					<a href="#" class="btn btn-success btn-sm">活動專頁</a><a href="#"
						class="ml-1">目前尚無活動，敬請期待!</a>
				</div>
				<div class="col-lg-6 text-center text-lg-right">
					<ul class="menu list-inline mb-0">
						<li class="list-inline-item" id="loginLi"><a href="#"
							data-toggle="modal" data-target="#login-modal">登入</a></li>
						<li class="list-inline-item" id="regLi"><a
							href="<c:url value="/insertpage.controller" />">註冊</a></li>
<!-- 						<li class="list-inline-item"><a href="#">聯絡我們</a></li> -->
						<li class="list-inline-item" id="managerPage" style="display:none">
							<a href="<c:url value="/MessageBoard/getMsgChart.controller" />">管理中心</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div id="login-modal" tabindex="-1" role="dialog"
			aria-labelledby="Login" aria-hidden="true" class="modal fade">
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
							<input id="password-modal" type="password" placeholder="密碼"
								class="form-control">
						</div>
						<p class="text-center">
							<button class="btn btn-primary" id="loginBt">
								<i class="fa fa-sign-in"></i> 確定
							</button>
							<button class="btn btn-primary" id="loginTest">管理者</button>
							<button class="btn btn-primary" id="login26">使用者</button>
						</p>
						<!-- </form> -->
<!-- 						<p class="text-center text-muted" id="restext"></p> -->
						<p class="text-center text-muted">
							還沒有帳號嗎? 請點擊<a href="<c:url value='/insertpage.controller' />"><strong>這裡</strong></a>註冊，過程只需一分鐘且能為您帶來更多優惠與服務!
							<br/><br/>忘記密碼嗎? 請點擊<a href="<c:url value='/ForgetPassword' />"><strong>忘記密碼</strong></a>協助您取回密碼。
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
				src="${pageContext.request.contextPath}/distribution/img/logo.png"
				alt="Obaju logo" class="d-none d-md-inline-block"><img
				src="${pageContext.request.contextPath}/distribution/img/logo-small.png"
				alt="Obaju logo" class="d-inline-block d-md-none"><span
				class="sr-only">Obaju - go to homepage</span></a>
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
				<a href="#" class="btn btn-outline-secondary navbar-toggler"><i
					class="fa fa-shopping-cart"></i></a>
			</div>
			<div id="navigation" class="collapse navbar-collapse">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a href="<c:url value='/home' />"
						class="nav-link active">首頁</a></li>
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
											<li class="nav-item"><a href="<c:url value='/home' />"
												class="nav-link">首頁</a></li>
											<!-- <li class="nav-item"><a href="#" class="nav-link">Category - sidebar left</a></li>
											<li class="nav-item"><a href="#" class="nav-link">Category - sidebar right</a></li>
											<li class="nav-item"><a href="#" class="nav-link">Category - full width</a></li> -->
											<li class="nav-item"><a
												href="<c:url value="/product/listPage" />" class="nav-link">商品列表</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>會員中心</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item" id="liregistered"><a href="<c:url value='/insertpage.controller' />"
												class="nav-link">註冊會員</a></li>
											<!-- <li class="nav-item"><a href="#"
												class="nav-link">Order history detail</a></li> -->
											<!-- <li class="nav-item"><a href="#"
												class="nav-link">Wishlist</a></li> -->
											<li class="nav-item" id="liupdatae"><a
												href="<c:url value='/updatepage.controller' />"
												class="nav-link">會員詳細資料</a></li> 
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>會員功能</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a
												href="<c:url value="/shoppingCart/gotoShoppingCartPage" />"
												class="nav-link">購物車</a></li>
											<li class="nav-item"><a
												href="<c:url value="/shoppingCart/transactionBack/overview" />"
												class="nav-link">交易紀錄查詢</a></li>
											<li class="nav-item"><a
												href="<c:url value="/shoppingCart/transactionBack/orderOverview" />"
												class="nav-link">交易訂單查詢</a></li>
											<li class="nav-item"><a
												href="<c:url value="/product/goAddProduct" />"
												class="nav-link">商品上架</a></li>
											<li class="nav-item"><a
												href="<c:url value="/product/memberListPage" />"
												class="nav-link">商品修改</a></li>
										</ul>
									</div>
									<div class="col-md-6 col-lg-3">
										<h5>一對一聊天</h5>
										<ul class="list-unstyled mb-3">
											<li class="nav-item"><a
												href="<c:url value="/gotochat" />" class="nav-link">進入私訊</a></li>
											<li class="nav-item"><a
												href="<c:url value="/gotochathistory" />" class="nav-link">聊天紀錄</a></li>
										</ul>
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
						<a href="<c:url value="/shoppingCart/gotoShoppingCartPage" />"
							class="btn btn-primary navbar-btn"><i
							class="fa fa-shopping-cart"></i><span>購物車</span></a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<div id="search" class="collapse">
		<div class="container">

			<iframe id="fileloader" src="${pageContext.request.contextPath}/productnames/products_names.txt" onload="start()" style="display: none;"></iframe>
			<form autocomplete="off" action="${pageContext.request.contextPath}/product/CustomerProductList"
					method="post" role="search" class="ml-auto">
				<div class="input-group">
					<input id="myInput" type="text" name="myProduct" size="14" maxlength="200" class="form-control" placeholder="輸入搜尋內容" />
					<div class="input-group-append">
						<select name="searchCustomerSelect" size="1" class="form-control">
							<option value="searchProduct">商品名稱</option>
							<option value="searchUser">賣家帳號</option>
						</select> 
						<input type="submit" name="searchCustomerListSubmit" value="搜尋" class="btn btn-outline-secondary" />
					</div>
					<div class="input-group-append"></div>
				</div>
			</form>
		</div>
	</div>
</header>
<script src="${pageContext.request.contextPath}/js/autocomplete.js"></script>
<script src="${pageContext.request.contextPath}/distribution/vendor/jquery/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<script>
	//window.onload = function(){
	var ss = "${sessionScope.loginBean.account}"
	if(ss === "manager"){
		document.getElementById("managerPage").style.display="";
		ss += "(管理者)";
	}
	if (ss.length != 0) {
		var loginLi = document.getElementById("loginLi");
		var regLi = document.getElementById("regLi");
		loginLi.innerHTML = "<a>登入中 : </a><a href='<c:url value='/updatepage.controller' />'>" + ss + "</a>";
		regLi.innerHTML = "<a href='javascript:' id='a'>登出</a>";
		document.getElementById("liregistered").style.display='none';
		var a = document.getElementById("a");
		a.onclick = function() {
			var xhra = new XMLHttpRequest();
			xhra.open("GET", "<c:url value='/logout.controller' />", true);
			xhra.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
			xhra.send();

			xhra.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhra.readyState == 4
						&& (xhra.status == 200 || xhra.status == 201)) {
					var resTex = xhra.responseText;
					if (resTex === "sucess") {
						swal({ title:"登出成功",
		                 	   html:"將跳轉至首頁",
		                 	   type:"success",
		                    }).then(function(){
		                 	   window.location.reload();
		                    });
					}
				}
			}
		}
	} else {
		var loginBt = document.getElementById("loginBt");
		loginBt.onclick = function() {
			var accValue = document.getElementById("email-modal").value;
			var pwValue = document.getElementById("password-modal").value;
			loginfc(accValue,pwValue);
		}
	}
	//}
	
	function loginfc(accValue,pwValue){
		var xhrlo = new XMLHttpRequest();
		xhrlo.open("POST", "<c:url value='/checkAccPw.controller' />",
						true);
		xhrlo.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		xhrlo.send("account=" + accValue + "&password=" + pwValue);

		xhrlo.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhrlo.readyState == 4
					&& (xhrlo.status == 200 || xhrlo.status == 201)) {
				var resTex = xhrlo.responseText;
				//alert(xhr.responseText);
				var restext = document.getElementById("restext");
				if (resTex === "sucess") {
					swal({ title:"登入成功",
	                 	   type:"success",
	                    }).then(function(){
	                 	   window.location.reload();
	                    });
				} else if (resTex === "no found") {
					swal({ title:"登入失敗",
	                 	   html:"找不到此帳號",
	                 	   type:"error",
	                 	   timer:2000,
	                    }).catch(function(timeout) { });
				} else if (resTex === "error") {
					swal({ title:"登入失敗",
	                 	   html:"密碼錯誤",
	                 	   type:"error",
	                 	   timer:2000,
	                    }).catch(function(timeout) { });
				}
			}
		}
	}
	
	document.getElementById("loginTest").onclick= function(){
		loginfc("manager","test");
	};
	document.getElementById("login26").onclick= function(){
		loginfc("yobdcs","t9307329");
	};

// 	var minSize = 5; //最小字型
//     var maxSize = 50;//最大字型
//     var newOne = 1; //生成雪花間隔
//     var flakColor = "black"; //雪花顏色
//     var flak = $("<div class='xh'></div>").css({position:"absolute","top":"0px"}).html("❉");//定義一個雪花
//     var dhight = $(window).height(); //定義檢視高度
//     var dw =$(window).width(); //定義檢視寬度
//     setInterval(function(){
//     var sizeflak = Math.random()*maxSize; //產生大小不等的雪花
//     var startLeft = Math.random()*dw; //雪花生成是隨機的left值
//     var startopcity = Math.random()*0.5; //隨機透明度
//     var endpositionTop= dhight+1500; //雪花停止top的位置
//     var endLeft= Math.random()*dw; //雪花停止的left位置
//     var durationfull = Math.random()*100000; //雪花飄落速度不同
//     flak.clone().appendTo($("body")).css({
//     "left":startLeft ,
//     "opacity":startopcity,
//     "font-size":sizeflak,
//     "color":flakColor
//     }).animate({
//     "top":endpositionTop,
//     "left":endLeft,
//     "apacity":0.1
//     },durationfull,function(){
//     $(this).remove()
//     });
//     },newOne);    
    
</script>