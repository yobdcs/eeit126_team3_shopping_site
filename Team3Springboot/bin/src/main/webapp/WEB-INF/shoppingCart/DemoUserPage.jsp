<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>demo user page</title>
</head>
<body>
	<h2>登入中使用者ID : 1</h2>
	<form action="demoProductBack.getAll" method="post">
<!-- 		<input type="hidden" name="buyerID" value=1> -->
		<div>
			<input type="submit" value="開始購物">
		</div>
	</form>
	<br>
	<form action="transactionBack/overview" method="get">
		<div><input type="submit" value="交易紀錄查詢">	</div>
	</form>
	<br><br><br><br><br><br>
	<a href="<c:url value="/shoppingCart/gotoShoppingCartPage" />">購物車</a>
	
	
	<form action="test" method="post">
		<div><input type="submit" value="autocomplete test">	</div>
	</form>
	<br>
</body>
</html>