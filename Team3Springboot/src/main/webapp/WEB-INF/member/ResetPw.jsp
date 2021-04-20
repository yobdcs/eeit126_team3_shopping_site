<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設密碼</title>
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
<!-- 						<nav aria-label="breadcrumb"> -->
<!-- 							<ol class="breadcrumb"> -->
<%-- 								<li class="breadcrumb-item"><a href="<c:url value='/' />">Home</a></li> --%>
<!-- 								<li aria-current="page" class="breadcrumb-item active">重設密碼</li> -->
<!-- 							</ol> -->
<!-- 						</nav> -->
						<div id="error-page" class="row">
							<div class="col-md-6 mx-auto">
								<div class="box text-center py-5">
									<h3 id="h31">請輸入新密碼</h3>
									<form>
										<div class="col-md-9 mx-auto">
											<div class="form-group">
	                        					<input id="newPassword" type="password" class="form-control">
	                      					</div>
	                      				</div>
									</form>
									<h3>請再次輸入密碼</h3>
										<div class="col-md-9 mx-auto my-0">
											<div class="form-group">
	                        					<input id="newPassword2" type="password" class="form-control">
	                      					</div>
	                      				</div>
	                      				<p id="ptext" class="text-muted"></p>
									<button type="button" class="btn btn-primary" id="resetPw"><i class="fa fa-save"></i> 確認</button>
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
	var pk = ${pk};
	window.onload = function(){
		var checkCode = document.getElementById("resetPw");
		resetPw.onclick = function(){
			var newPassword = document.getElementById("newPassword");
			var newPassword2 = document.getElementById("newPassword2");
			var ptext = document.getElementById("ptext");
			//console.log("newPassword"+newPassword.value)
			//console.log("newPassword2"+newPassword2.value)
			if((newPassword.value) && (newPassword2.value)){
				if(newPassword.value === newPassword2.value){
					ptext.innerHTML = "";
					var xhrrspw = new XMLHttpRequest();
					xhrrspw.open("POST","<c:url value='/resetPw/" + pk + "' />",true);
					xhrrspw.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					xhrrspw.send("newPassword="+newPassword.value);

					xhrrspw.onreadystatechange = function() {
						// 伺服器請求完成
						if (xhrrspw.readyState == 4 && (xhrrspw.status == 200 || xhrrspw.status == 201) ) {
							console.log(xhrrspw.responseText);
							if(xhrrspw.responseText === "sucess"){
								swal({ title:"密碼重設成功",
					              	   html:"將導回首頁",
					              	   type:"success",
					                 }).then(function(){
										window.location.replace("/Team03ShoppingSite");
					                 })
							}else{
						    	
							}
							
						} 
					}
				}else{
					swal({ title:"密碼重設失敗",
	                 	   html:"請輸入相同密碼",
	                 	   type:"error",
	                 	   timer:2000,
	                    }).catch(function(timeout) { });
				}
			}else{
				swal({ title:"密碼重設失敗",
              	   html:"欄位不得為空",
              	   type:"error",
              	   timer:2000,
                 }).catch(function(timeout) { });
			}
		}
	}
	</script>
</body>
</html>