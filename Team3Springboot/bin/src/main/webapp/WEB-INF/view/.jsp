<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>

<head>
<title>List ActMains</title>

<!-- reference our style sheet -->

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>Act Manager</h2>
		</div>
	</div>

	<div id="container">
		<div id="content">

			<!-- put new button: Add Customer -->

			<input type="button" value="Add Act"
				onclick="window.location.href='showFormForAdd'; return false;"
				class="add-button" />


			<!-- add our html table here -->

			<table>
				<tr>
					<th>Act Name</th>
					<th>Beginning Date</th>
					<th>Due Date</th>
					<th>Action</th>
				</tr>

				<!-- loop over and print our customers -->
				<c:forEach var="tempActMain" items="${actMains}">

					<!-- construct an "update" link with ActMain id -->
					<c:url var="updateLink" value="/actMain/showFormForUpdate">
						<c:param name="actId" value="${tempActMain.id_act}"></c:param>
					</c:url>

					<!-- construct an "delete" link with customer id -->
					<c:url var="deleteLink" value="/actMain/delete">
						<c:param name="actId" value="${tempActMain.id_act}" />
					</c:url>

					<tr>
						<td>${tempActMain.name_act}</td>
						<td>${tempActMain.date_begin}</td>
						<td>${tempActMain.date_due}</td>

						<td>
							<!-- display the update link -->
							<a href="${updateLink }">Update</a>
							|
							<a href="${deleteLink}"  onclick="if (!(confirm('Are you sure you want to delete this actMain?'))) return false">Delete</a>
							</td>
					</tr>

				</c:forEach>

			</table>

		</div>

	</div>

</body>

</html>









