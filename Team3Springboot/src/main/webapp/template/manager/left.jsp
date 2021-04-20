<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <div class="sidebar" data-color="white" data-active-color="danger">
      <div class="logo">
        <a href="" class="simple-text logo-mini">
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->
        </a>
        <a href="" class="simple-text logo-normal">
<!--           Your Logo -->
<!--           <div class="logo-image-big"> -->
            <img src="${pageContext.request.contextPath}/image/imaaaage/logo.jpg" width="50%">
<!--          </div> -->
        </a>
      </div>
      <div class="sidebar-wrapper">
        <ul class="nav">
          <li id="getMsgChart.controller">
            <a href="<c:url value='/MessageBoard/getMsgChart.controller' />">
              <i class="nc-icon nc-chart-pie-36"></i>
              <p>各項數據統計</p>
            </a>
          </li>
          <li id="list">
          	<a href="${pageContext.request.contextPath}/actMain/list">
          		<i class="nc-icon nc-bank"></i>
				<p>活動簡表</p>
			</a>
		  </li>
          <li id="ShowAll.controller">
            <a href="${pageContext.request.contextPath}/ShowAll.controller">
              <i class="nc-icon nc-single-02"></i>
              <p>會員管理</p>
            </a>
          </li>
          
          <li id="adminSearchAllAjax.controller">
            <a href="<c:url value='/MessageBoard/adminSearchAllAjax.controller' />">
              <i class="nc-icon nc-chat-33"></i>
              <p>留言管理</p>
            </a>
          </li>
          
          <li id="returnCases">
            <a href="<c:url value='/shoppingCart/TransactionManager/returnCases' />">
              <i class="nc-icon nc-cart-simple"></i>
              <p>退貨申請處理</p>
            </a>
          </li>
          
          <li id="getAllReportedProduct">
            <a href="<c:url value='/product/getAllReportedProduct' />">
              <i class="nc-icon nc-chart-pie-36"></i>
				<p>被檢舉商品管理</p>
            </a>
          </li>
          
          <li id="home">
            <a href="<c:url value='/' />">
              <i class="nc-icon nc-istanbul"></i>
              <p>回購物中心</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    
    <script>
    	var lis = window.location.pathname.split("/");
    	for(let i=0; i< lis.length; i++){
    		var active = document.getElementById(lis[i]);
    		if(active){
    			active.setAttribute("class","active");
    		}
    	}
    </script>