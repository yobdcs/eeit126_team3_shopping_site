<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="iii.team3.member.model.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="iii.team3.product.model.ProductBean"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>商品列表</title>
<%@ include file="/template/front/head.jsp"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<style>
.img01-fluid {
	max-width: 100%;
/* 	height: 220px */
	height: auto; 
}
</style>
</head>

<body>
	<!-- navbar-->
	<%@ include file="/template/front/header.jsp"%>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
						<!-- breadcrumb-->
						<div class="col-lg-12">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<c:url value='/home'/>">首頁</a></li>
								<li aria-current="page" class="breadcrumb-item active">商品列表</li>
							</ol>
						</nav>
						</div>
			  <div class="col-lg-3">
              <!--
              *** MENUS AND FILTERS ***
              _________________________________________________________
              -->
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">商品分類</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column category-menu">
                    <li><a href="<c:url value='/product/listPage'/>" class="nav-link">總覽 <span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=3C" class="nav-link">3C</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=衣服" class="nav-link">衣服</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=家電" class="nav-link">家電</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=食品" class="nav-link">食品</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=運動" class="nav-link">運動</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=美妝" class="nav-link">美妝</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=精品" class="nav-link">精品</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=寵物" class="nav-link">寵物</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=玩具" class="nav-link">玩具</a></li>
                        <li><a href="/Team03ShoppingSite/product/goCostumerListByCategory?category=其他" class="nav-link">其他</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
              <!-- *** MENUS AND FILTERS END ***-->
<!--               <div class="banner"><a href="#"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div> -->
            </div>
            <div class="col-lg-9" >

						<div class="pages">
							<nav aria-label="Page navigation example"
								class="d-flex justify-content-center">
								<ul class="pagination">
<!-- 									<li class="page-item"><a href="#" aria-label="Previous" -->
<!-- 										class="page-link"><span aria-hidden="true">«</span><span -->
<!-- 											class="sr-only">Previous</span></a></li> -->
											<% 	
											int pageNum = (int)session.getAttribute("pagenum");
											if((int)request.getAttribute("trigger") == 1){
												pageNum = 1;
											}
											for(int i=1; i <= pageNum; i++){
											%>
											
									<li class="page-item"><button onclick="page(this)" class="page-link"><%= i %></button></li>
									<% } %>
<!-- 									<li class="page-item"><a href="#" aria-label="Next" -->
<!-- 										class="page-link"><span aria-hidden="true">»</span><span -->
<!-- 											class="sr-only">Next</span></a></li> -->
								</ul>
							</nav>
						</div>


