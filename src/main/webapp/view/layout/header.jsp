<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Bãi Đậu Xe</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    <script src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
    <!-- Phần Header -->
    <header class="header py-3" th:fragment="header">
        <div class="container d-flex flex-wrap justify-content-between align-items-center">
            <a href="/"><img class="logo-img" src="img/parking_logo_rb.png" alt="Logo"></a>
            <nav class="navbar navbar-expand-lg">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Bản đồ</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about">Về chúng tôi</a></li>
                        <li class="nav-item"><a class="nav-link" href="/contact">Liên hệ</a></li>
                    </ul>
                </div>
            </nav>
            <div class="auth-buttons">
                <a href="/login" class="btn btn-primary me-2">Đăng nhập</a>
                <a href="/register" class="btn btn-primary">Đăng ký</a>
            </div>
        </div>
    </header>
    <!-- Kết thúc Phần Header -->

    <!-- Thư viện JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>
