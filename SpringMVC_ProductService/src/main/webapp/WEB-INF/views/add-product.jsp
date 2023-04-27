
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Add Product</title>
</head>
<body>
	<h1>Welcome ${user.userEmail }</h1>
	<hr>
	<h1>Add Product</h1>
	
  </div>
	<div class="container mt-5">

		<form action="saveproduct" method="post">

			<div class="mb-3">
				<label for="product_ID">Enter Product Id</label> <input
					type="text" class="form-control" id="product_ID"
					placeholder="Enter your product id" name="id">

			</div>

			<div class="mb-3">
				<label for="product_Name">Enter Product Name</label> <input type="text"
					class="form-control" id="product_Name"
					" placeholder="Enter your Product Name" name="name">

			</div>

			<div class="mb-3">
				<label for="product_Description">Enter Product Description</label> <input type="text"
					class="form-control" id="product_Description"
					" placeholder="Enter your Product Description" name="description">

			</div>

			<div class="mb-3">
				<label for="product_Price">Enter Product Price</label> <input type="text"
					class="form-control" id="product_Price"
					" placeholder="Enter your Product Price" name="price">

			
</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
	</div>
		
		<a href="list">Show All Products</a>
	</form>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->


</body>
</html>