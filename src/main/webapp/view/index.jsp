<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title th:text="${pageTitle}">Tìm Bãi Đậu Xe</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    <script src="js/toastr.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        .banner {
            border: 2px solid #343a40;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .search-section {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .parking-list {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .parking-item {
            border: 1px solid #dddddd;
            border-radius: 10px;
            overflow: hidden;
            width: calc(33.333% - 20px);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #ffffff;
        }
        .parking-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }
        .parking-item .details {
            padding: 10px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div th:include="layout/header :: header"></div>
    <!-- Kết thúc Header -->

    <!-- Nội dung chính -->
    <div class="container">
        <!-- Phần Tìm kiếm -->
        <div class="search-section">
            <form>
                <div class="row">
                    <div class="col-md-3">
                        <div class="form-group">
                            <label for="location">Địa điểm</label>
                            <input type="text" class="form-control" id="location" placeholder="Nhập địa điểm">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="checkin">Thời gian Check-in</label>
                            <input type="date" class="form-control" id="checkin">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="checkout">Thời gian Check-out</label>
                            <input type="date" class="form-control" id="checkout">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="vehicleType">Loại Xe</label>
                            <select class="form-control" id="vehicleType">
                                <option>Xe Hơi</option>
                                <option>Xe Máy</option>
                                <option>Xe Tải</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-3 align-self-end">
                        <button type="submit" class="btn btn-primary btn-block">Tìm kiếm</button>
                    </div>
                </div>
            </form>
        </div>

        <!-- Danh sách Bãi đậu xe -->
        <div class="parking-list">
            <!-- Mục Bãi đậu xe -->
            <div class="parking-item">
                <img src="img/parking1.jpg" alt="Bãi đậu xe 1">
                <div class="details">
                    <h5>Bãi đậu xe 1</h5>
                    <p>Chi tiết vị trí...</p>
                </div>
            </div>
            <!-- Mục Bãi đậu xe -->
            <div class="parking-item">
                <img src="img/parking2.jpg" alt="Bãi đậu xe 2">
                <div class="details">
                    <h5>Bãi đậu xe 2</h5>
                    <p>Chi tiết vị trí...</p>
                </div>
            </div>
            <!-- Mục Bãi đậu xe -->
            <div class="parking-item">
                <img src="img/parking3.jpg" alt="Bãi đậu xe 3">
                <div class="details">
                    <h5>Bãi đậu xe 3</h5>
                    <p>Chi tiết vị trí...</p>
                </div>
            </div>
            <!-- Thêm các mục Bãi đậu xe khác cần thiết -->
        </div>
    </div>
    <!-- Footer -->
    <div th:include="layout/footer :: footer"></div>
    <!-- Kết thúc Footer -->

    <!-- Bao gồm Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>
</html>
