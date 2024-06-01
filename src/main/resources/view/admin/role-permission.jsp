<!-- display all roles -->
<html>

<head>
    <title>Role Permission</title>
    <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script th:src="@{/js/toastr.min.js}"></script>

</head>

<body>
    <p th:text="${notification}"></p>
    <p th:text="${notificationType}"></p>
    <table border="1">
        <tr>
            <th>Role</th>
            <th>Permission</th>
        </tr>
        <tr th:each="role : ${roles}">
            <td th:text="${role.name}"></td>
            <td>
                <table border="1">
                    <tr>
                        <th>Permission</th>
                        <th>Has Permission</th>
                    </tr>
                    <tr th:each="permission : ${permissions}">
                        <td th:text="${permission.name}"></td>
                        <td>
                            <!-- @GetMapping("/role-permission/detach") -->
                            <!-- public String detachPermissionFromRole(@RequestParam("role_id") int role_id, @RequestParam("permission_id") int permission_id) -->
                            <input type="checkbox" th:if="${role.hasPermission(permission)}" checked="checked"
                                th:onclick="'javascript:window.location.href=\'/admin/role-permission/detach?role_id=' + ${role.id} + '&permission_id=' + ${permission.id} + '\''" />
                            <input type="checkbox" th:unless="${role.hasPermission(permission)}"
                                th:onclick="'javascript:window.location.href=\'/admin/role-permission/attach?role_id=' + ${role.id} + '&permission_id=' + ${permission.id} + '\''" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<script type="text/javascript" th:inline="javascript" th:src="@{/js/notification/server-notification.js}"></script>
<script type="text/javascript" th:inline="javascript">
    var toastr = window.toastr;
    let notification = [[${notification}]];
    let notificationType = [[${notificationType}]];
    switch (notificationType) {
        case 'success':
            toastr.success(notification);
            break;
        case 'error':
            toastr.error(notification);
            break;
        case 'info':
            toastr.info(notification);
            break;
        case 'warning':
            toastr.warning(notification);
            break;
        default:
            toastr.info(notification);
            break;
    }
</script>

</html>