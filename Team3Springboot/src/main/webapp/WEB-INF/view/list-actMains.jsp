<!--
=========================================================
* Paper Dashboard 2 - v2.0.1
=========================================================

* Product Page: https://www.creative-tim.com/product/paper-dashboard-2
* Copyright 2020 Creative Tim (https://www.creative-tim.com)

Coded by www.creative-tim.com

 =========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8" />
<title>List ActMains</title>
<%@ include file="/template/manager/head.jsp"%> 

<style>

table {   
	border-collapse:collapse;
	border-bottom:1px solid gray;
	width:100%;
}
 
th {
	border-bottom:1px solid gray;
	padding:10px;
}

tr {
	border-top:1px solid gray;
	text-align:center;	
}

td {
	padding:10px;
}

</style>

</head>

<body class="">
	<div class="wrapper ">
		<%@ include file="/template/manager/left.jsp"%> 
		<div class="main-panel" style="min-height: 100vh;">
			<!-- Navbar -->
			<%@ include file="/template/manager/navbar.jsp"%> 
			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<h3 class="description">



							<input type="button" value="增加新活動"
								onclick="window.location.href='showFormForAdd'; return false;"
								class="add-button" />

							<table>
								<tr>
									<th>活動名稱</th>
									<th>開始時間</th>
									<th>結束時間</th>
									<th>編輯</th>
								</tr>

								<c:forEach var="tempActMain" items="${actMains}">

									<c:url var="updateLink" value="/actMain/showFormForUpdate">
										<c:param name="actMainId" value="${tempActMain.id_act}"></c:param>
									</c:url>

									<c:url var="deleteLink" value="/actMain/delete">
										<c:param name="actMainId" value="${tempActMain.id_act}" />
									</c:url>

									<tr>
										<td>${tempActMain.name_act}</td>
										<td>${tempActMain.date_begin}</td>
										<td>${tempActMain.date_due}</td>

										<td>
										<a href="${updateLink }">更動</a>
										|
										<a
											href="${deleteLink}"
											onclick="if (!(confirm('Are you sure you want to delete this actMain?'))) return false">刪除</a>
										</td>

									</tr>

								</c:forEach>

							</table>



						</h3>
					</div>
				</div>
			</div>
			<footer class="footer"
				style="position: absolute; bottom: 0; width: -webkit-fill-available;">
				<div class="container-fluid">
					<div class="row">
						<nav class="footer-nav">
							<ul>
								<li><a href="https://www.creative-tim.com" target="_blank">Creative
										Tim</a></li>
								<li><a href="https://www.creative-tim.com/blog"
									target="_blank">Blog</a></li>
								<li><a href="https://www.creative-tim.com/license"
									target="_blank">Licenses</a></li>
							</ul>
						</nav>
						<div class="credits ml-auto">
							<span class="copyright"> Â© 2020, made with <i
								class="fa fa-heart heart"></i> by Creative Tim
							</span>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<!--   Core JS Files   -->
	<%@ include file="/template/manager/scriptlink.jsp"%>
</body>

</html>
