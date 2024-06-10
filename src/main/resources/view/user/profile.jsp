<!DOCTYPE html>
<html layout:decorate="~{layout/home-layout}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hồ Sơ Người Dùng</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .profile-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-header img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }

        .profile-details {
            margin-bottom: 30px;
        }

        .profile-actions button {
            margin-right: 10px;
        }

        .parking-list .parking-item {
            display: flex;
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .parking-list img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            margin-right: 15px;
        }
    </style>
</head>

<body>

    <div layout:fragment="sections" class="container">
        <div class="profile-header">
            <img src="img/parking_logo.png" alt="Ảnh Đại Diện">
            <h2>Nguyễn Văn A</h2>
            <div class="profile-actions">
                <a href="/edit-profile" class="btn btn-primary">Chỉnh Sửa Hồ Sơ</a>
                <button class="btn btn-secondary">Đăng Xuất</button>
            </div>
        </div>

        <div class="profile-details">
            <h3>Thông Tin Cá Nhân</h3>
            <p><strong>Tên:</strong> Nguyễn Văn A</p>
            <p><strong>Email:</strong> email@example.com</p>
            <p><strong>Số Điện Thoại:</strong> 0123456789</p>
        </div>
        <h3>Danh Sách Bãi Đậu Xe Đã Đặt</h3>
        <div class="parking-list">
            
            <div class="parking-item">
                <img src="img/parking1.jpg" alt="Bãi đậu xe 1">
                <div class="details">
                    <h5>Bãi đậu xe 1</h5>
                    <p>Địa điểm: 123 Đường A, Quận B, TP. C</p>
                    <p>Check-in: 01/01/2024 08:00</p>
                    <p>Check-out: 01/01/2024 10:00</p>
                </div>
            </div>
            <div class="parking-item">
                <img src="img/parking2.jpg" alt="Bãi đậu xe 2">
                <div class="details">
                    <h5>Bãi đậu xe 2</h5>
                    <p>Địa điểm: 456 Đường D, Quận E, TP. F</p>
                    <p>Check-in: 02/02/2024 09:00</p>
                    <p>Check-out: 02/02/2024 11:00</p>
                </div>
            </div>
            <!-- Thêm các mục bãi đậu xe đã đặt khác -->
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
