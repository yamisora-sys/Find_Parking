<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Bãi Đậu Xe</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* Kiểu tùy chỉnh */
        .footer {
            background-color: #343a40;
            color: #ffffff;
            padding: 40px 0;
        }
        .footer h2 {
            color: #ffffff;
            margin-bottom: 20px;
        }
        .footer p {
            color: #bbbbbb;
        }
        .footer ul {
            list-style: none;
            padding: 0;
        }
        .footer ul li {
            margin-bottom: 10px;
        }
        .footer ul li a {
            color: #bbbbbb;
            text-decoration: none;
        }
        .footer ul li a:hover {
            color: #ffffff;
        }
        .footer .social-icons {
            display: flex;
            gap: 10px;
            margin-top: 20px;
        }
        .footer .social-icons a {
            color: #bbbbbb;
            font-size: 20px;
            transition: color 0.3s ease;
        }
        .footer .social-icons a:hover {
            color: #ffffff;
        }
    </style>
</head>
<body>
    <!-- Phần Footer -->
    <footer class="footer" th:fragment="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="footer-col">
                        <h2>Về Tìm Bãi Đậu Xe</h2>
                        <p>Tìm Bãi Đậu Xe là một ứng dụng web giúp người dùng tìm kiếm bãi đậu xe trong khu vực của họ. Người dùng có thể tìm kiếm bãi đậu xe theo vị trí, xem chi tiết bãi đậu xe và đặt chỗ đậu xe.</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-col">
                        <h2>Liên kết nhanh</h2>
                        <ul>
                            <li><a href="#">Trang chủ</a></li>
                            <li><a href="#">Về chúng tôi</a></li>
                            <li><a href="#">Liên hệ</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-col">
                        <h2>Pháp lý</h2>
                        <ul>
                            <li><a href="#">Điều khoản dịch vụ</a></li>
                            <li><a href="#">Chính sách bảo mật</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="footer-col">
                        <h2>Kết nối</h2>
                        <ul class="social-icons">
                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                            <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Kết thúc Phần Footer -->

    <!-- Thư viện JavaScript -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
