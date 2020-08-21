<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sephora Shopping Website</title>
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

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">SEPHORA</a>
    </div>
    
  </div>
</nav>

<div class="container">
   <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<c:choose>
	    <c:when test="${sessionScope.user==null}">
      <form action="${contextPath}/user/login" method="post">
    <div class="form-group">
      <label for="username">Username:</label>
      <input class="form-control" id="email" placeholder="Enter email" name="username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="password">
    </div>
    
    <button type="submit" class="btn btn-default">Submit</button>
    <a href="${contextPath}/user/register">Create an account</a><br/>
  </form>
    </c:when>
    
   
     <c:otherwise>	
    <a href="#" class="list-group-item disabled">welcome ${sessionScope.user.username}</a>
    <c:choose>
     <c:when test="${sessionScope.user.role == 'consumer'}">
    <a href="${contextPath}/cart/add" class="list-group-item list-group-item-success">SHOP</a>
    <a href="${contextPath}/cart/list" class="list-group-item list-group-item-info">MY CART</a>
    <a href="${contextPath}/order/history" class="list-group-item list-group-item-warning">ORDER HISTORY</a>
    </c:when>
    <c:when test="${sessionScope.user.role == 'seller'}">
    <a href="${contextPath}/sell/manage" class="list-group-item list-group-item-info">MANAGE STORE</a>
    
    </c:when>
    
  
	        </c:choose>
	    </c:otherwise>
	</c:choose>
 
	
	    

	<a href="${contextPath}/user/logout">Log out</a><br/>   
    
  </div>



</body>
</html>