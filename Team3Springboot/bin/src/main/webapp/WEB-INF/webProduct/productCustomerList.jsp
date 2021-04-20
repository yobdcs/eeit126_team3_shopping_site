<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="iii.team3.member.model.MemberBean"%>
<%@page import="org.springframework.web.context.annotation.SessionScope"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
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
								<li class="breadcrumb-item"><a href="<c:url value='/'/>">首頁</a></li>
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
                  <h3 class="h4 card-title">Categories</h3>
                </div>
                <div class="card-body">
                  <ul class="nav nav-pills flex-column category-menu">
                    <li><a href="category.html" class="nav-link">Men <span class="badge badge-secondary">42</span></a>
                      <ul class="list-unstyled">
                        <li><a href="category.html" class="nav-link">T-shirts</a></li>
                        <li><a href="category.html" class="nav-link">Shirts</a></li>
                        <li><a href="category.html" class="nav-link">Pants</a></li>
                        <li><a href="category.html" class="nav-link">Accessories</a></li>
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link active">Ladies  <span class="badge badge-light">123</span></a>
                      <ul class="list-unstyled">
                        <li><a href="category.html" class="nav-link">T-shirts</a></li>
                        <li><a href="category.html" class="nav-link">Skirts</a></li>
                        <li><a href="category.html" class="nav-link">Pants</a></li>
                        <li><a href="category.html" class="nav-link">Accessories</a></li>
                      </ul>
                    </li>
                    <li><a href="category.html" class="nav-link">Kids  <span class="badge badge-secondary">11</span></a>
                      <ul class="list-unstyled">
                        <li><a href="category.html" class="nav-link">T-shirts</a></li>
                        <li><a href="category.html" class="nav-link">Skirts</a></li>
                        <li><a href="category.html" class="nav-link">Pants</a></li>
                        <li><a href="category.html" class="nav-link">Accessories</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">Brands <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                </div>
                <div class="card-body">
                  <form>
                    <div class="form-group">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Armani  (10)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Versace  (12)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Carlo Bruni  (15)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> Jack Honey  (14)
                        </label>
                      </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                  </form>
                </div>
              </div>
              <div class="card sidebar-menu mb-4">
                <div class="card-header">
                  <h3 class="h4 card-title">Colours <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3>
                </div>
                <div class="card-body">
                  <form>
                    <div class="form-group">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour white"></span> White (14)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour blue"></span> Blue (10)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour green"></span>  Green (20)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour yellow"></span>  Yellow (13)
                        </label>
                      </div>
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"><span class="colour red"></span>  Red (10)
                        </label>
                      </div>
                    </div>
                    <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button>
                  </form>
                </div>
              </div>
              <!-- *** MENUS AND FILTERS END ***-->
              <div class="banner"><a href="#"><img src="img/banner.jpg" alt="sales 2014" class="img-fluid"></a></div>
            </div>
            <div class="col-lg-9" >
						<div class="box">
							<h1>Ladies</h1>
							<p>In our Ladies department we offer wide selection of the
								best products we have found and carefully selected worldwide.</p>
						</div>
<!-- 						<div class="box"> -->
<!-- 							<h1>Ladies</h1> -->
<!-- 							<p>In our Ladies department we offer wide selection of the -->
<!-- 								best products we have found and carefully selected worldwide.</p> -->
<!-- 						</div> -->
						<div class="row products">
							<%
							Object obj = session.getAttribute("customerList");
							List<ProductBean> uList = null;
							if (obj instanceof List) {
								uList = (List<ProductBean>) obj;
							}
							if (uList != null) {
								for (int i = 0 ; i < uList.size() ; i ++) {
							%>
							<input type="hidden" name="index" value=<%= i %> />
							<div class="col-lg-3 col-md-4">
								<div  class="product">
									<div style="height: 220px; display: flex; align-items: center; justify-content: center;">
										<img
										src="../image/<%=String.valueOf(uList.get(i).getUserName()) + uList.get(i).getProductName()%>.jpg"
										style="	max-width: 100%; max-height: 100%; " />
									</div>
									<div class="text">
										<h3>
											<a href="/Team03ShoppingSite/product/infoProduct/?infoId=<%=uList.get(i).getProductId()%>&index=<%= i %>"><%=uList.get(i).getProductName()%></a>
										</h3>
										<p class="price">
											<del></del>
											$<%=uList.get(i).getProductPrice()%>
										</p>
										<p class="buttons">
											<a href="/Team03ShoppingSite/product/infoProduct/?infoId=<%=uList.get(i).getProductId()%>&index=<%= i %>" class="btn btn-outline-secondary">商品詳細</a>
											
											<% MemberBean mb = (MemberBean) session.getAttribute("loginBean");  %>
											<% if(mb != null) {%>
											<span id="addC<%= i %>">
											<% if(uList.get(i).getProductAmount() > 0 && mb.getMemberId() != uList.get(i).getUserName()) {%>
												<button class="btn btn-primary" value=<%= i %> onclick="add(this)"><i class="fa fa-shopping-cart"></i>加入購物車</button>
											<% } 
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
						<div class="pages">
<!-- 							<p class="loadMore"> -->
<!-- 								<a href="#" class="btn btn-primary btn-lg"><i -->
<!-- 									class="fa fa-chevron-down"></i> Load more</a> -->
<!-- 							</p> -->
							<nav aria-label="Page navigation example"
								class="d-flex justify-content-center">
								<ul class="pagination">
									<li class="page-item"><a href="#" aria-label="Previous"
										class="page-link"><span aria-hidden="true">«</span><span
											class="sr-only">Previous</span></a></li>
									<li class="page-item active"><a href="#" class="page-link">1</a></li>
									<li class="page-item"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a></li>
									<li class="page-item"><a href="#" class="page-link">4</a></li>
									<li class="page-item"><a href="#" class="page-link">5</a></li>
									<li class="page-item"><a href="#" aria-label="Next"
										class="page-link"><span aria-hidden="true">»</span><span
											class="sr-only">Next</span></a></li>
								</ul>
							</nav>
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
<script>
	function add(button) {
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/shoppingCartBack/add'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index="+ button.value +"&quantity="+ 1);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var addC = document.getElementById("addC" + button.value);
				var s = "";
				if(xhr.responseText > 0)
					s = "<button class='btn btn-primary' value=" + button.value + " onclick='add(this)'><i class='fa fa-shopping-cart'></i>加入購物車</button>";
					
				addC.innerHTML = s;
			}
		}
	}

</script>
</html>