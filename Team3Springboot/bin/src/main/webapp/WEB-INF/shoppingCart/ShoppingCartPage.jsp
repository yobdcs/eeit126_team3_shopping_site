<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>購物車</title>
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
                  <li aria-current="page" class="breadcrumb-item active">購物車</li>
                </ol>
              </nav>
            </div>
            <div id="basket" class="col-lg-9">
              <div class="box">
                <h2>購物車商品</h2>
                <div id="allcartitems" class="table-responsive">
                  <c:choose>
                    <c:when test="${sessionScope.cart == null || sessionScope.cart.size() == 0 }">
                      <br><h4>購物車內無商品，快去放些東西進來!</h4>
                    </c:when>    
				  
				  <c:otherwise>
                    <p class="text-muted">現有${ sessionScope.cart.size() }項商品</p>
                      <table class="table">
                      <thead>
                        <tr>
                          <th colspan="2">商品</th>
                          <th>賣家</th>
                          <th width="150px">數量</th>
                          <th colspan="2">價格</th>
                        </tr>
                      </thead> 
				      <c:forEach var="i" begin="0" end="${ sessionScope.cart.size() - 1 }">
                        <tbody>
                          <tr>
                            <td width="75px">(照片)</td>
                            <td width="250px">${ sessionScope.cart.get(i).productName }</td>
                            <td>${ sessionScope.cart.get(i).sellerID }</td>
                            <td width="150px">
							  <span id="spanM${ i }">	
							    <c:choose>
								  <c:when test="${ sessionScope.cart.get(i).quantity > 1 }">
								    <button class="btn btn-outline-secondary" name=1 value=${ i } onclick="cartPage_Modify(this)"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
								  </c:when>
								  <c:otherwise>
									<button class="btn btn-outline-secondary" ><i class="fa fa-chevron-left" aria-hidden="true"></i></button>
								  </c:otherwise>
								</c:choose>
							  </span>
										&nbsp;&nbsp;<span id="quan${ i }">${ sessionScope.cart.get(i).quantity } </span>&nbsp;
							  <span id="spanP${ i }">
								<c:choose>
								  <c:when test="${ sessionScope.cart.get(i).quantity < sessionScope.cart.get(i).stock + sessionScope.cart.get(i).quantity }">
									<button class="btn btn-outline-secondary" name=-1 value=${ i } onclick="cartPage_Modify(this)"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
								  </c:when>
								  <c:otherwise>
									<button class="btn btn-outline-secondary" ><i class="fa fa-chevron-right" aria-hidden="true"></i></button>
								  </c:otherwise>
								</c:choose>
							  </span>
                          	</td>
                            <td width="100px" id="pri${ i }">${ sessionScope.cart.get(i).price }</td>
                            <td width="50px"><button class="btn btn-outline-secondary" value=${ i } onclick="cartPage_Remove(this)"><i class="fa fa-trash-o"></i></button></td>
                          </tr>
                        </tbody>
                      </c:forEach>
                      </table>
                    </c:otherwise>
                    
                  </c:choose>
                  </div>
                  
                  <div class="box-footer d-flex justify-content-between flex-column flex-lg-row">
                    <form action="gotoProductPage" method="get">
                    <div class="left"><button type="submit" class="btn btn-outline-secondary"><i class="fa fa-chevron-left"></i> 繼續選購</button></div>
                    </form>
                    <div class="right">
                    <form style="display:inline;margin:0;padding:0;" action="gotoShoppingCartPage" method="get">
                      <button type="submit" class="btn btn-outline-secondary"><i class="fa fa-refresh"></i> 更新購物車</button>
                     </form>
                     <form style="display:inline;margin:0;padding:0;" id="gocheckout" action="transactionBack/create" method="post">
                     <c:choose>
                     	<c:when test="${ sessionScope.cart.size() > 0 }">
                      <button type="submit" class="btn btn-primary">前往結帳 <i class="fa fa-chevron-right"></i></button>
                     	</c:when>
                     </c:choose>
                    </form>	
                    </div>
                  </div>
                  <!-- /.table-responsive-->
                    
                <form method="post" action="checkout1.html">
                </form>
              </div>
              <!-- /.box-->
              <div class="row same-height-row">
                <div class="col-lg-3 col-md-6">
                  <div class="box same-height">
                    <h3>You may also like these products</h3>
                  </div>
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product2.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product2_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product2.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product1.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product1_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product1.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
                <div class="col-md-3 col-sm-6">
                  <div class="product same-height">
                    <div class="flip-container">
                      <div class="flipper">
                        <div class="front"><a href="detail.html"><img src="img/product3.jpg" alt="" class="img-fluid"></a></div>
                        <div class="back"><a href="detail.html"><img src="img/product3_2.jpg" alt="" class="img-fluid"></a></div>
                      </div>
                    </div><a href="detail.html" class="invisible"><img src="img/product3.jpg" alt="" class="img-fluid"></a>
                    <div class="text">
                      <h3>Fur coat</h3>
                      <p class="price">$143</p>
                    </div>
                  </div>
                  <!-- /.product-->
                </div>
              </div>
            </div>
            <!-- /.col-lg-9-->
            <div class="col-lg-3">
              <div class="box">
                <div class="box-header">
                  <h4 class="mb-0">優惠點數</h4>
                </div>
                <p class="text-muted">若您持有優惠點數，可在下方輸入使用碼</p>
                <form>
                  <div class="input-group">
                    <input type="text" class="form-control"><span class="input-group-append">
                      <button type="button" class="btn btn-primary"><i class="fa fa-gift"></i></button></span>
                  </div>
                  <!-- /input-group-->
                </form>
              </div>
            </div>
            <!-- /.col-md-3-->
          </div>
        </div>
      </div>
    </div>
    <%@ include file="/template/front/footer.jsp"%>
    <!-- JavaScript files-->
