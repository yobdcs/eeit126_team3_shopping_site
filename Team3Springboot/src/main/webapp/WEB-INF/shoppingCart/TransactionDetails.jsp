<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>交易詳細</title>
    <%@ include file="/template/front/head.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
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
                  <h3 class="h4 card-title">會員專區</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column">
                  										<a href="<c:url value="/updatepage.controller" />" class="nav-link"><i class="fa fa-user"></i> 會員詳細資料</a>
                  										<a href="<c:url value="/gotochathistory" />" class="nav-link"><i class="fa fa-commenting-o"></i> 聊天紀錄</a>
                  										<a href="<c:url value="/shoppingCart/gotoTransCheckPage" />" class="nav-link active"><i class="fa fa-info-circle"></i> 交易紀錄查詢</a>
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
            <div id="customer-order" class="col-lg-9">
              <div class="box">
              	<p class="lead">賣家資訊</p>
              	<table class="table">
				<tr>
					<th>帳號</th>
					<th>姓名</th>
					<th>電子信箱</th>
				</tr>
				<tr>
					<td>${ requestScope.desc.seller.account }</td>
					<td>${ requestScope.desc.seller.memberName }</td>
					<td>${ requestScope.desc.seller.email }</td>
				</tr>
				</table>
              	<p class="lead">已於「${ requestScope.desc.order.datetime }」完成付款</p>
<!--                 <p> -->
			<c:choose>
				<c:when test="${ requestScope.flag == -1 }">
                	<button id="returnbtn" class="btn btn-outline-secondary" style='font-size: 20px' onclick="returnEntry()">退貨申請</button><br>
				</c:when>
				<c:when test="${ requestScope.flag == 0 }">
					<p class="lead">***已於「${ requestScope.date }」開始退貨流程，處理單號為「${ requestScope.caseID }」***</p>
				</c:when>
				<c:when test="${ requestScope.flag == 1 }">
					<p class="lead">已於「${ requestScope.date }」完成退貨流程，處理單號為「${ requestScope.caseID }」</p>
				</c:when>
			</c:choose>
<!--                 	<br> -->
					<div id="returnApplication" style="display:none">
<!-- 						<br>退貨申請送出後將由系統代為通知賣家，後續流程由管理者端進行 -->
						<br>
						<input type="text" id="returnText" size="75" placeholder="請輸入退貨原因(ex:貨品有瑕疵...等)"/><br><br>
						<button type="button" class="btn btn-primary btn-sm" style='font-size: 20px' onclick="swalbtn()">確認輸入無誤後，點此送出</button>
					</div>
<!--                 </p> -->

<!--                 <p class="text-muted">If you have any questions, please feel free to <a href="contact.html">contact us</a>, our customer service center is working for you 24/7.</p> -->
<!--                 <hr> -->
				<br>
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
                        <td width="425px">${ requestScope.desc.product.productName }</td>
                        <td width="80px">${ requestScope.desc.quantity }</td>
                        <td width="80px">${ requestScope.desc.price }</td>
                        <td width="150px">${ requestScope.desc.payType.payType }</td>
                        <td width="125px">${ requestScope.desc.shippingType.shipType } </td>
                        <td width="250px">${ requestScope.desc.shipping_status.status }</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive-->
                <div class="row addresses">
                  <div class="col-lg-6">
                    <h3><strong>請款地址</strong></h3>
                    <p>	
                    	${ sessionScope.loginBean.address }
                    </p>
                  </div>
                  <div class="col-lg-6">
                    <h3><strong>寄件地址</strong></h3>
                    <p>
                    <c:choose>
                    	<c:when test="${ requestScope.desc.shippingType.shipId != 2 }">
                    		${ sessionScope.loginBean.address }
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<script>
	function returnEntry(){
		var ra = document.getElementById("returnApplication");
		if(ra.style.display == "none")
			ra.style.display = "block";
		else
			ra.style.display = "none";
	}

	function swalbtn(){
		var rtext = document.getElementById("returnText");

		if(rtext.value == ""){
			swal('輸入不得為空', '', 'warning');
			return;
		}
		
		swal({title: '是否送出申請?', text: '送出後系統將通知賣家，後續流程由管理者進行', type: 'question', showCancelButton: true, confirmButtonText: '確定', cancelButtonText: '取消', 
			  confirmButtonClass: 'btn btn-success', cancelButtonClass: 'btn btn-danger', buttonsStyling: true
        	}).then(function(){returnProcess(rtext)}, 
    				function(dismiss) {})
	}

	function returnProcess(rtext){
		var returnDesc = {
			"buyerID" : ${ sessionScope.loginBean.memberId },
			"sellerID" : ${ requestScope.desc.seller.memberId },
			"orderID" : ${ requestScope.desc.order.orderID },
			"productID" : ${ requestScope.desc.product.productId },
			"reason" : rtext.value
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/transactionBack/returnClientSide'/>", true)
		xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
		xhr.send(JSON.stringify(returnDesc));

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				swal('申請完成', '', 'success');
				var rb = document.getElementById("returnbtn");
				document.getElementById("returnApplication").remove();
				rb.onclick = "";
				rb.innerHTML = xhr.responseText;
			}
		}
	}
</script>
  </body>
</html>