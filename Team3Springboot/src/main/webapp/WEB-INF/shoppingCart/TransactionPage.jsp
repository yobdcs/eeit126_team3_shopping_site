<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="TransExpired.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>交易預覽</title>
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
                            <td width="75px">
                            	<img src="/Team03ShoppingSite/image/${ sessionScope.newOrder.itemList.get(i).seller.memberId }${ sessionScope.newOrder.itemList.get(i).product.productName }.jpg" width="50px" height="50px"/>
                            </td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).seller.memberId }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td class="showpay" align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td class="showship" align="center" width="80px">
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
					
					<c:when test="${ i > 0 && newOrder.itemList.get(i).seller.memberId == newOrder.itemList.get(i - 1).seller.memberId }">
                          <tr>
                            <td width="75px">
								<img src="/Team03ShoppingSite/image/${ sessionScope.newOrder.itemList.get(i).seller.memberId }${ sessionScope.newOrder.itemList.get(i).product.productName }.jpg" width="50px" height="50px"/>
							</td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).seller.memberId }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td class="showpay" align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td class="showship" align="center" width="80px">
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
					<c:when test="${ i > 0 && newOrder.itemList.get(i).seller.memberId != newOrder.itemList.get(i - 1).seller.memberId }">
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
                            <td width="75px">
								<img src="/Team03ShoppingSite/image/${ sessionScope.newOrder.itemList.get(i).seller.memberId }${ sessionScope.newOrder.itemList.get(i).product.productName }.jpg" width="50px" height="50px"/>
							</td>
                            <td width='150px'>${ sessionScope.newOrder.itemList.get(i).product.productName }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).seller.memberId }</td>
                            <td align="center" width='50px'>${ sessionScope.newOrder.itemList.get(i).quantity }</td>
                            <td width='75px'>${ sessionScope.newOrder.itemList.get(i).price }</td>  
                    		<td class="showpay" align="center" width="120px">
								<select name="pay" class="PAY">
								<c:forEach var="p" begin="0" end="${ sessionScope.newOrder.itemList.get(i).pList.size() - 1 }">
									<option value=${ sessionScope.newOrder.itemList.get(i).pList.get(p).payId }>
									${ sessionScope.newOrder.itemList.get(i).pList.get(p).payType }
									</option>
								</c:forEach>
								</select>
							</td>
							<td class="showship" align="center" width="80px">
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
                  <h3 class="mt-4 mb-4">金額結算</h3>
                </div>
                <div class="card-body">
                  <p class="text-muted">運費會依您的選擇改變</p>
                  <div class="table-responsive">
                    <table class="table">
                      <tbody>
                        <tr>
                          <td>總價</td>
                          <th>$${ sessionScope.totalAmount }</th>
                        </tr>
                        <tr>
                          <td>運費</td>
                          <th id="shippingF">$0</th>
                        </tr>
<!--                         <tr> -->
<!--                           <td>稅金</td> -->
<!--                           <th>$${ sessionScope.totalAmount * 0.08 }</th> -->
<!--                         </tr> -->
                        <tr class="total">
                          <td>總金額</td>
                          <th id="totalA">$${ sessionScope.totalAmount }</th>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
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
				swal('選擇完成', '請繼續前往付款畫面', 'success');
				var i = Number(xhr.responseText) + Number(${ sessionScope.totalAmount });
				
				var sh = document.getElementById("shippingF");
				var ta = document.getElementById("totalA");
				var tSelect = document.getElementById("typeSelect");
				var tsc = document.getElementById("tsCommit");
				var tsd = document.getElementById("tsDiscard");

				sh.innerHTML = "$" + xhr.responseText;
				ta.innerHTML = "$" + i;
				tSelect.innerHTML = "<button class='btn btn-outline-secondary'>選擇完成!</button>";
				tsc.innerHTML = "<form action='/Team03ShoppingSite/shoppingCart/transactionBack/commit' method='get'>" +
							    "<button type='submit' class='btn btn-primary'>前往付款畫面 <i class='fa fa-chevron-right'></i></button>" +
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