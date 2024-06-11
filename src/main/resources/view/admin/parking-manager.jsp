<html layout:decorate="~{admin/adminlayout}">
<head>
    <title>Parking Manager</title>
    <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script th:src="@{/js/toastr.min.js}"></script>
</head>
<body>
    <div layout:fragment="sections">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Parking Name</th>
                    <th scope="col">Parking Address</th>
                    <th scope="col">Parking Capacity</th>
                    <th scope="col">Parking Status</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr th:each="parking, iterStat : ${parkings}">
                    <td th:text="${iterStat.count}"></td>
                    <td th:text="${parking.name}"></td>
                    <td th:text="${parking.address}"></td>
                    <td th:text="${parking.capacity}"></td>
                    <td th:text="${parking.status}"></td>
                    <td>
                        <a th:href="@{/admin/parking/edit/{id}(id=${parking.id})}" class="btn btn-primary">Edit</a>
                        <a th:href="@{/admin/parking/delete/{id}(id=${parking.id})}" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <script type="text/javascript" th:src="@{/js/notification/server-notification.js}"></script>
    </div>
</body>
</html>