<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Successfully</title>
</head>
<style>
 body {
    
                background-image: url('/Users/mahaksingh/Pictures/sephora.jpg');
                background-repeat: repeat;
                background-size: cover;
    background-color:pink;
 }
 </style>
<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<a href="${contextPath}/cart/list">my cart</a><br/>
	<a href="${contextPath}/cart/add">Continue Shopping!</a><br/>
	<h1>Thanks! ${sessionScope.user.username} </h1>
	<h2>Add <b>${requestScope.product.productName}</b> to Cart Successfully! </h2>
</body>
</html>