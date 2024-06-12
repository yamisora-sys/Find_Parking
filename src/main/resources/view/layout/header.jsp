<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Bãi Đậu Xe</title>
    <script type="text/javascript" th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
    <script type="text/javascript" th:src="@{/js/toastr.min.js}"></script>
    <script type="text/javascript" th:src="@{/js/popperjs.js}"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
    <script th:src="@{/js/bootstrap.bundle.min.js}"></script>
</head>

<body>
    <!-- Phần Header -->
    <header class="header py-3" th:fragment="header">
        <div class="container d-flex flex-wrap justify-content-between align-items-center">
            <a href="/"><img class="logo-img" th:src="@{/img/parking_logo_rb.png}" alt="Logo"></a>
            <nav class="navbar navbar-expand-lg">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/">Trang chủ</a></li>
                        <li class="nav-item"><a class="nav-link" th:href="@{/parking/display-parking-map}">Bản đồ</a></li>
                        <li class="nav-item"><a class="nav-link" href="/about">Về chúng tôi</a></li>
                        <li class="nav-item"><a class="nav-link" href="/contact">Liên hệ</a></li>
                    </ul>
                </div>
            </nav>
            <!-- Search Form -->
            <div th:fragment="search-coordinate">
                <form class="d-flex" role="search" style="flex-grow: 1; max-width: 400px; margin-left: 10px; height: 40px" onsubmit="getCoordinates(event)">
                    <input class="form-control me-2" type="search" id="address" placeholder="Nhập vào địa điểm" aria-label="Search">
                    <button class="btn btn-outline-primary" type="submit" style="height: 40px; width: 100px">Tìm</button>
                </form>
            </div> 
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
                        <li><a class="dropdown-item" href="/parking/create">Thêm bãi đỗ xe</a></li>
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
    </header>
    <!-- Kết thúc Phần Header -->

    <!-- Thư viện JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>
    <script>
        async function getCoordinates() {
            const address = document.getElementById("address").value;
            const apiKey = '37115a7a77524c859abcd229d39a1b5b'; 
            const url = `https://api.opencagedata.com/geocode/v1/json?q=${encodeURIComponent(address)}&key=${apiKey}`;

            try {
                const response = await fetch(url);
                const data = await response.json();
                if (data.results.length > 0) {
                    const latitude = data.results[0].geometry.lat;
                    const longitude = data.results[0].geometry.lng;
                    document.getElementById("result").innerHTML = `Latitude: ${latitude}, Longitude: ${longitude}`;
                    window.location.href = `/route?latitude=${latitude}&longitude=${longitude}`;
                } else {
                    document.getElementById("result").innerHTML = "Không tìm thấy tọa độ cho địa chỉ này.";
                } 
            } catch (error) {
                document.getElementById("result").innerHTML = "Có lỗi xảy ra khi lấy tọa độ.";
                console.error(error);
            }
        }
    </script>
</body>
</html>
