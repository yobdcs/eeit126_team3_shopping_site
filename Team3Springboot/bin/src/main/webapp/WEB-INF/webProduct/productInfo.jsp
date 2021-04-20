<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="iii.team3.product.model.ProductBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<% ProductBean bean = (ProductBean)session.getAttribute("pInfo"); %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title><%=bean.getProductName()%></title>
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
                  <li class="breadcrumb-item"><a href="<c:url value='/'/>">首頁</a></li>
                  <li class="breadcrumb-item"><a href="<c:url value='../listPageSec'/>">商品列表</a></li>
<!--                   <li class="breadcrumb-item"><a href="#">Tops</a></li> -->
                  <li aria-current="page" class="breadcrumb-item active"><%=bean.getProductName()%></li>
                </ol>
              </nav>
            </div>
		 <div class="col-lg-3 order-2 order-lg-1">
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
                    <li><a href="category.html" class="nav-link">分類一覽 <span class="badge badge-secondary"></span></a>
                      <ul class="list-unstyled">
                        <li><a href="category.html" class="nav-link">3C</a></li>
                        <li><a href="category.html" class="nav-link">衣服</a></li>
                        <li><a href="category.html" class="nav-link">家電</a></li>
                        <li><a href="category.html" class="nav-link">食品</a></li>
                        <li><a href="category.html" class="nav-link">運動</a></li>
                        <li><a href="category.html" class="nav-link">美妝</a></li>
                        <li><a href="category.html" class="nav-link">精品</a></li>
                        <li><a href="category.html" class="nav-link">寵物</a></li>
                        <li><a href="category.html" class="nav-link">其他</a></li>
                      </ul>
                    </li>
                  </ul>
                </div>
              </div>
<!--               <div class="card sidebar-menu mb-4"> -->
<!--                 <div class="card-header"> -->
<!--                   <h3 class="h4 card-title">Brands <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3> -->
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <form> -->
<!--                     <div class="form-group"> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"> Armani  (10) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"> Versace  (12) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"> Carlo Bruni  (15) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"> Jack Honey  (14) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button> -->
<!--                   </form> -->
<!--                 </div> -->
<!--               </div> -->
<!--               <div class="card sidebar-menu mb-4"> -->
<!--                 <div class="card-header"> -->
<!--                   <h3 class="h4 card-title">Colours <a href="#" class="btn btn-sm btn-danger pull-right"><i class="fa fa-times-circle"></i> Clear</a></h3> -->
<!--                 </div> -->
<!--                 <div class="card-body"> -->
<!--                   <form> -->
<!--                     <div class="form-group"> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"><span class="colour white"></span> White (14) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"><span class="colour blue"></span> Blue (10) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"><span class="colour green"></span>  Green (20) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"><span class="colour yellow"></span>  Yellow (13) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                       <div class="checkbox"> -->
<!--                         <label> -->
<!--                           <input type="checkbox"><span class="colour red"></span>  Red (10) -->
<!--                         </label> -->
<!--                       </div> -->
<!--                     </div> -->
<!--                     <button class="btn btn-default btn-sm btn-primary"><i class="fa fa-pencil"></i> Apply</button> -->
<!--                   </form> -->
<!--                 </div> -->
<!--               </div> -->
              <!-- *** MENUS AND FILTERS END ***-->
            </div>

            <div class="col-lg-9 order-1 order-lg-2">
              <div id="productMain" class="row">
                <div class="col-md-6" style="display: flex; align-items: center; justify-content: center;">
                
                  <div data-slider-id="1" class="owl-carousel shop-detail-carousel" >
                  		<div class="owl-stage-outer" >
                  			<div><img src="../../image/<%= String.valueOf(bean.getUserName()) +bean.getProductName()%>.jpg"  alt="" class="img-fluid" 
                  			></div>
               			</div>
                  </div>

                  <!-- /.ribbon-->
                  <!-- /.ribbon-->
                </div>
                <div class="col-md-6">
                  <div class="box">                
                    <h1 class="text-center"><%=bean.getProductName()%></h1>
                    <p class="goToDescription"><a href="#details" class="scroll-to">下拉觀看商品詳細</a></p>
                    <p class="price">價格:<%=bean.getProductPrice() %></p>
                    <p id="quantity" class="price">數量:<%=bean.getProductAmount()%></p>
					<input id="indexP" type="hidden" value=<%= (int)request.getAttribute("index") %>>
					
                    <p class="text-center buttons">
