<!-- display all roles -->
<html>

<head>
    <title>Role Permission</title>
</head>

<body>
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
</html>