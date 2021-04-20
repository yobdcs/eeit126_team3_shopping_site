<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資料修改</title>
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
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <li aria-current="page" class="breadcrumb-item active">會員中心</li>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <li aria-current="page" class="breadcrumb-item active">我的帳號</li>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                </ol>
              </nav>
            </div>
            <div class="col-lg-3">
              <!--
              *** CUSTOMER MENU ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu">
                <div class="card-header">
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <h3 class="h4 card-title">會員中心</h3>
<<<<<<< HEAD
                  <h3 class="h4 card-title">會員專區</h3>
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                </div>
                <div class="card-body">
<<<<<<< HEAD
                  <ul class="nav nav-pills flex-column"><a href="javascript:" class="nav-link"><i class="fa fa-list"></i>訂單查詢</a><a href="javascript:" class="nav-link active"><i class="fa fa-user"></i> 個人資料</a></ul>
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                  <ul class="nav nav-pills flex-column"><a href="javascript:" class="nav-link"><i class="fa fa-list"></i> 交易紀錄查詢</a>
                  										<a href="javascript:" class="nav-link"><i class="fa fa-heart"></i> 追蹤中</a>
                  										<a href="javascript:" class="nav-link active"><i class="fa fa-user"></i> 我的帳號</a>
                  										<a href="javascript:" class="nav-link"><i class="fa fa-sign-out"></i> 登出</a></ul>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div class="col-lg-9">
              <div class="box">
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
<!--                 <h1>My account</h1> -->
<!--                 <p class="lead">Change your personal details or your password here.</p> -->
<!--                 <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p> -->
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
                <h1>我的帳號</h1>
                <p class="lead">這裡可更改您的個人資訊及密碼</p>
                <p class="text-muted">請注意資訊的正確性，及勿冒用他人資訊，以確保自身權益</p>
<<<<<<< HEAD
=======

>>>>>>> branch 'master' of https://github.com/drermergina/Team3Springboot
<!--                 <h3>Change password</h3> -->
<!--                 <form> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <label for="password_old">Old password</label> -->
<!--                         <input id="password_old" type="password" class="form-control"> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   <div class="row"> -->
<!--                     <div class="col-md-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <label for="password_1">New password</label> -->
<!--                         <input id="password_1" type="password" class="form-control"> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <div class="col-md-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <label for="password_2">Retype new password</label> -->
<!--                         <input id="password_2" type="password" class="form-control"> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                   </div> -->
<!--                   /.row -->
<!--                   <div class="col-md-12 text-center"> -->
<!--                     <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Save new password</button> -->
<!--                   </div> -->
<!--                 </form> -->
                <h1 >個人資料</h1>
                <form>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="memberName">姓名</label>
                        <input id="memberName" type="text" class="form-control">
                      </div>
                    </div>
<!--                     <div class="col-md-6"> -->
<!--                       <div class="form-group"> -->
<!--                         <label for="lastname">Lastname</label> -->
<!--                         <input id="lastname" type="text" class="form-control"> -->
<!--                       </div> -->
<!--                     </div> -->
                  </div>
                  <!-- /.row-->
                  <div class="row">
                    <div class="col-md-6">
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
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="memberBirth">生日</label>
                        <input id="memberBirth" type="text" class="form-control">
                      </div>
                    </div>
                  </div>
                  <!-- /.row-->
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12">
                      <div class="form-group">
                        <label for="address">地址</label>
                        <input id="address" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-12 text-center">
                      <button type="button" class="btn btn-primary" id="updateData"><i class="fa fa-save"></i> 儲存變更</button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<div id="test"></div>
<%@ include file="/template/front/footer.jsp"%>

<script>
var pk = "${sessionScope.loginBean.memberId}";
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

	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/members/" + pk + "' />",true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
			//alert(xhr.responseText);
			var member = JSON.parse(xhr.responseText);
			showMember(member);
			updateMember(member);
		}
	}
}

function showMember(member){
	document.getElementById("memberName").value = member.memberName;
	document.getElementById(member.gender).checked=true;
	document.getElementById("memberBirth").value = member.memberBirth;
	document.getElementById("email").value = member.email;
	document.getElementById("address").value = member.address;
}

function updateMember(member){
	var upbt = document.getElementById("updateData");
	upbt.onclick = function(){
		let memberName = document.getElementById("memberName");
		let gender = document.getElementById("gender");
		let memberBirth = document.getElementById("memberBirth");
		let email = document.getElementById("email");
		let address = document.getElementById("address");

		member.memberName = memberName.value;
		member.gender = gender.value;
		member.memberBirth = memberBirth.value;
		member.email = email.value;
		member.address = address.value;

		var xhr1 = new XMLHttpRequest();
		xhr1.open("PUT","<c:url value='/members/" + pk + "' />",true);
		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr1.send(JSON.stringify(member));

		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
				var resTex = xhr1.responseText;
				if(resTex === "sucess"){
					window.location.reload();
				}
			}
		}
	}
}

</script>  
  
</body>
</html>