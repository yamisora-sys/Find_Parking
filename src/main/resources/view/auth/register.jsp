<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    <script src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/auth/register.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="js/sockjs.min.js"></script>
    <script src="js/stomp.umd.min.js"></script>
    <script src="js/stomp.min.js"></script>
</head>

<body>
    <div class="register-container">
        <div class="logo">
            <img src="img/parking_logo_rb.png" alt="Logo">
        </div>
        <div class="register-title">Tạo tài khoản</div>
        <!-- Password Matching class -->
        <form th:action="@{/register}" th:object="${user}" method="post" id="registerForm">
            <div class="form-group">
                <input type="text" name="username" placeholder="Tên người dùng" th:field="*{username}" id="username">
                <p class="error" id="usernameError" th:if="${#fields.hasErrors('username')}" th:errors="*{username}"></p>
            </div>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" th:field="*{email}" id="email">
                <p class="error" id="emailError" th:if="${#fields.hasErrors('email')}" th:errors="*{email}"></p>
            </div>
            <div class="form-group position-relative">
                <input type="password" name="password" placeholder="Mật khẩu" th:field="*{password}" id="password">
                <span class="password-toggle" onclick="togglePasswordVisibility('password')">
                    <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y" style="cursor: pointer; margin-right:10px" id="eyeIconPassword"></i>
                </span>
                <p class="error" id="passwordError" th:if="${#fields.hasErrors('password')}" th:errors="*{password}"></p>
            </div>
            <div class="form-group position-relative">
                <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" id="confirmPassword" th:field="*{confirmPassword}">
                <span class="password-toggle" onclick="togglePasswordVisibility('confirmPassword')">
                    <i class="bi bi-eye-slash position-absolute top-50 end-0 translate-middle-y" style="cursor: pointer; margin-right:10px" id="eyeIconConfirmPassword"></i>
                </span>
                <p class="error" id="confirmPasswordError" th:if="${#fields.hasErrors('confirmPassword')}" th:errors="*{confirmPassword}"></p>
            </div>
            <div class="form-check d-flex justify-content-center mb-4">
                <input class="form-check-input me-2" type="checkbox" id="termsCheckbox">
                <label class="form-check-label" for="termsCheckbox">
                    Tôi đồng ý với tất cả các điều khoản trong <a href="#!" class="text-body"><u>Điều khoản dịch vụ</u></a>
                </label>
            </div>
            <button type="submit" class="register-btn">Đăng ký</button>
        </form>
        <div class="register-options">
            <p>Đã có tài khoản? <a href="/login">Đăng nhập tại đây</a></p>
        </div>
    </div>

    <script type="text/javascript">
        function togglePasswordVisibility(fieldId) {
            var passwordField = document.getElementById(fieldId);
            var eyeIcon = document.getElementById('eyeIcon' + fieldId.charAt(0).toUpperCase() + fieldId.slice(1));

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
    </script>
    <script type="text/javascript" th:src="@{/js/notification/realtime-notification.js}"></script>
</body>

</html>
