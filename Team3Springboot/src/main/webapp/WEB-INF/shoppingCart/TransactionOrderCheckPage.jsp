<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>會員專區</title>
    <%@ include file="/template/front/head.jsp"%>
  </head>
  <body>
    <!-- navbar-->
    <%@ include file="/template/front/header.jsp"%>
    <div id="all">
      <div id="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value="/home" />">首頁</a></li>
                  <li aria-current="page" class="breadcrumb-item active">交易訂單查詢</li>
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
                  										<a href="<c:url value="/updatepage.controller" />" class="nav-link"><i class="fa fa-user"></i> 會員詳細資料</a>
                  										<a href="<c:url value="/gotochathistory" />" class="nav-link"><i class="fa fa-commenting-o"></i> 聊天紀錄</a>
                  										<a href="<c:url value="/shoppingCart/gotoTransCheckPage" />" class="nav-link"><i class="fa fa-info-circle"></i> 交易紀錄查詢</a>
                  										<a href="<c:url value="/shoppingCart/gotoTransOrderCheckPage" />" class="nav-link active"><i class="fa fa-info-circle"></i> 交易訂單查詢</a>
                  										<a href="<c:url value="/product/goAddProduct" />" class="nav-link"><i class="fa fa-caret-square-o-up"></i> 商品上架</a>
                  										<a href="<c:url value="/product/memberListPage" />" class="nav-link"><i class="fa fa-cogs"></i> 商品修改</a>
<!--                   										<a href="javascript:" class="nav-link"><i class="fa fa-heart"></i> 追蹤中</a> -->
<!--                   										<a href="javascript:" class="nav-link"><i class="fa fa-sign-out"></i> 登出</a></ul> -->
					</ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-orders" class="col-lg-9">
              <div class="box">
              
			<h2>交易訂單查詢&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                <hr>
                <div class="table-responsive">
                <c:choose>
					<c:when test="${ sessionScope.orders == null || sessionScope.orders.size() == 0 }">
						<h1>無訂單資料!</h1>
					</c:when>	
				<c:otherwise>
	<div>訂單編號 : <input type="text" id="orderNum" value=></div>
	<br>
	<button type="button" class="btn btn-primary btn-sm" onclick="aaasssddd()">查詢</button>

	<div class="table-responsive" id="searchResult">
		<c:forEach var="o" begin="0" end="${ sessionScope.orderIDs.size() - 1 }">
			<br>
			<span>
				訂單編號 : ${ sessionScope.orderIDs.get(o) }<br>
				交易時間 : ${ sessionScope.datetimes.get(o) }<br>
			</span>
						<form action="/Team03ShoppingSite/shoppingCart/transactionBack/orderDesc" method="post">
							<input type="hidden" name="orderID" value=${ sessionScope.orderIDs.get(o) }>
							<input type="hidden" name="buyerID" value=${ sessionScope.buyerIDs.get(o) }>
							<input type="hidden" name="productID" value=${ sessionScope.orders.get(o).product.productId }>
						<table class="table table-hover">
						<tr>
							<td width='50px'><strong>買家</strong></td>
							<td width='300px'><strong>商品名稱</strong></td>
							<td width='50px'><strong>數量</strong></td>
							<td width='75px'><strong>價格</strong></td>
							<td width='150px'><strong>狀態</strong></td>
							<td width='44px'></td>
						</tr>
						<tr>
							<td width='50px'>${ sessionScope.buyerIDs.get(o) }</td>
							<td width='300px'>${ sessionScope.orders.get(o).product.productName }</td>
							<td width='50px'>${ sessionScope.orders.get(o).quantity }</td>
							<td width='75px'>${ sessionScope.orders.get(o).price }</td>
							<td width='150px'><strong>${ sessionScope.orders.get(o).shipping_status.status }</strong></td>
							<td width='44px'><input type="submit" class="btn btn-primary btn-sm" value="確認"></td>
						</tr>
						</table>
						</form>
						<hr>
		</c:forEach>
	</div>
                 </c:otherwise>
			</c:choose>
                  
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    <%@ include file="/template/front/footer.jsp"%>
    <!-- *** COPYRIGHT END ***-->
    <!-- JavaScript files-->
<script>
   	function aaasssddd(){
		var orderId = document.getElementById("orderNum").value;
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/transactionBack/getOrder'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("orderId="+ orderId);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var order = JSON.parse(xhr.responseText);
				var mid = "${ sessionScope.loginBean.memberId }";
				var sr = document.getElementById("searchResult");
				var content = "";
				
				if(mid != ""){
					for(let od of order.itemList){
						if(od.seller.memberId == mid){
							content += "<br>" + 
										"<span>" +
											"訂單編號 : " + order.orderID + "<br>" +
											"交易時間 : " + order.datetime + "<br>" +
										"</span>" +
										"<form action='/Team03ShoppingSite/shoppingCart/transactionBack/orderDesc' method='post'>" +
										"<input type='hidden' name='orderID' value=" + order.orderID + ">" +
										"<input type='hidden' name='buyerID' value=" + order.buyer.memberId + ">" +
										"<input type='hidden' name='productID' value=" + od.product.productId + ">" +			
										"<table class='table table-hover'>" +
										"<tr>" +
											"<td width='50px'><strong>買家</strong></td>" +
											"<td width='300px'><strong>商品名稱</strong></td>" +
											"<td width='50px'><strong>數量</strong></td>" +
											"<td width='75px'><strong>價格</strong></td>" +
											"<td width='150px'><strong>狀態</strong></td>" +
											"<td width='44px'></td>" +
										"</tr>" +
										"<tr>" +
											"<td width='50px'>" + order.buyer.memberId + "</td>" +											
											"<td width='300px'>" + od.product.productName + "</td>" +
											"<td width='50px'>" + od.quantity + "</td>" +
											"<td width='75px'>" + od.price + "</td>" +
											"<td width='150px'><strong>" + od.shipping_status.status + "</strong></td>" +
											"<td width='44px'><input type='submit' class='btn btn-primary btn-sm' value='確認'></td>" +
										"</tr>" +
										"</table>" +
										"</form>" +
										"<hr>";

						}
					}
					sr.innerHTML = content;
				}
			}
		}
   	}

</script>

  </body>
</html>