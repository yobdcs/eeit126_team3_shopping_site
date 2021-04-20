<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Obaju : e-commerce template</title>
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
                  <li class="breadcrumb-item"><a href="<c:url value="/" />">首頁</a></li>
                  <li aria-current="page" class="breadcrumb-item"><a href="<c:url value="/shoppingCart/gotoTransCheckPage" />">交易紀錄查詢</a></li>
                  <li aria-current="page" class="breadcrumb-item active">詳細</li>
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
                  <h3 class="h4 card-title">Customer section</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column"><a href="customer-orders.html" class="nav-link active"><i class="fa fa-list"></i> My orders</a><a href="customer-wishlist.html" class="nav-link"><i class="fa fa-heart"></i> My wishlist</a><a href="customer-account.html" class="nav-link"><i class="fa fa-user"></i> My account</a><a href="index.html" class="nav-link"><i class="fa fa-sign-out"></i> Logout</a></ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-order" class="col-lg-9">
              <div class="box">
              	<p class="lead">賣家資訊</p>
              	<table class="table">
				<tr>
					<th>姓名</th>
					<th>電話</th>
					<th>電子信箱</th>
				</tr>
				<tr>
					<td>${ sessionScope.desc.sellerID }</td>
					<td>(dao)</td>
					<td>(dao)</td>
				</tr>
				</table>
              	<p class="lead">
                <c:choose>
                	<c:when test="${ sessionScope.desc.order_status.statusID == 0 }">
	                	<button class="btn btn-outline-secondary">通知已付款</button>
                	</c:when>
                	<c:when test="${ sessionScope.desc.order_status.statusID == 1 }">
                		<button class="btn btn-outline-secondary">已於20xx/03/xx完成付款</button>
                	</c:when>
                </c:choose>
                </p>
<!--                 <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p> -->
                <hr>
                <div class="table-responsive mb-4">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>名稱</th>
                        <th>數量</th>
                        <th>金額</th>
                        <th>付款方式</th>
                        <th>寄送方式</th>
                        <th>狀態</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td width="425px">${ sessionScope.desc.product.productName }</td>
                        <td width="80px">${ sessionScope.desc.quantity }</td>
                        <td width="80px">${ sessionScope.desc.price }</td>
                        <td width="150px">${ sessionScope.desc.payType.payType }</td>
                        <td width="125px"> ${ sessionScope.desc.shippingType.shipType } </td>
                        <td width="250px">${ sessionScope.desc.order_status.status }/${ sessionScope.desc.shipping_status.status }</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive-->
                <div class="row addresses">
                  <div class="col-lg-6">
                    <h3><strong>請款地址</strong></h3>
<%--                     <p>(買家 : ${ sessionScope.buyerID })<br> --%>
                    <p>	
                    	13/25 New Avenue<br>
                    	New Heaven<br>
                    	45Y 73J<br>
                    	England<br>
                    	Great Britain
                    </p>
                  </div>
                  <div class="col-lg-6">
                    <h3><strong>寄件地址</strong></h3>
<%--                     <p>(買家 : ${ sessionScope.buyerID })<br> --%>
                    <p>
                    <c:choose>
                    	<c:when test="${ sessionScope.desc.shippingType.shipId != 2 }">
                    	13/25 New Avenue<br>
                    	New Heaven<br>
                    	45Y 73J<br>
                    	England<br>
                    	Great Britain
						</c:when>
						<c:otherwise>
						(您選擇面交，當然就沒有地址)
						</c:otherwise>
                    </c:choose>
                    </p>
                  </div>
                  
                  
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
  </body>
</html>