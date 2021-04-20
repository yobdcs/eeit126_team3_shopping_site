<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>會員資訊</title>
<%@ include file="/template/manager/head.jsp"%>
</head>
<body>
<div class="wrapper ">
<%@ include file="/template/manager/left.jsp"%> 
<div class="main-panel" style="height: 100vh;">
<%@ include file="/template/manager/navbar.jsp"%> 
      <div class="content">
        <div class="row">
          <div class="col-md-4">
            <div class="card card-user">
              <div class="card-header">
                <h3 class="card-title">&nbsp</h3>
              </div>
              <div class="card-body">
                <div class="author">
                  <a href="#">
                    <img id="memberPhoto" class="avatar border-gray">
                    <h5 class="title" id="account">Chet Faker</h5>
                  </a>
                </div>
                <div class="row">
                    <div class="col-lg-2 col-md-6 col-6 ml-auto">
                      <h5><small>姓名</small></h5>
                    </div>
                    <div class="col-lg-7 mr-auto">
                      <h5 id="memberName"></h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-2 col-md-6 col-6 ml-auto">
                      <h5><small>性別</small></h5>
                    </div>
                    <div class="col-lg-7 mr-auto">
                      <h5 id="gender"></h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-2 col-md-6 col-6 ml-auto">
                      <h5><small>生日</small></h5>
                    </div>
                    <div class="col-lg-7 mr-auto">
                      <h5 id="memberBirth"></h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-2 col-md-6 col-6 ml-auto">
                      <h5><small>信箱</small></h5>
                    </div>
                    <div class="col-lg-7 mr-auto">
                      <h5 id="email"></h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-2 col-md-6 col-6 ml-auto">
                      <h5><small>地址</small></h5>
                    </div>
                    <div class="col-lg-7 mr-auto">
                      <h5 id="address"></h5>
                    </div>
                  </div>
              </div>
              <div class="card-footer">
                <hr>
                <div class="button-container">
                  
                </div>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      <%@ include file="/template/manager/footer.jsp"%>
      </div>
      </div>
<%@ include file="/template/manager/scriptlink.jsp"%>
<script>
window.onload = function(){
	var pk = ${pk};
	var xhr = new XMLHttpRequest();
	xhr.open("GET","<c:url value='/members/" + pk + "' />",true);
	xhr.send();

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
			var member = JSON.parse(xhr.responseText);
			memberInfo(member);
		}
	}
}

function memberInfo(member){
	var memberPhoto = document.getElementById("memberPhoto");
	var account = document.getElementById("account");
	var memberName = document.getElementById("memberName");
	var gender = document.getElementById("gender");
	var memberBirth = document.getElementById("memberBirth");
	var email = document.getElementById("email");
	var address = document.getElementById("address");
	
	memberPhoto.src = member.memberPhoto;
	account.innerHTML = member.account;
	memberName.innerHTML = "<small>"+member.memberName+"</small>";
	gender.innerHTML = "<small>"+member.gender+"</small>";
	memberBirth.innerHTML = "<small>"+member.memberBirth+"</small>";
	email.innerHTML = "<small>"+member.email+"</small>";
	address.innerHTML = "<small>"+member.address+"</small>";
}
</script>
</body>
</html>