<script>
	function cartPage_Modify(num){
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='shoppingCartBack/mod'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index=" + num.value + "&num=" + num.name);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var modResult = JSON.parse(xhr.responseText);
				var quan = document.getElementById("quan" + num.value);
				var pri = document.getElementById("pri" + num.value);

				quan.innerHTML = modResult.quantity + "&nbsp;";
				pri.innerHTML = modResult.price;

				var spanM = document.getElementById("spanM" + num.value);
				var spanP = document.getElementById("spanP" + num.value);

				if(modResult.quantity > 1 && modResult.quantity < modResult.stock + modResult.quantity){
					spanM.innerHTML = "<button class='btn btn-outline-secondary' name=1 value=" + num.value + " onclick='cartPage_Modify(this)'><i class='fa fa-chevron-left' aria-hidden='true'></i></button>";
					spanP.innerHTML = "<button class='btn btn-outline-secondary' name=-1 value=" + num.value + " onclick='cartPage_Modify(this)'><i class='fa fa-chevron-right' aria-hidden='true'></i></button>";
				} else if(modResult.quantity <= 1){
					spanM.innerHTML = "<button class='btn btn-outline-secondary' ><i class='fa fa-chevron-left' aria-hidden='true'></i></button>";
				} else if(modResult.quantity >= modResult.stock + modResult.quantity){
					spanP.innerHTML = "<button class='btn btn-outline-secondary' ><i class='fa fa-chevron-right' aria-hidden='true'></i></button>";
				}
			}
		}
	}
	
	function cartPage_Remove(num){
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='shoppingCartBack/remove'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index=" + num.value);

		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 & xhr.status == 200){
				var allItems = document.getElementById("allcartitems");
				allItems.innerHTML = "";

				if(xhr.responseText == ""){
					var gocheckout = document.getElementById("gocheckout");
					gocheckout.innerHTML = "";
					allItems.innerHTML = "<br><h4>購物車內無商品，快去放些東西進來!</h4>";
					return;
				}

				var newCart = JSON.parse(xhr.responseText);
				
				var str = "<p class='text-muted'>現有" + newCart.length + "項商品</p>" +
							"<table class='table'>" +
							"<thead>" +
							"<tr>" +
								"<th colspan='2'>商品</th>" +
								"<th>賣家</th>" +
								"<th>數量</th>" +
								"<th colspan='2'>價格</th>" +
							"</tr>" +
							"</thead>";
				
				for(var i = 0 ; i < newCart.length ; i ++){
					str += "<tbody>" +
							"<tr>" +
							"<td width='75px'>(照片)</td>" +
							"<td width='315px'>" + newCart[i].productName + "</td>" +
							"<td>" + newCart[i].sellerID + "</td>" +	
							"<td>" +
							"<span id='spanM" + i + "'>";
							
					if(newCart[i].quantity > 1)
						str += "<button class='btn btn-outline-secondary' name=1 value=" + i + " onclick='cartPage_Modify(this)'><i class='fa fa-chevron-left' aria-hidden='true'></i></button>";
					else
						str += "<button class='btn btn-outline-secondary' ><i class='fa fa-chevron-left' aria-hidden='true'></i></button>";

					str += "</span>&nbsp;&nbsp;&nbsp;<span id='quan" + i + "'>" + newCart[i].quantity + "</span>&nbsp;&nbsp;&nbsp;<span id='spanP" + i + "'>";

					if(newCart[i].quantity < newCart[i].stock + newCart[i].quantity)
						str += "<button class='btn btn-outline-secondary' name=-1 value=" + i + " onclick='cartPage_Modify(this)'><i class='fa fa-chevron-right' aria-hidden='true'></i></button>";
					else
						str += "<button class='btn btn-outline-secondary' ><i class='fa fa-chevron-right' aria-hidden='true'></i></button>";

					str += "</span></td>" +
							"<td width='100px' id='pri" + i + "'>" + newCart[i].price + "</td>" +
							"<td width='50px'><button class='btn btn-outline-secondary' value=" + i + " onclick='cartPage_Remove(this)'><i class='fa fa-trash-o'></i></button></td>" +
							"</tr></tbody>";	
				}
				str += "</table>";

				allItems.innerHTML = str;
			}	
		}
	}	
</script>
   
  </body>
</html>