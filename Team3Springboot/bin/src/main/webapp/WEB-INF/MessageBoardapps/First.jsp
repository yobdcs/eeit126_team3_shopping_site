<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>新增一個留言</title>

<script>
	<%--
	function btnClear(){
			document.getElementById("inputTitle").value="";
			document.getElementById("inputName").value="";
			document.getElementById("inputContent").value="";
	}

	function btnSR(){
		
		var buildresult = document.getElementById("resp");
		var inputTitleVal=document.getElementById("inputTitle").value;
		var inputNameVal=document.getElementById("inputName").value;
		var inputContentVal = document.getElementById("inputContent").value;
	
		// ajax的同步請求
		// 步驟一: 新建XMLHttpRequest物件
		var xhr = new XMLHttpRequest();
		// 步驟二: 經由AJAX提出HTTP請求
		if (xhr !=null) {
			xhr.open('post',"<c:url value='insertSuccessAjax' />");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xhr.send("title="+inputTitleVal+"&username="+inputNameVal+"&content="+inputContentVal);
			// 步驟三: 處理伺服器送回的回應資料
		} else {
			buildresult.innerHTML = "<h3>您的瀏覽器不支援Ajax</h3>";
		}
			
		xhr.onreadystatechange = function(){
			if(xhr.readyState ==4 &&xhr.status == 200){
				
				buildresult.innerHTML = "<h3>" +xhr.responseText+"</h3>";
			}
		}
	}
	--%>
</script>
</head>
<body >							
		
	<form action="<%=request.getContextPath()%>/MessageBoard/GetAllMsg.controller" method="post">
		<input type="submit" value="查詢全部">
	</form>
	<form action="<%=request.getContextPath()%>/MessageBoard/adminSearchAllAjax.controller" method="post">
		<input type="submit" value="管理者查詢全部">
	</form>
	
</body>
</html>
