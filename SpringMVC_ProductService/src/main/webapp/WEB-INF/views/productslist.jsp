<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<%@ page isELIgnored="false"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Add Products <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
      </li>
      <li class="nav-item dropdown">
       
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
    
    </ul>
  <form class="form-inline my-2 my-lg-0" action="search">
        <input class="form-control mr-sm-2" type="text" name="name" placeholder="Search by name" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<div class="container">

<form action="product" method="post"  >

         
  <table class="table table-striped mt-3">
    <thead>
      <tr>
        <th>Product Id</th>
        <th>Product Name</th>
        <th>Product Description</th>
        <th>Product Price</th>
        <th>Action</th>
      </tr>
    </thead>
    
    <tbody>
     <c:forEach items="${products}" var="product">
      <tr>
        <td> ${product.id }</td>
        <td>${product.productname }</td>
        <td>${product.productdescription }</td>
        <td>${product.productprice }</td>
        <td><a class="btn btn-danger" href="delete/${product.id }" ><i class="fa-solid fa-trash"></i> </a> </td>
	    <td><a class="btn btn-primary" href="update/${product.id }" ><i class="fa-light fa-pen-to-square"></i> </a> </td>
        
      </tr>
      
    </tbody>
    </c:forEach>
  </table>
  
  
    <ul class="pagination">
        <c:choose>
            <c:when test="${page == 1}">
                <li class="page-item disabled"><span class="page-link">Previous</span></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${page - 1}">Previous</a></li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="1" end="${totalPages}" var="pageNumber">
            <c:choose>
                <c:when test="${pageNumber == page}">
                    <li class="page-item active"><span class="page-link">${pageNumber}</span></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item"><a class="page-link" href="?page=${pageNumber}">${pageNumber}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:choose>
            <c:when test="${page == totalPages}">
                <li class="page-item disabled"><span class="page-link">Next</span></li>
            </c:when>
            <c:otherwise>
                <li class="page-item"><a class="page-link" href="?page=${page + 1}">Next</a></li>
            </c:otherwise>
        </c:choose>
    </ul>

    <div class="mt-3">
        <p>Page ${page} of ${totalPages}</p>
        <p>Showing ${pageStart}-${pageEnd} of ${totalProducts} products</p>
    </div>

   
</div>

 </div>
		
		<button type="submit" class="btn btn-primary">Add Product</button>
	</form>
	</div>
</body>
</html>
