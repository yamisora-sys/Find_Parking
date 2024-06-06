<!-- display all roles -->
<html layout:decorate="~{admin/adminlayout}">

<head>
    <title>Role Permission</title>
    <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script th:src="@{/js/toastr.min.js}"></script>
</head>

<body>
    <div layout:fragment="sections" class="container">
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Permission</th>
                    <th scope="col">Assigned</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr th:each="permission, iterStat : ${permissions}">
                    <td th:text="${iterStat.count}"></td>
                    <td th:text="${permission.name}"></td>
                    <td>
                        <span th:each="role : ${roles}">
                            <span th:attr="hidden=${role.hasPermission(permission) ? true : false}"><p class="badge rounded-pill bg-success white-text">[[${role.name}]]</p></span>
                        </span>
                    </td>
                    <td>
                        
                    </td>
                </tr>
            </tbody>
        </table>
        <script type="text/javascript" th:src="@{/js/notification/server-notification.js}"></script>
    </div>
</body>
<!-- <script type="text/javascript" th:inline="javascript">
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
</script> -->

</html>