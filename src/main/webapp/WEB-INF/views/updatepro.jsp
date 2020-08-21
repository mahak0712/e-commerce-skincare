<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Manage Product</title>
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

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
	<a href="${contextPath}/sell/manage">Main Manage page</a><br/>
	
	<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
        <a class="navbar-brand" href="${contextPath}/sell/manage">MANAGE PAGE</a>
      
    </div>
    
  </div>
</nav>

	<table>
		<tr>
			<td>Product</td>
			<td>Price</td>
			<td>Seller</td>
			<td>Stock</td>
			<td>Description</td>
		</tr>
		<c:forEach var="product" items="${prolist}">
		<form:form action="${contextPath}/sell/manage/update" method="post" commandName="product">
			<form:hidden path="verifiedId" value="${sessionScope.user.userID}" />
			<tr>
				<td><form:input type="text" path="productName" value="${product.productName}" readonly="true" /></td>
				<td><form:input type="text"  path="price" value="${product.price}"/><form:errors style="color:red" path="price" /><br/></td>
				<td><form:input type="text" path="seller" value="Sephora" readonly="true" /></td>
				<td><form:input type="text" path="stock" value="${product.stock}"/><form:errors style="color:red" path="stock" /><br/></td>
				<td><form:input type="text" path="description" value="${product.description}" readonly="true" /></td>
				<td><form:input type = "file" path = "photo" value="${product.photo}" readonly = "true"/></td>
				<td><input type="submit" value="update" /><br/></td>
			</tr>
		</form:form>
		</c:forEach>
	</table>
	
	
</body>
</html>