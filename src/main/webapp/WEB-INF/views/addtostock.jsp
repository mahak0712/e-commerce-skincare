<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Product for your Store</title>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
    </div>
    <ul class="nav navbar-nav">
   
      
      <li><a href="${contextPath}/sell/manage">MANAGE PAGE</a></li>
      
    </ul>
  </div>
</nav>



	
	<div class="container">
	<h2>welcome ${sessionScope.user.username}</h2>
  <h3>ADD PRODUCTS</h3>
  <form:form action="${contextPath}/sell//manage/in" method="post" commandName="sell" enctype="multipart/form-data">
  <form:hidden path="verifiedId" value="${sessionScope.user.userID}" />
    <div class="form-group">
      <label for="email">PRODUCT NAME:</label>
      <form:input class="form-control" id="email" placeholder="Enter product name" path="productName"/>
    </div>
    
    <div class="form-group">
      <label for="email">PRICE:</label>
      <form:input class="form-control" id="email" placeholder="Enter price" path="price"/>
    </div>
    
    <div class="form-group">
      <label for="email">STOCK:</label>
      <form:input class="form-control" id="email" placeholder="Enter stock" path="stock"/>
    </div>
    
    <div class="form-group">
      <label for="email">SELLER:</label>
      <form:input class="form-control" value="Sephora" readonly="true" path="seller"/>
    </div>
    
    <div class="form-group">
      <label for="email">DESCRIPTION:</label>
      <form:input class="form-control" id="email" placeholder="Enter description" path="description"/>
    </div>
    
    <div class="form-group">
      <label for="email">PHOTO:</label>
      <form:input type="file" class="form-control" id="email"  path="photo"/>
    </div>
    
    <div class="form-group">
    <input type="submit" value="product in stock" />
    </div>
    
  </form:form>
   <button type="submit" class="btn btn-default"  onclick="window.location.href='${contextPath}/user/logout'" >Submit</button>

	
<a href="${contextPath}/user/logout">LOG OUT</a><br/>	
	
 </div>	
	
<%-- 	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<a href="${contextPath}">HomePage</a><br/>
	<a href="${contextPath}/sell/manage">manage page</a><br/>
	<h2>welcome ${sessionScope.user.username} sellman</h2>
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
	<h2>welcome ${sessionScope.user.username} sellman</h2>
  <h3>ADD PRODUCTS</h3>
<form:form action="${contextPath}/sell//manage/in" method="post" commandName="sell" enctype="multipart/form-data">
		<form:hidden path="verifiedId" value="${sessionScope.user.userID}" />
		Product Name:<form:input type="text" path="productName" /><form:errors style="color:red" path="productName" /> <br/>
		Price:<form:input type="text"  path="price"/><form:errors style="color:red" path="price" /><br/>
		Stock:<form:input type="text" path="stock"/><form:errors style="color:red" path="stock" /><br/>
		Seller:<form:input type="text" path="seller" value="Sephora" readonly="true" /><br/>
		Description:<form:input type="text" path="description" /><form:errors style="color:red" path="description" /><br/>
		Photo:<form:input type = "file" path = "photo"/>
		<input type="submit" value="product in stock" />
	</form:form>
	
	<a href="${contextPath}/user/logout">Log out</a><br/>--%>

</body>
</html>