<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>忘記密碼</title>
<%@ include file="/template/front/head.jsp"%>
</head>
<body>
	<%@ include file="/template/front/header.jsp"%>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<c:url value='/home' />">首頁</a></li>
								<li aria-current="page" class="breadcrumb-item active">忘記密碼</li>
							</ol>
						</nav>
						<div id="error-page" class="row">
							<div class="col-md-6 mx-auto">
								<div class="box text-center py-5">
									<h3 id="h31">請輸入使用者帳號或使用者信箱</h3>
									<form>
										<div class="col-md-9 mx-auto">
											<div class="form-group">
	                        					<label for="accOrmail"></label>
	                        					<input id="accOrmail" type="text" class="form-control">
	                      					</div>
	                      				</div>
									</form>
<!-- 									<h3>請輸入信箱中的驗證碼</h3> -->
<!-- 										<div class="col-md-9 mx-auto my-0"> -->
<!-- 											<div class="form-group"> -->
<!-- 	                        					<input id="code" type="text" class="form-control"> -->
<!-- 	                      					</div> -->
<!-- 	                      				</div> -->
									<h4 class="text-muted">若無收到重設密碼通知信請稍後重試，並請檢查輸入的帳號或信箱是否有誤</h4>
									<button type="button" class="btn btn-primary" id="checkCode"><i class="fa fa-envelope-o"></i> 送出驗證信</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/template/front/footer.jsp"%>
	<script>
	window.onload = function(){
		var checkCode = document.getElementById("checkCode");
		checkCode.onclick = function(){
			var accOrmail = document.getElementById("accOrmail");
			var xhrchae = new XMLHttpRequest();
			xhrchae.open("POST","<c:url value='/checkAccOrEmail' />",true);
			xhrchae.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhrchae.send("accOrmail="+accOrmail.value);

			xhrchae.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhrchae.readyState == 4 && (xhrchae.status == 200 || xhrchae.status == 201) ) {
					var resTxt = xhrchae.responseText;
					if(resTxt === "error"){
						swal({ title:"信件寄送失敗",
		                 	   html:"請確認輸入資料",
		                 	   type:"error",
		                 	   timer:2000,
		                    }).catch(function(timeout) { });
					}else{
						swal({ title:"信件寄送成功",
		              	   html:"請至電子信箱確認",
		              	   type:"success",
		                 }).then(function(){
		                 })
					}
				} 
			}
		}
	}
	</script>
</body>
</html>