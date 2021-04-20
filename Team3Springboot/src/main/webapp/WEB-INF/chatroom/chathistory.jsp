<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>聊天紀錄</title>
<link href="https://cdn.bootcss.com/animate.css/3.5.2/animate.min.css" rel="stylesheet">
<%@ include file="/template/front/head.jsp"%>

</head>
<body>
<%@ include file="/template/front/header.jsp"%>
	<div id="all">
      <div>
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
              <!-- breadcrumb-->
              <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="<c:url value='/'/>">首頁</a></li>
                  <li aria-current="page" class="breadcrumb-item active">聊天紀錄</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="row">
            <!--
            *** LEFT COLUMN ***
            _________________________________________________________
            -->
<!--             <div id="blog-listing" class="col-lg-9"> -->
<!--               <div class="box"> -->
<!--                 <h2>聊天紀錄</h2> -->
                       
                
              </div>
              
				

              <div class="box">               
				 <div class="d-flex justify-content-left">
				     <nav aria-label="Page navigation example">
				        <ul class="pagination" id="pageid">
				        </ul>
				      </nav>
  				</div>
                <h2 class="read-more"><a href="<c:url value='/updatepage.controller'/>" class="btn btn-primary">使用者資訊</a></h2>
              </div>
            	<div class="row" id="content">
            	
   				</div>
            </div>
          </div>
        </div>

        
		
<!-- <div id="all"><a href="javascript:" id="a">logout</a></div> -->
<%@ include file="/template/front/footer.jsp"%>
</body>
<script src="${pageContext.request.contextPath}/js/chathistoryPage.js"></script>
<script src="https://cdn.bootcss.com/wow/1.1.2/wow.min.js"></script>

</html>