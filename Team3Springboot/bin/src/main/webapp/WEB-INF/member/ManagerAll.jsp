<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager</title>
<%@ include file="/template/manager/head.jsp"%>
<script>
	window.onload = function(){

		var xhr = new XMLHttpRequest();
		xhr.open("GET","<c:url value='/showAllMember' />",true);
		xhr.send();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
				var members = JSON.parse(xhr.responseText);
				showAll(members);
				for(var i = 0; i < members.length; i++){
					var eid = "edit"+members[i].memberId;
					editonClick(eid);
					var did = "delete"+members[i].memberId;
					deleteClick(did);
				}
			}
		}
	}

	function showAll(members){
		var test = document.getElementById("test");
		var stringtest = "";
		
		stringtest += "<table class='table'>";
		stringtest += "<thead class=' text-primary'><th>ACCOUNT</th><th>PASSWORD</th><th>MEMBER_NAME</th>";
		stringtest += "<th>GENDER</th><th>MEMBER_BIRTH</th><th>EMAIL</th><th>ADDR</th><th></th></thead>";

		for(var i = 0; i < members.length; i++){
			stringtest += "<tr><td>"+members[i].account+"</td>";
			stringtest += "<td>"+members[i].password+"</td>";
			stringtest += "<td>"+members[i].memberName+"</td>";
			stringtest += "<td>"+members[i].gender+"</td>";
			stringtest += "<td>"+members[i].memberBirth+"</td>";
			stringtest += "<td>"+members[i].email+"</td>";
			stringtest += "<td>"+members[i].address+"</td>";
			//stringtest += "<td><button id=edit"+members[i].memberId+" class='btn btn-primary btn-link'>編輯</button></td>";
			//stringtest += "<td><button id=delete"+members[i].memberId+" class='btn btn-primary btn-link'>刪除</button></td></tr>";
		}
		
		stringtest += "</table>";
		test.innerHTML = stringtest;
	}

	function editonClick(eid){
		var bt = document.getElementById(eid);
		bt.onclick = function(){
			//console.log(this.id.substr(4));
			window.location.href="<c:url value='/updatepage.controller/' />" + this.id.substr(4);
		}
	}

	function deleteClick(did){
		var bt = document.getElementById(did);
		bt.onclick = function(){
			//console.log(this.id.substr(6));
			var xhr2 = new XMLHttpRequest();
			xhr2.open("Delete","<c:url value='/members/" + this.id.substr(6) + "' />",true);
			xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
			xhr2.send();

			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
					var resTex = xhr2.responseText;
					if(resTex === "sucess"){
						window.location.reload();
					}
				}
			}
		}
	}
</script>

</head>

<body>

<div class="wrapper ">
<%@ include file="/template/manager/left.jsp"%> 
<div class="main-panel">
<%@ include file="/template/manager/navbar.jsp"%> 
      <div class="content">
        <div class="row">
          <div class="col-md-12">
          	<div class="card">
          		<div class="card-header">
                	<h4 class="card-title"> AllMember</h4>
<%-- 					<p>user:${account }<a href='logout.controller'>登出</a></p> --%>
              	</div>
              	<div class="card-body">
              		<div id="test"></div>
              	</div>
          	</div>
          </div>
        </div>
      </div>
      <%@ include file="/template/manager/footer.jsp"%>
      </div>
      </div>
<%@ include file="/template/manager/scriptlink.jsp"%> 

</body>
</html>