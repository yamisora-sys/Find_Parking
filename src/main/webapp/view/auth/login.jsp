<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Login</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    <script src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/auth/login.css">
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <img src="img/parking_logo_rb.png" alt="Logo">
        </div>
        <div class="login-title">Login to Find Parking</div>
        <form th:action="@{/login}" th:object="${user}" method="post" enctype="utf8" id="loginForm">
            <div class="form-group">
                <input type="text" name="username" placeholder="Username" th:field="*{username}" id="username">
                <p class="error" id="usernameError">Username must be at least 8 characters long.</p>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Password" th:field="*{password}" id="password">
                <p class="error" id="passwordError">Password must be at least 8 characters long and contain at least one letter, one number, and one special character.</p>
            </div>
            <button type="button" class="login-btn" onclick="validateForm()">Login</button>
        </form>
        <div class="login-options">
            <a href="#">Forgot password?</a> or <a href="#">Sign up</a>
        </div>
    </div>

    <script type="text/javascript">
        function validateForm() {
            var isValid = true;
            var username = $('#username').val();
            var password = $('#password').val();
            $('#usernameError').hide();
            $('#passwordError').hide();

            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                $('#passwordError').show();
                isValid = false;
            }

            if (isValid) {
                $('#loginForm').submit();
            }
        }

        var toastr = window.toastr;
        if ('${param.error}' === 'true') {
            toastr.error('Invalid username and password.', 'Error');
        }
    </script>
</body>
</html>
