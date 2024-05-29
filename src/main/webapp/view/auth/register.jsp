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
</head>

<body>
    <div class="register-container">
        <div class="logo">
            <img src="img/parking_logo_rb.png" alt="Logo">
        </div>
        <div class="register-title">Tạo tài khoản</div>
        <form th:action="@{/register}" th:object="${user}" method="post" id="registerForm">
            <div class="form-group">
                <input type="text" name="username" placeholder="Tên người dùng" th:field="*{username}" id="username">
                <p class="error" id="usernameError" th:if="${#fields.hasErrors('username')}" th:errors="*{username}"></p>
            </div>
            <div class="form-group">
                <input type="email" name="email" placeholder="Email" th:field="*{email}" id="email">
                <p class="error" id="emailError" th:if="${#fields.hasErrors('email')}" th:errors="*{email}"></p>
            </div>
            <div class="form-group">
                <input type="password" name="password" placeholder="Mật khẩu" th:field="*{password}" id="password">
                <p class="error" id="passwordError" th:if="${#fields.hasErrors('password')}" th:errors="*{password}"></p>
            </div>
            <div class="form-group">
                <input type="password" name="confirmPassword" placeholder="Xác nhận mật khẩu" id="confirmPassword" th:field="*{confirmPassword}">
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
            <p>Đã có tài khoản? <a href="login.html" class="fw-bold text-body"><u>Đăng nhập tại đây</u></a></p>
        </div>
    </div>

    <script type="text/javascript">
        function validateForm() {
            var isValid = true;
            var username = $('#username').val();
            var email = $('#email').val();
            var password = $('#password').val();
            var confirmPassword = $('#confirmPassword').val();
            var termsChecked = $('#termsCheckbox').is(':checked');

            $('.error').hide();

            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                $('#emailError').show();
                isValid = false;
            }

            var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            if (!passwordPattern.test(password)) {
                $('#passwordError').show();
                isValid = false;
            }

            if (password !== confirmPassword) {
                $('#confirmPasswordError').show();
                isValid = false;
            }

            if (!termsChecked) {
                toastr.error('Bạn phải đồng ý với các điều khoản dịch vụ.', 'Lỗi');
                isValid = false;
            }

            if (isValid) {
                $('#registerForm').submit();
            }
        }

        var toastr = window.toastr;
        toastr.options = {
            "closeButton": true,
            "debug": false,
            "newestOnTop": true,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        };
    </script>
</body>

</html>
