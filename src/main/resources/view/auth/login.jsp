<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Đăng nhập</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    <script src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
	<link rel="stylesheet" href="css/auth/login.css">
</head>
<body>
    <div class="login-container">
        <div class="logo">
            <img src="img/parking_logo_rb.png" alt="Logo">
        </div>
        <div class="login-title">Đăng nhập vào Find Parking</div>
        <form th:action="@{/login}" th:object="${user}" method="post" enctype="utf8" id="loginForm">
            <div class="form-group">
                <input type="text" name="username" placeholder="Tên đăng nhập" th:field="*{username}" id="username">
                <p class="error" id="usernameError">Tên đăng nhập phải có ít nhất 8 ký tự.</p>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Mật khẩu" th:field="*{password}" id="password">
                <span class="password-toggle" onclick="togglePasswordVisibility()">
                    <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y" style="cursor: pointer; margin-right:10px" id="eyeIcon"></i>
                </span>
                <p class="error" id="passwordError">Mật khẩu phải có ít nhất 8 ký tự và chứa ít nhất một chữ cái, một số và một ký tự đặc biệt.</p>
            </div>
            <button type="button" class="login-btn" onclick="validateForm()">Đăng nhập</button>
        </form>
        <div class="login-options">
            <a href="#">Quên mật khẩu?</a> hoặc <a href="/register">Đăng ký</a>
        </div>
    </div>

    <script type="text/javascript">
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('password');
            var eyeIcon = document.getElementById('eyeIcon');

            if (passwordField.type === "password") {
                passwordField.type = "text";
                eyeIcon.classList.remove('bi-eye-slash');
                eyeIcon.classList.add('bi-eye');
            } else {
                passwordField.type = "password";
                eyeIcon.classList.remove('bi-eye');
                eyeIcon.classList.add('bi-eye-slash');
            }
        }

        function validateForm() {
            var isValid = true;
            // var username = $('#username').val();
            // var password = $('#password').val();
            // $('#usernameError').hide();
            // $('#passwordError').hide();

            // var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            // if (!passwordPattern.test(password)) {
            //     $('#passwordError').show();
            //     isValid = false;
            // }

            if (isValid) {
                $('#loginForm').submit();
            }
        }

        var toastr = window.toastr;
        if ('${param.error}' === 'true') {
            toastr.error('Tên đăng nhập hoặc mật khẩu không hợp lệ.', 'Lỗi');
        }
    </script>
</body>
</html>
