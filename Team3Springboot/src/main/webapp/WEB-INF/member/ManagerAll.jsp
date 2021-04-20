<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manager</title>
<%@ include file="/template/manager/head.jsp"%>
<script>
// 	window.onload = function(){

// 		var xhr = new XMLHttpRequest();
// 		xhr.open("GET","<c:url value='/showAllMember' />",true);
// 		xhr.send();

// 		xhr.onreadystatechange = function() {
// 			if (xhr.readyState == 4 && (xhr.status == 200 || xhr.status == 201) ) {
// 				var members = JSON.parse(xhr.responseText);
// 				showAll(members);
// 				for(var i = 0; i < members.length; i++){
// 					var eid = "edit"+members[i].memberId;
// 					editonClick(eid);
// 					var did = "delete"+members[i].memberId;
// 					deleteClick(did);
// 				}
// 			}
// 		}
		
// 		var imgs = document.getElementsByTagName("img");
// 		for(let i=0;i<imgs.length;i++){
// 			console.log(imgs[i]);
// 		}
// 	}

// 	function showAll(members){
// 		var test = document.getElementById("test");
// 		var stringtest = "";
		
// 		stringtest += "<table class='table' id='mamberall'>";
// 		stringtest += "<thead class=' text-primary'><th></th><th>帳號</th><th>姓名</th>";
// 		stringtest += "<th>性別</th><th>生日</th><th>信箱</th><th>地址</th><th></th></thead>";

// 		for(var i = 0; i < 1; i++){
// 			if(members[i].memberPhoto){
// 				stringtest += "<tr><td><img width='100px' src='"+members[i].memberPhoto+"'></td>";
// 			}else{
// 				stringtest += "<tr><td style='text-align: center;' width='100px'><i class='nc-icon nc-circle-10' style='font-size: 34px;'/></td>";
// 			}
// 			stringtest += "<td><a href='<c:url value='/manager/memberInfo/"+members[i].memberId+"' />'>"+members[i].account+"</a></td>";
// 			stringtest += "<td>"+members[i].memberName+"</td>";
// 			stringtest += "<td>"+members[i].gender+"</td>";
// 			stringtest += "<td>"+members[i].memberBirth+"</td>";
// 			stringtest += "<td>"+members[i].email+"</td>";
// 			stringtest += "<td>"+members[i].address+"</td>";
// 			stringtest += "<td style='display:none'><button id=edit"+members[i].memberId+" class='btn btn-primary btn-link'>詳細資料</button></td>";
// 			stringtest += "<td style='display:none'><button id=delete"+members[i].memberId+" class='btn btn-primary btn-link'>刪除</button></td></tr>";
// 		}
		
// 		stringtest += "</table>";
// 		test.innerHTML = stringtest;
// 	}

// 	function editonClick(eid){
// 		var bt = document.getElementById(eid);
// 		bt.onclick = function(){
// 			//console.log(this.id.substr(4));
// 			window.location.href="<c:url value='/manager/memberInfo/' />" + this.id.substr(4);
// 		}
// 	}

// 	function deleteClick(did){
// 		var bt = document.getElementById(did);
// 		bt.onclick = function(){
// 			//console.log(this.id.substr(6));
// 			var xhr2 = new XMLHttpRequest();
// 			xhr2.open("Delete","<c:url value='/members/" + this.id.substr(6) + "' />",true);
// 			xhr2.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
// 			xhr2.send();

// 			xhr2.onreadystatechange = function() {
// 				if (xhr2.readyState == 4 && (xhr2.status == 200 || xhr2.status == 201) ) {
// 					var resTex = xhr2.responseText;
// 					if(resTex === "sucess"){
// 						window.location.reload();
// 					}
// 				}
// 			}
// 		}
// 	}
</script>

</head>

<body>

<div class="wrapper ">
<%@ include file="/template/manager/left.jsp"%> 
<div class="main-panel" style="height: 100vh;">
<%@ include file="/template/manager/navbar.jsp"%> 
      <div class="content">
        <div class="row">
          <div class="col-md-12">
          	<div class="card">
          		<div class="card-header">
