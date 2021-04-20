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
                  <li aria-current="page" class="breadcrumb-item active">交易預覽</li>
                </ol>
              </nav>
            </div>
            <div id="checkout" class="col-lg-9">
              
              <div class="box">
                  <h2>交易預覽</h2>
                  <div class="content">
                    <div class="table-responsive">
                    
                    <c:forEach var="i" begin="0" end="${ sessionScope.newOrder.itemList.size() - 1 }">
                    	<c:choose>
							<c:when test="${ i == 0 }">	
                      <table class="table">
                        <thead>
                          <tr>
                            <th width="225px" colspan="2">商品</th>
                            <th align="center" width='50px'>賣家</th>
                            <th align="center" width='50px'>數量</th>
                            <th align="center" width='75px'>金額</th>
                            <th align="center" width="120px">付款方式</th>
                            <th align="center" width="80px">運送方式</th>
                          </tr>
                        </thead>
                          <tr>
                            <td width="75px">(照片)</td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).sellerID }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td align="center" width="80px">
								<select name="shipping" class="SHIPPING">
								<c:forEach var="s" begin="0" end="${ sessionScope.newOrder.itemList.get(i).sList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipId }>
									${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipType }
									</option>
								</c:forEach>
								</select>
							</td>
                          </tr>
					</c:when>
					
					<c:when test="${ i > 0 && newOrder.itemList.get(i).sellerID == newOrder.itemList.get(i - 1).sellerID }">
                          <tr>
                            <td width="75px">(照片)</td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).sellerID }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td align="center" width="80px">
								<select name="shipping" class="SHIPPING">
								<c:forEach var="s" begin="0" end="${ sessionScope.newOrder.itemList.get(i).sList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipId }>
									${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipType }
									</option>
								</c:forEach>
								</select>
							</td>
                          </tr>
					</c:when>
					<c:when test="${ i > 0 && newOrder.itemList.get(i).sellerID != newOrder.itemList.get(i - 1).sellerID }">
						</table>
                      <table class="table">
                        <thead>
                          <tr>
                            <th width="225px" colspan="2">商品</th>
                            <th align="center" width='50px'>賣家</th>
                            <th align="center" width='50px'>數量</th>
                            <th align="center" width='75px'>金額</th>
                            <th align="center" width="120px">付款方式</th>
                            <th align="center" width="80px">運送方式</th>
                          </tr>
                        </thead>
                          <tr>
                            <td width="75px">(照片)</td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).sellerID }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td align="center" width="80px">
								<select name="shipping" class="SHIPPING">
								<c:forEach var="s" begin="0" end="${ sessionScope.newOrder.itemList.get(i).sList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipId }>
									${ sessionScope.newOrder.itemList.get(i).sList.get(s).shipType }
									</option>
								</c:forEach>
								</select>
							</td>
                          </tr>
					    </c:when>
            		  </c:choose>          
 					</c:forEach>                       
                  </table>
  
                	</div>
                    <!-- /.table-responsive-->
                </div>
                  <!-- /.content-->
                  <div class="box-footer d-flex justify-content-between">
                  		<span id="tsDiscard">
                  			<form action="/Team03ShoppingSite/shoppingCart/transactionBack/overview" method="get">
                  			<button type="submit" class="btn btn-primary"><i class="fa fa-chevron-left"></i> 交易取消</button>
                  			</form>
                  		</span>
                  		<span id="typeSelect"><button class="btn btn-outline-secondary" onclick="setup()">請選擇付款方式、運送方式</button></span>
                    	<span id="tsCommit"></span>
                  </div>

              </div>
              <!-- /.box-->
            </div>
            <!-- /.col-lg-9-->
            <div class="col-lg-3">
              <div id="order-summary" class="card">
                <div class="card-header">
                  <h3 class="mt-4 mb-4">Order summary</h3>
                </div>
                <div class="card-body">
                  <p class="text-muted">Shipping and additional costs are calculated based on the values you have entered.</p>
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                        <tr>
                          <td>Order subtotal</td>
                          <th>$446.00</th>
                        </tr>
                        <tr>
                          <td>Shipping and handling</td>
                          <th>$10.00</th>
                        </tr>
                        <tr>
                          <td>Tax</td>
                          <th>$0.00</th>
                        </tr>
                        <tr class="total">
                          <td>總金額</td>
                          <th>$${ sessionScope.totalAmount }</th>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.col-lg-3-->
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
    <%@ include file="/template/front/footer.jsp"%>
<script>
	function setup() {
		var p = document.getElementsByClassName("PAY");
		var s = document.getElementsByClassName("SHIPPING");

		var payTypeArray = [];
		for(let pp of p)
			payTypeArray.push(pp.value);

		var shipTypeArray = [];
		for(let ss of s)
			shipTypeArray.push(ss.value);

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='AddType'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("pArray="+ payTypeArray +"&sArray="+ shipTypeArray);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var tSelect = document.getElementById("typeSelect");
				var tsc = document.getElementById("tsCommit");
				var tsd = document.getElementById("tsDiscard");

				tSelect.innerHTML = "<button class='btn btn-outline-secondary'>選擇完成!</button>";
				tsc.innerHTML = "<form action='/Team03ShoppingSite/shoppingCart/transactionBack/commit' method='get'>" +
							    "<button type='submit' class='btn btn-primary'>交易成立 <i class='fa fa-chevron-right'></i></button>" +
							    "</form>";
				tsd.innerHTML = "<form action='/Team03ShoppingSite/shoppingCart/transactionBack/overview' method='get'>" +
								"<button type='submit' class='btn btn-primary'><i class='fa fa-chevron-left'></i> 交易取消</button>" +
								"</form>";
			}
		}
	}
</script>
   
  </body>
</html>