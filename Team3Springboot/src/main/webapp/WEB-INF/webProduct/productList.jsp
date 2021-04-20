<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="iii.team3.product.model.ProductBean"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
    <title>Product List</title>
    <%@ include file="/template/front/head.jsp"%>
</head>
<body>
	<!-- navbar-->
		<!--
      *** TOPBAR ***
      _________________________________________________________
      -->
<%@ include file="/template/front/header.jsp"%>
	<div id="all">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<!-- breadcrumb-->
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="<c:url value='/home'/>">首頁</a></li>
								<li aria-current="page" class="breadcrumb-item active">會員商品列表</li>
							</ol>
						</nav>
					</div>
					<div id="customer-orders" class="col-lg-12">
						<div class="box">
							<h1>會員商品列表</h1>
							<hr>
							<div class="table-responsive">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>商品ID</th>
											<th>商品名稱</th>
											<th>商品類別</th>
											<th>商品圖片</th>
											<th>商品價格</th>
											<th>商品數量</th>
											<th>商品修改</th>
											<th>商品頁面</th>
										</tr>
									</thead>
									<tbody>
										<%
										Object obj = request.getAttribute("pList");
										List<ProductBean> pList = null;
										if (obj instanceof List) {
											pList = (List<ProductBean>) obj;
										}
										if (pList != null) {
											for (ProductBean bean : pList) {
										%>
										<tr>
											<td><%= bean.getProductId() %></td>
											<td><%= bean.getProductName()%></td>
											<td><%= bean.getProductCategory()%></td>
											<td>
											<img src="../image/<%= bean.getUserName() + bean.getProductName()%>.jpg" width="150px" height="150px"/>
											</td>
											<td><%= bean.getProductPrice()%></td>
											<td><%= bean.getProductAmount()%></td>
											<td><a href = "editProduct/?editId=<%= bean.getProductId()%>" class="btn btn-primary btn-sm">編輯</a></td>
											<td>
											<%  if (bean.getProductVision() == 0) {%>
											<a href = "infoProduct/?infoId=<%= bean.getProductId()%>&index=-1&uid=<%= bean.getUserName()%>" class="btn btn-primary btn-sm">商品頁</a>
											<%} else { %>
											<font>商品下架中</font>
											<%} %>
											</td>
										</tr>
										<%
										}
										}
										%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--
    *** FOOTER ***
    -->
  <%@ include file="/template/front/footer.jsp"%>
	
</body>
</html>