<!--                 	<h4 class="card-title"> AllMember</h4> -->
<%-- 					<p>user:${account }<a href='logout.controller'>登出</a></p> --%>
              	</div>
              	<div class="card-body">
              		<div id="test"></div>
              		<table id="showproduct" class='table'></table>
              	</div>
          	</div>
          </div>
        </div>
      </div>
<%--       <%@ include file="/template/manager/footer.jsp"%> --%>
      </div>
      </div>
<%@ include file="/template/manager/scriptlink.jsp"%> 


<script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>
  <script>
  
  $(document).ready(function() {
	  var a = load();
	  //console.log(a);
// 	    $('#example').DataTable( {
// 	        "processing": true,
// 	        "serverSide": true,
// 	    } );
// 	    datatable();
	    
	} );
  
  function load(){
	  $.ajax({
	    type:'get',
	    url:'/Team03ShoppingSite/showAllMember',
	    dataType:'JSON',
	    contentType:'application/json',
	    success: function(data) {
	      var json = JSON.stringify(data, null, 4);
	      //console.log("SUCCESS : ", json);
	      var parsedObjinArray = JSON.parse(json);
	      //console.log(typeof parsedObjinArray)
	      $('#showproduct').empty(""); //清空table內的資料
	        if(json=null){
	           $('table').prepend("<tr><td colspan='2'>暫無資料</td></tr>");
	        }else{
 	           var table = $('#showproduct');
// 	           $(table).DataTable({
// 	        	      destroy: true, //每一次修改時銷毀資料序
// 	        	      stateSave: false, //表格狀態保存，當頁面刷新時，是否要保存當前表格狀態，不保存狀態便會在刷新時回復到原始狀態
// 	        	      autoWidth: false, //是否要自動調整表格寬度
// 	        	      data: json.lsit_data,
// 	        	      columns: json.list_columns,
// 	        	    });
	           table.append("<thead class='text-primary'><tr id='ptitle'><th></th><th>帳號</th><th>姓名</th><th>性別</th><th>生日</th><th>信箱</th><th>地址</th></tr><thead><tbody>");
	           $.each(parsedObjinArray,function(i,n){
	           var tr = "<tr>";
	           if(n.memberPhoto){
	        	   tr += "<td width='50px'><img src='"+n.memberPhoto+"'></td>";
	           }else{
	        	   tr += "<td style='text-align: center;' width='50px'><i class='nc-icon nc-circle-10' style='font-size: 34px;'/></td>";
	           }
	           tr +=    "<td><a href='javascript:' class='dropdown-toggle' id='dropdownMenu"+n.memberId+"' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"+n.account+"</a>"+
	           			"<div class='dropdown-menu' style='background-color:#E0E0E0;z-index:1030' aria-labelledby='dropdownMenu"+n.memberId+"'><table class='table'>"+
	           			"<tr><td rowspan='6' width='300px'><img src='"+n.memberPhoto+"'></td><td>帳號</td><td>"+n.account+"</td></tr>"+
	                    "<tr><td>姓名</td><td>"+n.memberName+"</td></tr><tr><td>性別</td><td>"+n.gender+"</td></tr>"+
	                    "<tr><td>生日</td><td>"+n.memberBirth+"</td></tr><tr><td>信箱</td><td>"+n.email+"</td></tr>"+
	                    "<tr><td>地址</td><td>"+n.address+"</td></tr></table></div></td>" +
	           			"<td>" + n.memberName + "</td>" +
	                    "<td>" + n.gender + "</td>" + "<td>" + n.memberBirth + "</td>" +
	                    "<td>" + n.email + "</td>" + "<td>" + n.address + "</td>" +
// 	                    "<td>" + n.authority + "</td>" +
	                    "</tr>";
	           //console.log(tr);
	           table.append(tr);
	           });
	           table.append("</tbody>");
	           datatable(parsedObjinArray);
	        }
	     },
	     error: function() {
	        console.log("error");
	     }
	   });
	 }
  
  function datatable(parsedObjinArray){
//	  console.log(parsedObjinArray);
//	  $('#showproduct').DataTable().rows.add(parsedObjinArray).draw();
	  $('#showproduct').DataTable( {
// 		    "paging":true,
 	    	"lengthMenu":[6,12],
	    } );
  }
  
  </script>
</body>

</html>