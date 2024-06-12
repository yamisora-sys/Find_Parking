<!DOCTYPE html>
<html lang="en" layout:decorate="~{layout/home-layout}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt chỗ đậu xe</title>
    <link rel="stylesheet" th:href="@{/css/bootstrap.min.css}">
    <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script th:src="@{/js/toastr.min.js}"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
      <script th:src="@{/js/bootstrap.bundle.min.js}"></script>
</head>
<body>
    <div layout:fragment="sections">
        <h1>Order List</h1>
        <table border="1" class="table">
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Check In</th>
                <th>Check Out</th>
                <th>Status</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <tr th:each="order : ${orders}">
                <td th:text="${order.id}"></td>
                <td th:text="${order.user.username}"></td>
                <td th:text="${order.timeIn}"></td>
                <td th:text="${order.timeOut}"></td>
                <td th:if="${order.isPayment()} == true">Đã thanh toán</td>
                <td th:if="${order.isPayment()} == false">Chưa thanh toán</td>
                <td th:text="${order.paymentAmount}"></td>
                <td>
                    <a th:href="@{/parking/order/payment?(id=${order.id})}">Thanh toán</a>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>