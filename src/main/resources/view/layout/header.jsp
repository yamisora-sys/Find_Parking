<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Bãi Đậu Xe</title>
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <link rel="stylesheet" th:href="@{css/toastr.min.css}">
    <script th:src="@{js/toastr.min.js}"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
    <script th:src="@{/js/popperjs.js}"></script>
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
            <!-- check if user login -->
            <div sec:authorize="isAuthenticated()">
                <div class="dropdown">
                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                        <!-- user->username -->
                        <span th:text="${auth.username}" class="me-2"></span>
                        <img th:src="${auth.avatar}" alt="User" class="rounded-circle h-20 shadow-4" style="width: 20px;">
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <li><a class="dropdown-item" href="/profile">Trang cá nhân</a></li>
                        <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            <!-- if not authen -->
            <div sec:authorize="!isAuthenticated()">
                <div class="auth-buttons">
                    <a href="/login" class="btn btn-primary me-2">Đăng nhập</a>
                    <a href="/register" class="btn btn-primary">Đăng ký</a>
                </div>
                </div>
            </div>
        </div>
    </header>
    <!-- Kết thúc Phần Header -->

    <!-- Thư viện JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
</body>
</html>