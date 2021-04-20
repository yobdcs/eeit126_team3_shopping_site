<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首頁</title>
<%@ include file="/template/front/head.jsp"%>
</head>
<body>
<%@ include file="/template/front/header.jsp"%>
<span class="breadcrumb-item"><a href="<c:url value="/shoppingCart/testHome" />">test homepage</a></span>



<%@ include file="/template/front/footer.jsp"%>
</body>
</html>