<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
    </div>
    
  </div>
</nav>

<div class="container">
  
  <div class="list-group">
  
    <a href="#" class="list-group-item disabled">welcome ${sessionScope.user.username}</a>
    <a href="${contextPath}/sell/manage" class="list-group-item list-group-item-success">Manage Page</a>
<h2>Update ${requestScope.product.productName} Successfully!</h2>
   
  </div>
</div>

	<h2>Update ${requestScope.product.productName} Successfully!</h2>
</body>
</html>