<!--                     	<a href="basket.html" class="btn btn-primary"><i class="fa fa-shopping-cart"></i>加入購物車</a> -->
						<c:if test="${ sessionScope.loginBean != null }">
						<c:choose>
							<c:when test="${ requestScope.index >= 0 && sessionScope.loginBean.memberId != sessionScope.pInfo.userName }">
		                    	<span id="addC"><button class="btn btn-primary" value=1 onclick="add(this)"><i class="fa fa-shopping-cart"></i>加入購物車</button></span>    
        		            	<a href="basket.html" class="btn btn-outline-primary"><i class="fa fa-heart"></i> 加入追蹤</a>
							</c:when>						
						</c:choose>
						</c:if>
                    </p>
                 
                  </div>
                  <div data-slider-id="1" class="owl-thumbs">
                    <button class="owl-thumb-item"><img src="../../image/<%=String.valueOf(bean.getUserName())+bean.getProductName()%>.jpg" width="200px" height="200px" alt="" class="img-fluid"></button>
                  </div>
                </div>
              </div>
              <BUTTON id="btnshowDetail" class="btn btn-outline-info">商品說明</BUTTON><BUTTON id="btnshowQA" class="btn btn-outline-secondary">問與答</BUTTON>
              <div id="details" class="box" >
              <div >
                <p></p>
                <span><input type="hidden" name="pId" id="msgProductId" value="<%=bean.getProductId() %>"/></span> 
                <h4>商品狀況</h4>
                <p><%=bean.getProductType() %></p>
                <h4>商品說明:</h4>
                <p><%=bean.getProductDescription() %></p>
                <h4>付款方式:</h4>
                <ul>
                  	  <% for (int i = 0; i < bean.getPayTpyeList().size(); i++) { %>
                  <li><%=bean.getPayTpyeList().get(i).getPayType() %></li>
   					  <% } %>
                </ul>
                <h4>運送方式:</h4>
                <ul>
                      <% for (int i = 0; i < bean.getShipTypeList().size(); i++) { %>
                  <li><%=bean.getShipTypeList().get(i).getShipType() %></li>
   					  <% } %>
                </ul>
                <h4>商品所在地:</h4>
                <p><%=bean.getProductLocation() %></p>
                </div>
                <hr>
                <div class="social">
                  <h4>分享</h4>
                  <p><a href="#" class="external facebook"><i class="fa fa-facebook"></i></a><a href="#" class="external gplus"><i class="fa fa-google-plus"></i></a><a href="#" class="external twitter"><i class="fa fa-twitter"></i></a><a href="#" class="email"><i class="fa fa-envelope"></i></a></p>
                </div>
              </div>
              <div id="productQA"><%@ include file="/WEB-INF/MessageBoardapps/MsgBoard.jsp"%></div>
            </div>
            <!-- /.col-md-9-->
          </div>
        </div>
      </div>
    </div>
    <!--
    *** FOOTER ***
    _________________________________________________________
    -->
   <%@ include file="/template/front/footer.jsp"%>
    
   <SCRIPT type="text/javascript">
	function add(button) {
		var index = document.getElementById("indexP").value;
		
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "<c:url value='/shoppingCart/shoppingCartBack/add'/>", true);
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("index="+ index +"&quantity="+ 1);

		xhr.onreadystatechange = function(){
			if (xhr.readyState == 4 && xhr.status == 200) {
				var addC = document.getElementById("addC");
				var q = document.getElementById("quantity");

				q.innerHTML = "數量:" + xhr.responseText;
				
				var s = "";
				if(xhr.responseText > 0)
					s = "<button class='btn btn-primary' value=1 onclick='add(this)'><i class='fa fa-shopping-cart'></i>加入購物車</button>";
					
				addC.innerHTML = s;
			}
		}
	}
	
	$('#btnshowDetail').click(function(){
	$('#productQA').hide();
	$('#details').show('fast')
	})
	
	$('#productQA').hide();
	$('#btnshowQA').click(function(){
		
		
	$('#details').hide();
	$('#productQA').show('fast')

	})
		



   </SCRIPT>
    
    
    
    
    
  </body>
</html>