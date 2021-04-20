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
                  <li aria-current="page" class="breadcrumb-item"><a href="<c:url value="/shoppingCart/gotoTransOrderCheckPage" />">交易訂單查詢</a></li>
                  <li aria-current="page" class="breadcrumb-item active">訂單詳細</li>
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
            <div id="customer-order" class="col-lg-9">
              <div class="box">
              	<p class="lead">買家資訊</p>
              	<table class="table">
				<tr>
					<th>帳號</th>
					<th>姓名</th>
					<th>電子信箱</th>
				</tr>
				<tr>
					<td>${ requestScope.buyerBean.account }</td>
					<td>${ requestScope.buyerBean.memberName }</td>
					<td>${ requestScope.buyerBean.email }</td>
				</tr>
				</table>
              	<p class="lead">買家已於「${ requestScope.orderDate }」完成付款</p>
<!--                 <p> -->
			<c:choose>
				<c:when test="${ requestScope.flag == 0 }">
							<p class="lead">***買家於「${ requestScope.date }」提出退貨申請，處理單號為「${ requestScope.caseID }」***</p>
					<c:choose>
						<c:when test="${ requestScope.checkText.sellerConfirm != null }">
							賣家已完成確認，訊息為「${ requestScope.checkText.sellerConfirm }」，後續將由管理員完成剩餘流程<br>
						</c:when>
						<c:otherwise>
							<div id="returnApplication">
								<input type="text" id="returnText" size="75" placeholder="請確實與買家確認後，輸入確認訊息"/><br><br>
								<button type="button" class="btn btn-primary btn-sm" style='font-size: 20px' onclick="swalbtn()">確認輸入無誤後，點此送出</button>
							</div>
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:when test="${ requestScope.flag == 1 }">
					<p class="lead">此商品已於「${ requestScope.date }」完成退貨流程，處理單號為「${ requestScope.caseID }」</p>
				</c:when>
			</c:choose>
<!--                 	<br> -->
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
                        <td width="425px">${ requestScope.orderDesc.product.productName }</td>
                        <td width="80px">${ requestScope.orderDesc.quantity }</td>
                        <td width="80px">${ requestScope.orderDesc.price }</td>
                        <td width="150px">${ requestScope.orderDesc.payType.payType }</td>
                        <td width="125px">${ requestScope.orderDesc.shippingType.shipType } </td>
                        <td width="250px">${ requestScope.orderDesc.shipping_status.status }</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <!-- /.table-responsive-->
                <div class="row addresses">
<!--                   <div class="col-lg-6"> -->
<!--                     <h3><strong>請款地址</strong></h3> -->
<!--                     <p>	 -->
<%--                     	${ requestScope.buyerBean.address } --%>
<!--                     </p> -->
<!--                   </div> -->
<!--                   <div class="col-lg-6"> -->
                    <p class="lead">&nbsp;&nbsp;&nbsp;<strong>寄件地址&nbsp;:&nbsp;</strong></p>
                    <p>
                    <c:choose>
                    	<c:when test="${ requestScope.orderDesc.shippingType.shipId != 2 }">
                    		${ requestScope.buyerBean.address }
						</c:when>
						<c:otherwise>
						(買家選擇面交)
						</c:otherwise>
                    </c:choose>
                    </p>
<!--                 </div> -->
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
	function swalbtn(){
		var rtext = document.getElementById("returnText");

		if(rtext.value == ""){
			swal('輸入不得為空', '', 'warning');
			return;
		}
	
		swal({title: '確認送出', text: '提醒您，請確實與買家確認退貨原由', type: 'warning', showCancelButton: true, confirmButtonText: '確定', cancelButtonText: '取消', 
		  	  confirmButtonClass: 'btn btn-success', cancelButtonClass: 'btn btn-danger', buttonsStyling: true
    		}).then(function(){returnProcess(rtext)}, 
					function(dismiss) {})
	}

	function returnProcess(rtext){
		var returnDesc = {
			"caseID" : ${ requestScope.caseID },
			"sellerConfirm" : rtext.value
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/transactionBack/returnSellerSide'/>", true)
		xhr.setRequestHeader("Content-type", "application/json;charset=UTF-8");
		xhr.send(JSON.stringify(returnDesc));

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				swal('確認完成', '後續將由管理員完成剩餘流程', 'success');
				var ra = document.getElementById("returnApplication");
				ra.innerHTML = "<button type='button' class='btn btn-primary btn-sm'>" + xhr.responseText + "</button>";
			}
		}
	}
</script>
  </body>
</html>