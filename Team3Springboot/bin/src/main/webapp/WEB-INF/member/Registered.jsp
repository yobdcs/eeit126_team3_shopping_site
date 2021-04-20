<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
<title>註冊</title>
<<<<<<< HEAD
=======
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
<title>註冊新會員</title>
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot.git
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
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
                  <li class="breadcrumb-item"><a href="<c:url value='/' />">首頁</a></li>
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <li aria-current="page" class="breadcrumb-item active">註冊會員</li>
<<<<<<< HEAD
=======
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <li aria-current="page" class="breadcrumb-item active">註冊新會員</li>
<<<<<<< HEAD
>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot.git
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                </ol>
              </nav>
            </div>
            <div class="col-lg-12">
              <div class="box">
                <h1>註冊新會員</h1>
                <p class="lead">還沒有帳號嗎? 註冊過程只需一分鐘且能為您帶來更多優惠與服務!</p>
                <p class="text-muted">有任何疑問時請<a href="contact.html">聯絡我們</a>，我們會盡速為您服務!</p>
                <hr>
                <!-- <form action="" method="post"> -->
                <div class="row">
                	<div class="col-lg-6">
                		<div class="form-group">
                    		<label for="account">帳號</label>
                    		<input id="account" type="text" class="form-control">
                  		</div>
                  		<div class="form-group">
		                    <label for="password">密碼</label>
		                    <input id="password" type="password" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="chkpassword">密碼確認</label>
		                    <input id="chkpassword" type="password" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="memberName">姓名</label>
		                    <input id="memberName" type="text" class="form-control">
		                </div>
		                <div class="form-group">
		                    <div><label for="gender">性別</label></div>
		                    <input id="gender" type="hidden" class="form-control">
			                <div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="sex" id="male" value="male">
								<label class="form-check-label" for="male">男</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio" name="sex" id="female" value="female">
								<label class="form-check-label" for="female">女</label>
							</div>
		                </div>
		                <div class="form-group">
		                    <label for="memberBirth">生日</label>
		                    <input id="memberBirth" type="text" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="email">Email</label>
		                    <input id="email" type="text" class="form-control">
		                </div>
		                <div class="form-group">
		                    <label for="address">地址</label>
		                    <input id="address" type="text" class="form-control">
		                </div>
		                <div class="text-center">
		                    <button type="button" class="btn btn-primary" id="register"><i class="fa fa-user-md"></i> 註冊</button>
		                </div>
	                </div>
                </div>
                <!-- </form> -->
              </div>
            </div>
            
          </div>
        </div>
      </div>
    </div>

<%@ include file="/template/front/footer.jsp"%>

<script>
window.onload = function(){
	var sex = document.getElementsByName("sex");
	for(let i=0;i<sex.length;i++){
		sex[i].addEventListener("click",sexonclick);
    }
    function sexonclick(){
		console.log(this.value);
		var sexchosen=document.getElementById("gender");
		sexchosen.value=this.value;
    }
	var register = document.getElementById("register");
	register.onclick = function(){
		var account = document.getElementById("account");
		var password = document.getElementById("password");
		var memberName = document.getElementById("memberName");
		var gender = document.getElementById("gender");
		var memberBirth = document.getElementById("memberBirth");
		var email = document.getElementById("email");
		var address = document.getElementById("address");
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/insert' />",true);
		var jsonMember = {
			"account": account.value, 	
			"password": password.value,
			"memberName": memberName.value,
			"gender": gender.value,
			"memberBirth": memberBirth.value,
			"email": email.value,
			"address": address.value
	   	}
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.send(JSON.stringify(jsonMember));

		xhr.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
				var resTex = xhr.responseText;
				if(resTex === "sucess"){
					window.location.href="<c:url value='/' />";
				}
			} 
		}
	}
	
}

</script>

</body>
</html>