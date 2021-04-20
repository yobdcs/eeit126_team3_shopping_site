<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>退貨處理</title>
  <%@ include file="/template/manager/head.jsp"%>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
</head>
<body>
  <div class="wrapper ">
  <%@ include file="/template/manager/left.jsp"%> 
  	<div class="main-panel" style="height: 100vh;">
  	<%@ include file="/template/manager/navbar.jsp"%> 
   
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
<!--             <h3 class="alert alert-default">Welcome to MsgBoard Admin Page!</h3> -->
            <div class="table-responsive"> 
              <table class="table" id="tbl_result"> 
                <thead class=" text-primary">
                  <tr>
                    <th>處理單號</th>
                    <th width="100px">狀態</th> 
                    <th>訂單編號</th>
                    <th width="500px">商品名稱</th>
                    <th class="text-lg-center">處理時間</th>
                    <th class="text-lg-right"></th>
                  </tr>
                </thead>
                
                <tbody> 
                <c:forEach var="i" begin="0" end="${ sessionScope.orList.size() - 1 }">
                  <tr id="showallMsg">
                    <td>${ sessionScope.orList.get(i).caseID }</td>
                    <c:choose>
                    	<c:when test="${ sessionScope.orList.get(i).status == 0}">
                    		<td>案件進行中</td>
                    	</c:when>
                    	<c:when test="${ sessionScope.orList.get(i).status == 1}">
                    		<td>案件完結</td>
                    	</c:when>
                    </c:choose>
<%--                     <td>${ sessionScope.orList.get(i).status }</td> --%>
                    <td>${ sessionScope.orList.get(i).order.orderID }</td>
                    <td>${ sessionScope.orList.get(i).product.productName }</td>
                    <td class="text-lg-center">${ sessionScope.orList.get(i).datetime }</td>
                    <td class="text-lg-right">
<!--                     	<button class="btndel btn-sm btn-outline-danger" value=${i}>Del<i class="fa fa-trash" aria-hidden="true"></i></button> -->
                    	<button class="btnupd btn-sm btn-outline-info" value=${ i } onclick="btnclick(this)">詳細<i class="fa fa-pencil" aria-hidden="true"></i></button>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
                </table>
            </div>
            
            <div id="ordesc"></div>

      </div>
      </div>
      </div>
      
    </div>
  </div>
  
	<%@ include file="/template/manager/scriptlink.jsp"%> 
  <!-- sweetalert api -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js" type="text/javascript"></script>
  <script src="https://cdn.datatables.net/1.10.24/js/dataTables.bootstrap4.min.js"></script>

  
  <script>
    $(document).ready(function() {
      $('#tbl_result').DataTable({
    	"paging":true,
    	"lengthMenu":[3,6],
      });  
    })
	 
	function btnclick(btn){
    	var xhr = new XMLHttpRequest();
    	xhr.open("POST", "<c:url value='/shoppingCart/TransactionManager/caseDesc'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index=" + btn.value);

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var or = JSON.parse(xhr.responseText);

				var ordesc = document.getElementById("ordesc");
				
				var content = "<br><p>訂單編號 : " + or.order.orderID + "</p>" +
								"<p>商品名稱 : " + or.product.productName + "</p>" +
								"<span>買家ID : " + or.buyerID + "</span><br>" +
								"<span>退貨原由 : " + or.reason + "</span><hr>" +
								"<span>賣家ID : " + or.sellerID + "</span><br>";

				if(or.sellerConfirm == null){
					content += "<span>賣家回覆 : (賣家尚未回覆)</span><hr>" +
								"<button class='btnupd btn-sm btn-outline-info' style='font-size: 20px' >賣家尚未完成確認</button>";
				} else {
					content += "<span>賣家回覆 : " + or.sellerConfirm + "</span><hr>";
					if(or.status == 0)
						content += "<button class='btnupd btn-sm btn-outline-info' style='font-size: 20px' value=" + or.caseID + " onclick='swalbtn(this)'>確認修改</button>";
					else
						content += "<button class='btnupd btn-sm btn-outline-info' style='font-size: 20px' >已於「" + or.datetime + "」完成退貨流程</button>";
				}
								
				ordesc.innerHTML = content;
			}
		}
    }

    function swalbtn(btn){
		swal({title: '是否更新案件狀態?', type: 'question', showCancelButton: true, confirmButtonText: '確定', cancelButtonText: '取消', 
			  confirmButtonClass: 'btn btn-success', cancelButtonClass: 'btn btn-danger', buttonsStyling: true
          	}).then(function(){
        	  			var xhr = new XMLHttpRequest();
          				xhr.open("POST", "<c:url value='/shoppingCart/TransactionManager/caseComplete'/>", true);
      					xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      					xhr.send("caseID=" + btn.value);

      					xhr.onreadystatechange = function() {
      						if (xhr.readyState == 4 && xhr.status == 200)
								swal(xhr.responseText, '使用者端案件狀態會同步更新', 'success').then(function(){window.location.reload()})
      					}}, 
      				function(dismiss) {})
    }
 </script>

</body>


</html>
