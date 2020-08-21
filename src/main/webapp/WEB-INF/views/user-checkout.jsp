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
var uid=0;   
function get_onclick(obj){  
    uid = obj.value;  
    var chk = document.getElementsByName("chk");  
    for(var i=0;i<chk.length;i++){  
        chk[i].checked = false;  
    }  
    obj.checked = true;  
}  
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check out</title>
</head>



<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <c:set var="contextPath" value="${pageContext.request.contextPath}" />
      <a class="navbar-brand" href="${contextPath}">SEPHORA</a>
    </div>
    
  </div>
</nav>

<div class="container">
  <h2><c:set var="contextPath" value="${pageContext.request.contextPath}" /></h2>
  <div class="list-group">
  
    <a href="#" class="list-group-item disabled">welcome ${sessionScope.user.username}</a>
    <a href="${contextPath}/cart/list" class="list-group-item list-group-item-success">GO TO CART</a>
   <h1>Your Order has been confirmed</h1>
   
  </div>
</div>

	
</body>
</html>