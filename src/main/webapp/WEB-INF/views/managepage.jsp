<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Manage Online Store</title>

<style>
 body {
    
                background-image: url('/Users/mahaksingh/Pictures/sephora.jpg');
                background-repeat: repeat;
                background-size: cover;
    background-color:pink;
 }
 </style>
</head>

<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
    </div>
    
  </div>
</nav>

<div class="container">
  <h2><c:set var="contextPath" value="${pageContext.request.contextPath}" /></h2>
  <div class="list-group">
    <a href="#" class="list-group-item disabled">welcome ${sessionScope.user.username}</a>
    <a href="${contextPath}/sell/manage/in" class="list-group-item list-group-item-success">Add Products</a>
    <a href="${contextPath}/sell/manage/out" class="list-group-item list-group-item-info">Out Stock</a>
    <a href="${contextPath}/sell/manage/update" class="list-group-item list-group-item-warning">Update Products</a>
    <a href="${contextPath}/user/logout" class="list-group-item list-group-item-danger">Log out</a>
  </div>
</div>



</body>
</html>