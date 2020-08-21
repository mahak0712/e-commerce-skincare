<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
function check(obj){
    var chk = obj.value;  
	if(chk<=0){
		document.getElementById("qtyerror").innerHTML = "quantity should greater than one";
	}else{
		document.getElementById("qtyerror").innerHTML ="";
	}
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shop</title>

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
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
    </div>
    <form class="navbar-form navbar-right" action="${contextPath}/cart/add">
      <div class="form-group">
        <input type="text" name="queryString" class="form-control" placeholder="Search" name="search">
      </div>
      <button type="submit" value= "Search" = class="btn btn-default">Submit</button>
    </form>
  </div>
</nav>

<div class="container">
  <h2><c:set var="contextPath" value="${pageContext.request.contextPath}" /></h2>
  <div class="list-group">
  
    <a href="#" class="list-group-item disabled">welcome ${sessionScope.user.username}</a>
    <a href="${contextPath}/cart/list" class="list-group-item list-group-item-success">MY CART</a>
   <h1>Your Order has been confirmed</h1>
   
  </div>
</div>


<div class="container">
   <c:set var="contextPath" value="${pageContext.request.contextPath}" />
	
	<c:choose>
	    <c:when test="${requestScope.searchResults!=null}">
	     <a href="${contextPath}/cart/orderby?action=sasc" class="list-group-item list-group-item-success">LOW TO HIGH</a>
	      <a href="${contextPath}/cart/orderby?action=sdesc" class="list-group-item list-group-item-success">HIGH TO LOW</a>
     
    </c:when>
    
   
     <c:otherwise>	 
     <a href="${contextPath}/cart/orderby?action=asc" class="list-group-item list-group-item-success">LOW TO HIGH</a>
	 <a href="${contextPath}/cart/orderby?action=desc" class="list-group-item list-group-item-success">HIGH TO LOW</a>
	    </c:otherwise>
	</c:choose>
 
	
	    
    
  </div>




	

    
	<font color="red"><span id="qtyerror"></span></font>
		<table border="4" cellpadding="9" cellspacing="9">
			<tr>
				<td>Product</td>
				<td>Price</td>
				<td>Quantity</td>
				<td>Seller</td>
				<td>Stock</td>
				<td>Description</td>
				<td>Photo</td>
			</tr>
		<c:choose>
			<c:when test="${requestScope.searchResults!=null}">
				<c:forEach var="product" items="${requestScope.searchResults}">
					<form:form action="${contextPath}/cart/add" method="post" commandName="cart">
					<form:hidden path="verifiedId" value="${sessionScope.user.userID}" />
					<tr>
						<td><form:input type="text" path="productName" value="${product.productName}" readonly="true"/></td>
						<td><form:input type="text"  path="price" value="${product.price}" readonly="true"/></td>
						<td><form:input type="text"  path="quantity"  />
							<font color="red"><form:errors path="quantity" /></font>
						</td>
						<td><form:input type="text" path="seller" value="Sephora" readonly="true"/></td>
						<td><form:input type="text" path="stock" value="${product.stock}" readonly="true"/></td>
						<td><form:input type="text" path="description" value="${product.description}" readonly="true"/></td>
						<td><img src="file:///Users/mahaksingh/Pictures/${product.photoFile}" /></td>
						<c:if test="${product.stock > 1}">
							<td><input type="submit" value="add to cart"/><br/></td>
						</c:if>
						
						
					</tr>
					</form:form>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="product" items="${allpro}">
					<form:form action="${contextPath}/cart/add" method="post" commandName="cart">
						<form:hidden path="verifiedId" value="${sessionScope.user.userID}" />
						<tr>
							<td><form:input type="text" path="productName" value="${product.productName}" readonly="true"/></td>
							<td><form:input type="text"  path="price" value="${product.price}" readonly="true"/></td>
							<td><form:input type="text"  path="quantity" id="qty"/>
								<font color="red"><form:errors path="quantity" /></font>
							</td>
							<td><form:input type="text" path="seller" value="Sephora" readonly="true"/></td>

							<td><form:input type="text" path="stock" value="${product.stock}" readonly="true"/></td>
							<td><form:input type="text" path="description" value="${product.description}" readonly="true"/></td>
							<td><img src="file:///Users/mahaksingh/Pictures/${product.photoFile}" /></td>
							
							<c:if test="${product.stock > 1}">
								<td><input type="submit" value="add to cart"/><br/></td>
							</c:if>
							
						</tr>
					</form:form>
				</c:forEach>
			</c:otherwise>
		</c:choose>

		
		</table>	

	
	<a href="${contextPath}/user/logout">Log out</a><br/>
		

</body>
</html>