<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>

<div class="container mt-5">
    <h1>Product List</h1>

    <form class="form-inline my-2 my-lg-0" action="/products/search">
        <input class="form-control mr-sm-2" type="text" name="name" placeholder="Search by name" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>

    <table class="table table-striped mt-3">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Description</th>
                <th>Price</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.description}</td>
                    <td>${product.price}</td>
                    <td>
                        <a class="btn btn-primary" href="/products/${product.id}">View</a>
                        <a class="btn btn-secondary" href="/products/${product.id}/edit">Edit</a>
                        <form class="d-inline" action="/products/${product.id}/delete" method="post">
                            <input type="hidden" name="_method" value="POST">
                            <button class="btn btn-danger" type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
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

    <a class="btn btn-success mt-3" href="/products/create">Create Product</a>

</div>

</body>
</html>