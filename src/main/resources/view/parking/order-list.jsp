<!DOCTYPE html>
<html lang="en" layout:decorate="~{layout/home-layout}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div layout:fragment="sections">
        <h1>Order List</h1>
        <table border="1">
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Price</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <tr th:each="order : ${orders}">
                <td th:text="${order.id}"></td>
                <td th:text="${order.user.username}"></td>
                <td th:text="${order.timeIn}"></td>
                <td th:text="${order.timeOut}"></td>
                <td th:text="${order.status}"></td>
                <td>
                    <a th:href="@{/parking/order/edit/{id}(id=${order.id})}">Edit</a>
                    <a th:href="@{/parking/order/delete/{id}(id=${order.id})}">Delete</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>