<!-- 						<div class="box"> -->
<!-- 							<h1>Ladies</h1> -->
<!-- 							<p>In our Ladies department we offer wide selection of the -->
<!-- 								best products we have found and carefully selected worldwide.</p> -->
<!-- 						</div> -->
						<div class="row products" id="searchResult">
							<%
							Object obj = session.getAttribute("customerList");
							List<ProductBean> uList = null;
							if (obj instanceof List) {
								uList = (List<ProductBean>) obj;
							}
							if (uList != null) {
									int j = 0;
								
									for (int i = 0 ; i < uList.size() ; i ++) {
										
									if((int)request.getAttribute("trigger") == 1){
										if(!uList.get(i).getProductCategory().equals((String)request.getAttribute("cate")))
											continue;
									
									}
									
									if(++ j == 13)
										break;
									
							%>
							
							<input type="hidden" name="index" value=<%= i %> />
							<div class="col-lg-3 col-md-4">
								<div  class="product">
									<div style="height: 220px; display: flex; align-items: center; justify-content: center; background-color:silver">
										<img
										src="../image/<%=String.valueOf(uList.get(i).getUserName()) + uList.get(i).getProductName()%>.jpg"
										style="	max-width: 100%; max-height: 100%; " />
									</div>
									<div class="text">
										<h3>
											<a href="/Team03ShoppingSite/product/infoProduct/?infoId=<%=uList.get(i).getProductId()%>&index=<%= i %>&uid=<%=uList.get(i).getUserName() %>"><%=uList.get(i).getProductName()%></a>
										</h3>
										<p class="price">
											<del></del>
											$<%=uList.get(i).getProductPrice()%>
										</p>
										<p class="buttons">
											<a href="/Team03ShoppingSite/product/infoProduct/?infoId=<%=uList.get(i).getProductId()%>&index=<%= i %>
											&uid=<%=uList.get(i).getUserName() %>" class="btn btn-outline-secondary">商品詳細</a>
											
											<% MemberBean mb = (MemberBean) session.getAttribute("loginBean");  %>
											<% if(mb != null) {
												request.setAttribute("mb", mb.getMemberId());
											%>
											<span id="addC<%= i %>">
											<% if(uList.get(i).getProductAmount() > 0 && mb.getMemberId() != uList.get(i).getUserName()) {%>
												<button class="btn btn-primary" value=<%= i %> onclick="add(this)"><i class="fa fa-shopping-cart"></i>加入購物車</button>
											<% } 
											} 
											else{
												request.setAttribute("mb", -1);
											}
											%>
											</span>
										</p>
									</div>
									<!-- /.text-->
								</div>
								<!-- /.product            -->
							</div>

							<%
							}
							}
							%>
						</div>
			
					</div>
					<!-- /.col-lg-9-->
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
<script>
	function add(button) {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/shoppingCartBack/add'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index="+ button.value +"&quantity="+ 1);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				swal('已加入購物車', '', 'success');
				var addC = document.getElementById("addC" + button.value);
				var s = "";
				if(xhr.responseText > 0)
					s = "<button class='btn btn-primary' value=" + button.value + " onclick='add(this)'><i class='fa fa-shopping-cart'></i>加入購物車</button>";
					
				addC.innerHTML = s;
			}
		}
	}

	function page(btn){
		var pageNum = btn.innerHTML;

		var xhr = new XMLHttpRequest();
		xhr.open("Post","<c:url value='/product/listPageThi'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index="+ pageNum);
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var productList = JSON.parse(xhr.responseText)
				var rt = document.getElementById("searchResult");
				var content = "";			

				id = ${ mb };

				for(let i = 12*(pageNum - 1); i <= 12*pageNum -1 ;i++){
					if(i >= productList.length){
							break;
					}
					
					content +=
					"<input type='hidden' name='index' value="+ i +"/>"+
					"<div class='col-lg-3 col-md-4'>"+
						"<div  class='product'>"+
							"<div style='height: 220px; display: flex; align-items: center; justify-content: center; background-color:silver'>"+
								"<img src='../image/"+ productList[i].userName + productList[i].productName+".jpg' "+
								"style='max-width: 100%; max-height: 100%; ' />"+
							"</div>"+
							"<div class='text'>"+
								"<h3>"+
									"<a href='/Team03ShoppingSite/product/infoProduct/?infoId="+ productList[i].productId +"&index="+ i +"&uid="+ productList[i].userName+"'>"+
									productList[i].productName+"</a>"+
								"</h3>"+
								"<p class='price'>"+
									"<del></del>"+
									"$"+ productList[i].productPrice +
								"</p>"+
								"<p class='buttons'>"+ 
									"<a href='/Team03ShoppingSite/product/infoProduct/?infoId="+ productList[i].productId + "&index="+ i +
									"&uid="+ productList[i].userName +"' class='btn btn-outline-secondary'>商品詳細</a> ";

									if( id != -1){

										content += "<span id='addC"+ i +"'>";
									
										if(productList[i].productAmount > 0 && id != productList[i].userName) { 
											content += "<button class='btn btn-primary' value="+ i + " onclick='add(this)'><i class='fa fa-shopping-cart'></i>加入購物車</button>";
										} 
									}
								
									content += "</span>"+
								"</p>"+
							"</div>"+
						"</div>"+
					"</div>";
				}
				rt.innerHTML = content;
			}
		
		}
	}
		
</script>
</html>