<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Save Product</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
<form action="product" method="post"  >
  <h2>Your Product Is Saved!!</h2>
         
  <table class="table">
    <thead>
      <tr>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Product Price</th>
      </tr>
    </thead>
    
    <tbody>
   
      <tr>
        <td>${product.id }</td>
        <td>${product.productname }</td>
        <td>${product.productdescription }</td>
        <td>${product.productprice }</td>
        
      </tr>
      
    </tbody>
   
  </table>
</div>

 </div>
		
		<a href="list">Show All Products</a>
	</form>
	</div>
</body>
</html>

