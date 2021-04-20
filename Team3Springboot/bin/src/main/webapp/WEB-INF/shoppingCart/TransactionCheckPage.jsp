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
                  <li class="breadcrumb-item"><a href="<c:url value="/" />">首頁</a></li>
                  <li aria-current="page" class="breadcrumb-item active">交易紀錄查詢</li>
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
                  <ul class="nav nav-pills flex-column"><a href="customer-orders.html" class="nav-link active"><i class="fa fa-list"></i> 交易紀錄查詢</a>
                  										<a href="customer-wishlist.html" class="nav-link"><i class="fa fa-heart"></i> 追蹤中</a>
                  										<a href="customer-account.html" class="nav-link"><i class="fa fa-user"></i> 我的帳號</a>
                  										<a href="index.html" class="nav-link"><i class="fa fa-sign-out"></i> 登出</a></ul>
                </div>
              </div>
              <!-- /.col-lg-3-->
              <!-- *** CUSTOMER MENU END ***-->
            </div>
            <div id="customer-orders" class="col-lg-9">
              <div class="box">

	<h2>交易紀錄查詢&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                <hr>
                <div class="table-responsive">
                
                <c:choose>
					<c:when test="${ sessionScope.logOverview == null || sessionScope.logOverview.size() == 0 }">
						<h1>當前使用者無交易資料!</h1>
					</c:when>
					
		<c:otherwise>

	
	<div>商品名稱 : <input type="text" id="productName" value=></div>
	<br>
	<label for="date">選擇期間 :</label>
	<select name="date" id="DATE">
		<option value= 1>一個月</option>
		<option value= 3>三個月</option>
		<option value= 6>六個月</option>
		<option value= 12>一年</option>
	</select> 
	<br><br>
	<button type="button" class="btn btn-primary btn-sm" onclick="aaasssddd()">查詢</button>
	<br><br>
	<br><br>
		
	<h4>查詢結果 :</h4>
	<div class="table-responsive" id="searchResult">
		<c:forEach var="o" begin="0" end="${ sessionScope.logOverview.size() - 1 }">
			<c:set var="list" value="${ sessionScope.logOverview.get(o).itemList }"/>
			<br>
			<span>
				訂單編號 : ${ sessionScope.logOverview.get(o).orderID }<br>
				交易時間 : ${ sessionScope.logOverview.get(o).datetime }<br>
				總金額 : ${ sessionScope.logOverview.get(o).totalAmount }
			</span>

			<c:forEach var="i" begin="0" end="${ list.size() - 1 }">
				<c:choose>
					<c:when test="${ i == 0 }">
						<form action="/Team03ShoppingSite/shoppingCart/transactionBack/gotoDesc" method="post">
						<input type="hidden" name="orderID" value=${ sessionScope.logOverview.get(o).orderID }>
						<input type="hidden" name="sellerID" value=${ list.get(i).sellerID }>
						<input type="hidden" name="productID" value=${ list.get(i).product.productId }>
						<table class="table table-hover">
						<tr>
							<td width='50px'><strong>賣家</strong></td>
							<td width='300px'><strong>商品名稱</strong></td>
							<td width='50px'><strong>數量</strong></td>
							<td width='75px'><strong>價格</strong></td>
							<td width='150px'><strong>狀態</strong></td>
							<td width='44px'></td>
						</tr>
						<tr>
							<td width='50px'>${ list.get(i).sellerID }</td>
							<td width='300px'>${ list.get(i).product.productName }</td>
							<td width='50px'>${ list.get(i).quantity }</td>
							<td width='75px'>${ list.get(i).price }</td>
							<td width='150px'><strong>${ list.get(i).order_status.status }/${ list.get(i).shipping_status.status }</strong></td>
							<td width='44px'><input type="submit" class="btn btn-primary btn-sm" value="確認"></td>
						</tr>
					</c:when>
					<c:when test="${ i > 0 && list.get(i).sellerID == list.get(i - 1).sellerID }">
						<tr>
							<td width='50px'>${ list.get(i).sellerID }</td>
							<td width='300px'>${ list.get(i).product.productName }</td>
							<td width='50px'>${ list.get(i).quantity }</td>
							<td width='75px'>${ list.get(i).price }</td>
							<td width='150px'><strong>${ list.get(i).order_status.status }/${ list.get(i).shipping_status.status }</strong></td>
							<td width='44px'><input type="submit" class="btn btn-primary btn-sm" value="確認"></td>
						</tr>
					</c:when>	
					<c:when test="${ i > 0 && list.get(i).sellerID != list.get(i - 1).sellerID }">
						</table>
						</form>
						<form action="/Team03ShoppingSite/shoppingCart/transactionBack/gotoDesc" method="post">
						<input type="hidden" name="orderID" value=${ sessionScope.logOverview.get(o).orderID }>
						<input type="hidden" name="sellerID" value=${ list.get(i).sellerID }>
						<input type="hidden" name="productID" value=${ list.get(i).product.productId }>
						<table class="table table-hover">
						<tr>
							<td width='50px'><strong>賣家</strong></td>
							<td width='300px'><strong>商品名稱</strong></td>
							<td width='50px'><strong>數量</strong></td>
							<td width='75px'><strong>價格</strong></td>
							<td width='150px'><strong>狀態</strong></td>
							<td width='44px'></td>
						</tr>
						<tr>
							<td width='50px'>${ list.get(i).sellerID }</td>
							<td width='300px'>${ list.get(i).product.productName }</td>
							<td width='50px'>${ list.get(i).quantity }</td>
							<td width='75px'>${ list.get(i).price }</td>
							<td width='150px'><strong>${ list.get(i).order_status.status }/${ list.get(i).shipping_status.status }</strong></td>
							<td width='44px'><input type="submit" class="btn btn-primary btn-sm" value="確認"></td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>

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
		var rt = document.getElementById("searchResult");
		var pName = document.getElementById("productName").value;
		var date = document.getElementById("DATE").value;

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/transactionBack/getLog'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("date="+ date +"&pName="+ pName);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var content = "";
				var array = JSON.parse(xhr.responseText);

				if(array.length != 0){
					for(let order of array){
							content += "<br><span>" +
										"訂單編號 : " + order.orderID + "<br>" +
										"交易時間 : " + order.datetime + "<br>" +
										"總金額 : " + order.totalAmount +
										"</span>";

							let od = order.itemList;
						for(let i = 0 ; i < od.length ; i ++){
							if(i == 0){  
								content += "<form action='/Team03ShoppingSite/shoppingCart/transactionBack/gotoDesc' method='post'>" +
										   "<input type='hidden' name='orderID' value=" + order.orderID + ">" +
									   	   "<input type='hidden' name='sellerID' value=" + od[i].sellerID + ">" +
									   	   "<input type='hidden' name='productID' value=" + od[i].product.productId + ">" +
							  		   	   "<table class='table table-hover'>" +
							  		   	   "<tr>" +
							  		   	   	   "<td width='50px'><strong>賣家</strong></td>" +
		         	 		  	 		       "<th align='center' width='300px'><strong>商品名稱</strong></th>" +
		          			  	  		       "<th align='center' width='50px'><strong>數量</strong></th>" +
		       	  			  	  		       "<th align='center' width='75px'><strong>價格</strong></th>" +
		       	  			  	  		       "<th align='center' width='150px'><strong>狀態</strong></th>" +
		       	  			  	  		       "<th align='center' width='44px'></th>" +
		   	  			  	  		   	   "</tr>" +
		   	  						   	   "<tr>" + 
		   	  						   	   	   "<td width='50px'>" + od[i].sellerID + "</td>" +
									           "<td width='300px'>" + od[i].product.productName + "</td>" +
									           "<td width='50px'>" + od[i].quantity + "</td>" +
									           "<td width='75px'>" + od[i].price + "</td>" +
									           "<th align='center' width='150px'>" + od[i].order_status.status + "/" + od[i].shipping_status.status + "</th>" +
		       	  			  	  		       "<th align='center' width='44px'><input type='submit' class='btn btn-primary btn-sm' value='確認'></th>" +
									   	   "</tr>";
								continue;
							}
							
			   	  			if(i > 0 && od[i].sellerID == od[i - 1].sellerID){
								content += "<tr>" + 
												"<td width='50px'>" + od[i].sellerID + "</td>" +
												"<td width='300px'>" + od[i].product.productName + "</td>" +
							       				"<td width='50px'>" + od[i].quantity + "</td>" +
							       				"<td width='75px'>" + od[i].price + "</td>" +
							       				"<th align='center' width='150px'>" + od[i].order_status.status + "/" + od[i].shipping_status.status + "</th>" +
							       				"<th align='center' width='44px'><input type='submit' class='btn btn-primary btn-sm' value='確認'></th>" +
	               						   "</tr>";
					   	 	}

							if(i > 0 && od[i].sellerID != od[i - 1].sellerID){
								content += "</table>" +
										   "</form>" +
									   	   "<form action='/Team03ShoppingSite/shoppingCart/transactionBack/gotoDesc' method='post'>" +
									   	   "<input type='hidden' name='orderID' value=" + order.orderID + ">" +
									   	   "<input type='hidden' name='sellerID' value=" + od[i].sellerID + ">" +
									   	   "<input type='hidden' name='productID' value=" + od[i].product.productId + ">" +
							  		   	   "<table class='table table-hover'>" +
							  		 	   "<tr>" +
							  		 	   	   "<td width='50px'><strong>賣家</strong></td>" +
	         	 		  	 		   		   "<th align='center' width='300px'><strong>商品名稱</strong></th>" +
	          			  	  		   		   "<th align='center' width='50px'><strong>數量</strong></th>" +
	       	  			  	  		   		   "<th align='center' width='75px'><strong>價格</strong></th>" +
	       	  			  	  		   		   "<th align='center' width='150px'><strong>狀態</strong></th>" +
	       	  			  	  		   		   "<th align='center' width='44px'></th>" +
	   	  			  	  		   		   "</tr>" +
	   	  						   		   "<tr>" + 
	   	  						   			   "<td width='50px'>" + od[i].sellerID + "</td>" +
							       		       "<td width='300px'>" + od[i].product.productName + "</td>" +
								       		   "<td width='50px'>" + od[i].quantity + "</td>" +
								       		   "<td width='75px'>" + od[i].price + "</td>" +
								       		   "<th align='center' width='150px'>" + od[i].order_status.status + "/" + od[i].shipping_status.status + "</th>" +
								       		   "<th align='center' width='44px'><input type='submit' class='btn btn-primary btn-sm' value='確認'></th>" +
								   		   "</tr>";
							}
						}
						content += "</table></form><hr>";
					}
				} else
					content = "查無交易資料!";

				rt.innerHTML = content;
			}

		}
	}	
</script>

  </body>
</html>