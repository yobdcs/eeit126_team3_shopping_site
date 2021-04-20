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
                    <th>商品ID</th>
                    <th>商品名稱</th> 
                    <th>賣家ID</th>                     
                    <th>商品狀態</th>
                    <th>檢舉類型</th>
                    <th>檢舉說明</th>
                    <th class="text-lg-center">商品頁面</th>
                    <th class="text-lg-center">商品處理</th>
                    <th class="text-lg-center">刪除檢舉</th>

                  </tr>
                </thead>
                
                <tbody> 
                <c:if test="${ sessionScope.reportList.size() != 0 }">
                <c:forEach var="i" begin="0" end="${ sessionScope.reportList.size() - 1 }">
                  <tr id="showallMsg">
                    <td>${ sessionScope.reportList.get(i).productId }</td>
                    <td>${ sessionScope.reportList.get(i).productName }</td>
                    <td>${ sessionScope.reportList.get(i).userId }</td>
                    	<c:choose>
                    		<c:when test="${ sessionScope.reportList.get(i).reportVision == 0}">
                    			<td>商品上架</td>
                    		</c:when>
                    		<c:when test="${ sessionScope.reportList.get(i).reportVision == 1}">
                    			<td>賣家端下架</td>
                    		</c:when>
                    		<c:when test="${ sessionScope.reportList.get(i).reportVision == 2}">
                    			<td>管理端下架</td>
                    		</c:when>
                    	</c:choose>
                    <td>${ sessionScope.reportList.get(i).reportType }</td>
                    <td>${ sessionScope.reportList.get(i).reportDescription }</td>
                    <td class="text-lg-center">
                    	<button class="btnupd btn-sm btn-outline-info" 
                    	onclick="location.href='<c:url value='/product/infoProduct/?infoId=${ sessionScope.reportList.get(i).productId }&index=-1&uid=${ sessionScope.reportList.get(i).userId }'/>'">商品頁</button>
                    </td>
                    <td class="text-lg-center">
                    	<button class="btnupd btn-sm btn-outline-info" 
                    			onclick="location.href='<c:url value='/product/editReportVision/?vision=2&id=${sessionScope.reportList.get(i).productId}'/>'">檢舉成功</button>
                   		<button class="btnupd btn-sm btn-outline-info" 
                   				onclick="location.href='<c:url value='/product/editReportVision/?vision=1&id=${sessionScope.reportList.get(i).productId}'/>'">下架</button>
                    	<button class="btnupd btn-sm btn-outline-info" 
                    			onclick="location.href='<c:url value='/product/editReportVision/?vision=0&id=${sessionScope.reportList.get(i).productId}'/>'">上架</button>
                    </td>
                     <td class="text-lg-center">
                    	<button class="btnupd btn-sm btn-outline-info" 
                    	onclick="location.href='<c:url value='/product/deleteReportEvent/?eventId=${ sessionScope.reportList.get(i).eventId }'/>'">刪除</button>
                    </td>
                  </tr>
                </c:forEach>
                </c:if>
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
 </script>
 <script>
 var reportVision = document.getElementsByName("reportVision").value;
 var visionResult = document.getElementById("visionResult");
 window.onload=function(){
	 console.log(reportVision);
		if(reportVision == 0){
			visionResult.innerHTML = "商品上架中";
		}else if (reportVision == 1){
			visionResult.innerHTML = "賣家下架中";
		}else if (reportVision == 2){
			visionResult.innerHTML = "管理員下架";
		}
	}
 </script>

</body>


</html>
