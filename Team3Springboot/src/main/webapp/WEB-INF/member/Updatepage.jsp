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
                  <li class="breadcrumb-item"><a href="<c:url value='/home' />">首頁</a></li>

                  <li aria-current="page" class="breadcrumb-item active">會員詳細資料</li>

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


                  <h3 class="h4 card-title">會員專區</h3>

                </div>
                <div class="card-body">

                  

                  <ul class="nav nav-pills flex-column">
                  										<a href="<c:url value="/updatepage.controller" />" class="nav-link active"><i class="fa fa-user"></i> 會員詳細資料</a>
                  										<a href="<c:url value="/gotochathistory" />" class="nav-link"><i class="fa fa-commenting-o"></i> 聊天紀錄</a>
                  										<a href="<c:url value="/shoppingCart/gotoTransCheckPage" />" class="nav-link"><i class="fa fa-info-circle"></i> 交易紀錄查詢</a>
                  										<a href="<c:url value="/shoppingCart/gotoTransOrderCheckPage" />" class="nav-link"><i class="fa fa-info-circle"></i> 交易訂單查詢</a>
                  										<a href="<c:url value="/product/goAddProduct" />" class="nav-link"><i class="fa fa-caret-square-o-up"></i> 商品上架</a>
                  										<a href="<c:url value="/product/memberListPage" />" class="nav-link"><i class="fa fa-cogs"></i> 商品修改</a>
<!--                   										<a href="javascript:" class="nav-link"><i class="fa fa-heart"></i> 追蹤中</a> -->
<!--                   										<a href="javascript:" class="nav-link"><i class="fa fa-sign-out"></i> 登出</a></ul> -->

                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div class="col-lg-9">
              <div class="box">

<!--                 <h1>My account</h1> -->
<!--                 <p class="lead">Change your personal details or your password here.</p> -->
<!--                 <p class="text-muted">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p> -->

                <h1>我的帳號</h1>
                <p class="lead">這裡可更改您的個人資訊及密碼</p>
                <p class="text-muted">請注意資訊的正確性，及勿冒用他人資訊，以確保自身權益</p>

                <h1 id="changepw" style="cursor: pointer;">更改密碼 <i class="fa fa-pencil-square-o"></i></h1>
                <form id="changepwform" style="display:none">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_old">舊密碼</label>
                        <input id="password_old" type="password" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
	                    <br><br><div id="oldPwError"></div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_1">新密碼</label>
                        <input id="password_1" type="password" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="password_2">確認新密碼</label>
                        <input id="password_2" type="password" class="form-control">
                      </div>
                    </div>
                  </div>
                  <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-primary" id="changePwBt"><i class="fa fa-save"></i> 更改密碼</button>
                  </div>
                </form>
                
                <h1 id="edit" style="cursor: pointer;">個人資料 <i class="fa fa-pencil-square-o"></i></h1>
                <form id="memberInfo">
                  <div class="row">
                    <div class="col-md-6">
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
                        <input id="memberBirth" type="date" class="form-control">
                      </div>
		               <div class="form-group">
                        <label for="email">Email</label>
                        <input id="email" type="text" class="form-control">
                      </div>
                      <div class="form-group">
                        <label for="address">地址</label>
                        <input id="address" type="text" class="form-control">
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label for="resetPhoto">相片</label>
                        <img id="memberPhoto" width='100%' style="margin-bottom:10px">
                        <input id="resetPhoto" type="file" class="form-control">
                      </div>
                    </div>
                    
                  </div>
                  <!-- /.row-->

                  <div class="row">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

