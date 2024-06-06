<html layout:decorate="~{admin/adminlayout}">
<head>
    <title>Quản lý người dùng</title>
    <link rel="stylesheet" th:href="@{/css/admin/user-manager.css}">
</head>
<body>
    <div layout:fragment="sections" class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Quản lý người dùng</h1>
                <hr>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Tên người dùng</th>
                            <th>Email</th>
                            <th>Vai tro</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr th:each="user, iterStat : ${users}">
                            <td th:text="${iterStat.count}"></td>
                            <td th:text="${user.username}"></td>
                            <td th:text="${user.email}"></td>
                            <td th:text="${user.role.getName()}"></td>
                            </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

