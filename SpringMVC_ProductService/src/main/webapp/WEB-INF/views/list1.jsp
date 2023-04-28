<html>
<head>
    <title>Product List</title>
</head>
<body>
    <h1>Product List</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
        </tr>
        <tr th:each="product : ${products}">
            <td th:text="${product.id}"></td>
            <td th:text="${product.name}"></td>
            <td th:text="${product.description}"></td>
            <td th:text="${product.price}"></td>
        </tr>
    </table>
        <div>
        <ul class="pagination">
            <li class="page-item" th:classappend="${currentPage == 0 ? 'disabled' : ''}">
                <a class="page-link" th:href="@{${'/products?page=' + (currentPage - 1)}}">&laquo; Previous</a>
            </li>
            <li class="page-item" th:each="page : ${#numbers.sequence(0, totalPages - 1)}" 
                th:classappend="${currentPage == page ? 'active' : ''}">
                <a class="page-link" th:href="@{${'/products?page=' + page}}" th:text="${page + 1}"></a>
            </li>
            <li class="page-item" th:classappend="${currentPage == totalPages - 1 ? 'disabled' : ''}">
                <a class="page-link" th:href="@{${'/products?page=' + (currentPage + 1)}}">Next &raquo;</a>
            </li>
        </ul>
    </div>
</body>
</html>
    