<script>
var pk = "${sessionScope.loginBean.memberId}";
window.onload = function(){

    var changepw = document.getElementById("changepw");
    changepw.onclick = function(){
	    var changepwform = document.getElementById("changepwform");
	    if(changepwform.style.display=='none'){
	    	changepwform.style.display='';
	    }else{
	    	changepwform.style.display='none';
	    }
    }
    
    var changePwBt = document.getElementById("changePwBt");
    changePwBt.onclick = function(){
    	var password_old = document.getElementById("password_old");
		var xhrpw = new XMLHttpRequest();
		xhrpw.open("POST","<c:url value='/checkOldPw' />",true);
		xhrpw.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhrpw.send("password="+password_old.value);

		xhrpw.onreadystatechange = function() {
			// 伺服器請求完成
			if (xhrpw.readyState == 4 && (xhrpw.status == 200 || xhrpw.status == 201) ) {
				if(xhrpw.responseText === "sucess"){
					var password_1 = document.getElementById("password_1"); 
					var password_2 = document.getElementById("password_2");
					if(password_1.value === password_2.value){
						restPassword(password_1.value);
					}else{
						swal({ title:"密碼更新失敗",
				          	   html:"您輸入的兩個密碼並不相符，請再試一次。",
				          	   type:"error",
				          	   timer:2000,
				             }).catch(function(timeout) { });
						//alert("您輸入的兩個密碼並不相符，請再試一次。")
					}
				}else{
					swal({ title:"密碼更新失敗",
			          	   html:"舊密碼輸入錯誤",
			          	   type:"error",
			          	   timer:2000,
			             }).catch(function(timeout) { });
// 			    	var oldPwError = document.getElementById("oldPwError");
// 			    	oldPwError.innerHTML="密碼輸入錯誤";
				}
				
			} 
		}

	}
    
    var resetPhoto = document.getElementById("resetPhoto");
    resetPhoto.onchange = function(){
		var memberPhoto = document.getElementById("memberPhoto");
		var fr = new FileReader();
		fr.readAsDataURL(resetPhoto.files[0]);
		fr.onload = function (){
			memberPhoto.src = this.result;
	    }
	}
	
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
			editMember(member);
			var edit = document.getElementById("edit");
			showMember(member);
			edit.onclick = function(){
				document.getElementById("memberName").readOnly = false;
				document.getElementById("memberBirth").readOnly = false;
				document.getElementById("email").readOnly = false;
				document.getElementById("address").readOnly = false;
			}
			updateMember(member);
		}
	}
	
	document.getElementById("memberName").ondblclick = inputOnclick;
	document.getElementById("memberBirth").ondblclick = inputOnclick;
	document.getElementById("email").ondblclick = inputOnclick;
	document.getElementById("address").ondblclick = inputOnclick;
}

function restPassword(password_1){
	var xhrCheckSuccess= new XMLHttpRequest();
	xhrCheckSuccess.open("POST","<c:url value='/restPassword' />",true);
	xhrCheckSuccess.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhrCheckSuccess.send("password="+password_1);
	
	xhrCheckSuccess.onreadystatechange = function() {
		if (xhrCheckSuccess.readyState == 4 && (xhrCheckSuccess.status == 200 || xhrCheckSuccess.status == 201) ) {
			//alert(xhrCheckSuccess.responseText);
// 			window.location.reload();
// 			alert("密碼以重設，請重新登入");
			var xhrresetlogout = new XMLHttpRequest();
					xhrresetlogout.open("GET", "<c:url value='/logout.controller' />", true);
					xhrresetlogout.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
					xhrresetlogout.send();

					xhrresetlogout.onreadystatechange = function() {
						// 伺服器請求完成
						if (xhrresetlogout.readyState == 4
								&& (xhrresetlogout.status == 200 || xhrresetlogout.status == 201)) {
							var resTex = xhrresetlogout.responseText;
							if (resTex === "sucess") {
								swal({ title:"密碼更新成功",
						          	   html:"請以新密碼重新登入",
						          	   type:"success",
						             }).then(function(){
					                 	   window.location.reload();
					                    });
							}
						}
					}
		}
	}
}

function showMember(member){
	document.getElementById("memberName").readOnly = true;
	document.getElementById(member.gender);
	document.getElementById("memberBirth").readOnly = true;;
	document.getElementById("email").readOnly = true;;
	document.getElementById("address").readOnly = true;
}

function inputOnclick(){
	this.readOnly = false;
}

function editMember(member){
	document.getElementById("memberName").value = member.memberName;
	document.getElementById(member.gender).checked=true;
	document.getElementById("memberBirth").value = member.memberBirth;
	document.getElementById("email").value = member.email;
	document.getElementById("address").value = member.address;
	if(member.memberPhoto){
		if(member.memberPhoto.slice(0,4) === 'data'){
			document.getElementById("memberPhoto").src = member.memberPhoto;
		}
	}
}

function updateMember(member){
	var upbt = document.getElementById("updateData");
	upbt.onclick = function(){
		let memberName = document.getElementById("memberName");
		let gender = document.getElementById("gender");
		let memberBirth = document.getElementById("memberBirth");
		let email = document.getElementById("email");
		let address = document.getElementById("address");
		let memberPhoto = document.getElementById("memberPhoto");

		member.memberName = memberName.value;
		
		if(gender.value){
			member.gender = gender.value;
		}
		
		member.memberBirth = memberBirth.value;
		member.email = email.value;
		member.address = address.value;
		member.memberPhoto = memberPhoto.src;

		var xhr1 = new XMLHttpRequest();
		xhr1.open("PUT","<c:url value='/members/" + pk + "' />",true);
		xhr1.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr1.send(JSON.stringify(member));

		xhr1.onreadystatechange = function() {
			if (xhr1.readyState == 4 && (xhr1.status == 200 || xhr1.status == 201) ) {
				var resTex = xhr1.responseText;
				console.log(resTex);
				if(resTex === "sucess"){
					swal({ title:"資料更新成功",
			          	   type:"success",
			             }).then(function(){
		                 	   window.location.reload();
		                    });
				}
			}
		}
	}
}

</script>  
  
</body>
</html>