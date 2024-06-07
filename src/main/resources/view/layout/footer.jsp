<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Bãi Đậu Xe</title>
    <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
    <script th:src="@{/js/popperjs.js}"></script>
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"> -->
    <link rel="stylesheet" th:href="@{/css/fontawesome.all.min.css}">

</head>
<body>
    <!-- Phần Footer -->
    <footer class="footer" th:fragment="footer">
        <div class="container" style="margin-top: 40px;">
            <div class="row">
                <div class="col-md-6">
                    <h2>Về Find Parking</h2>
                    <p>Find Parking là một ứng dụng web giúp người dùng tìm kiếm bãi đậu xe trong khu vực. Người dùng có thể tìm kiếm bãi đậu xe theo vị trí, xem chi tiết bãi đậu xe và đặt chỗ đậu xe.</p>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6">
                            <h2>Liên kết nhanh</h2>
                            <ul class="list-unstyled">
                                <li><a style="color: black" href="/">Trang chủ</a></li>
                                <li><a style="color: black" href="/about">Về chúng tôi</a></li>
                                <li><a style="color: black" href="/contact">Liên hệ</a></li>
                            </ul>
                        </div>
                        <div class="col-md-6">
                            <h2>Pháp lý</h2>
                            <ul class="list-unstyled">
                                <li><a style="color: black" href="#">Điều khoản dịch vụ</a></li>
                                <li><a style="color: black" href="#">Chính sách bảo mật</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <div class="row">
                <div class="col-12 text-center" style="background-color: #1da1f2; color: #ffffff;">
                    &copy; 2024 Find Parking. All Rights Reserved.
                </div>
            </div>
        </div>
    </footer>
    <!-- Bao gồm Bootstrap JS
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script> -->
</body>
</html>
