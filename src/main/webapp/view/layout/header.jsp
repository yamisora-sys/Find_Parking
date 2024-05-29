<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tìm Chỗ Đậu Xe</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
    <style>
        /* Thiết lập lại CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa; 
            color: #343a40;
            line-height: 1.6;
        }
        
        nav {
            background-color: #343a40;
            padding: 1rem;
        }
        
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-brand, .nav-link {
            color: #ffffff;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        
        .navbar-brand:hover, .nav-link:hover {
            color: #d64747; 
        }
        
        .navbar-nav {
            list-style: none;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .nav-item {
            /* margin-left: 1rem; */
        }
    </style>
</head>
<body>
    <!-- Thanh điều hướng -->
    <nav th:fragment="header">
        <div class="container">
            <a class="navbar-brand" href="#">Find Parking</a>
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="#">Trang Chủ</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Về Chúng Tôi</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Đăng Nhập</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Đăng Ký</a></li>
            </ul>
        </div>
    </nav>
</body>
</html>
