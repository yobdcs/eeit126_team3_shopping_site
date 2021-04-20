<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="/template/manager/head.jsp"%>
</head>
<script>
	window.onload = function(){
    
		var loginBt = document.getElementById("login");
		loginBt.onclick = function(){
			var accValue = document.getElementById("account").value;
			var pwValue = document.getElementById("password").value;
			var xhr = new XMLHttpRequest();
			xhr.open("POST","checkAccPw.controller",true);
			xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			xhr.send("account="+ accValue+"&password="+pwValue);

			xhr.onreadystatechange = function() {
				// 伺服器請求完成
				if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
					var resTex = xhr.responseText;
					if(resTex === "sucess"){
						window.location.href="<c:url value='/ShowAll.controller' />";
					}
				} 
			}

		}
    
	}
</script>
<body>
<div class="wrapper ">
<%@ include file=/template/manager/left.jsp"%> 
<div class="main-panel" style="height: 100vh;">
<%@ include file="/template/manager/navbar.jsp"%> 
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            
<div><a href="insertpage.controller">註冊</a></div>
<fieldset>
  <legend>登入</legend>

  <table>
    <tr>
      <td>帳號:</td>
      <td><INPUT TYPE="TEXT" id="account"></td>
    </tr>
    <tr>
      <td>密碼:</td>
      <td><INPUT TYPE="password" id="password"></td>
    </tr>
    <tr>
      <td><button id="login">Login</button></td>
    </tr>
  </table>
</fieldset>

          </div>
        </div>
      </div>
      <%@ include file="/template/manager/footer.jsp"%>
      </div>
      </div>
<%@ include file="/template/manager/scriptlink.jsp"%> 
</body>
</html>