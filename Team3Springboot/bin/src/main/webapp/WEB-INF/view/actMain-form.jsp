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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8" />
<title>List ActMains</title>
<%@ include file="/template/manager/head.jsp"%> 

<style>
form {
	margin-top: 10px;
}

label {
	font-size: 16px;
	display: block;
	text-align: right;
	margin-right: 10px;
	margin-top: 8px;
	margin-bottom: 8px;
}

input {
	width: 250px;
	border: 1px solid #666;
	border-radius: 5px;
	padding: 4px;
	font-size: 16px;
}

.save {
	font-weight: bold;
	width: 130px;
	padding: 5px 10px;
	margin-top: 30px;
}

table {
	border-style: none;
	width: 50%;
}

tr {
	border-style: none;
	text-align: left;
}
</style>

</head>

<body class="">
	<div class="wrapper ">
		<%@ include file="/template/manager/left.jsp"%> 
		<div class="main-panel">
			<!-- Navbar -->
			<%@ include file="/template/manager/navbar.jsp"%> 
			<!-- End Navbar -->
			<div class="content">

				<div class="row">
					<div class="col-md-12">
						<h3 class="description">

							<div id="wrapper">
								<div id="header">
									<h2>活動編輯介面</h2>
								</div>
							</div>

							<div id="container">


								<form:form action="saveActMain" modelAttribute="actMain"
									method="POST">

									<form:hidden path="id_act" />

									<table>
										<tbody>
											<tr>
												<td><label>活動名稱:</label></td>
												<td><form:input path="name_act" /></td>
											</tr>

											<tr>
												<td><label>開始時間:</label></td>
												<td><form:input path="date_begin" /></td>
											</tr>

											<tr>
												<td><label>結束時間:</label></td>
												<td><form:input path="date_due" /></td>
											</tr>

											<tr>
												<td><label></label></td>
												<td><input type="submit" value="儲存編輯" class="save" />
													<input type="button" value="返回活動簡表"
													onclick="window.location.href='${pageContext.request.contextPath}/actMain/list'; return false;" class="save" />
												</td>
											</tr>


										</tbody>
									</table>

								</form:form>

								<div style=""></div>

							</div>

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
