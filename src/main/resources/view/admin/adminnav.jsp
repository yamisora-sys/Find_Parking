<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.6.0/mdb.min.css" integrity="sha512-mQOTNh8gK8SmdDjvmFZKzrOZY7rG3ZmxOU78phd8zqlx1c9zJ7A9RjW8h1gdv8SQE6cRcBw5X3p1K5qX0MszjQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
    .sidebar {
      height: 100vh;
      position: fixed;
      top: 0;
      left: 0;
      padding-top: 20px;
      background-color: #4e73df;
      color: #fff;
    }

    .sidebar h3 {
      text-align: center;
      padding-bottom: 20px;
      font-weight: bold;
      width: 100%;
    }

    .nav-link {
      color: white;
      padding: 15px 20px;
      margin: 5px 10px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .nav-link:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    .nav-link i {
      margin-right: 10px;
    }

    .nav-item {
      margin-bottom: 10px;
    }
  </style>
</head>

<body>
  <div th:fragment="adminnav">
    <div class="sidebar">
      <h3 class="text-white">Admin Dashboard</h3>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link" href="/admin/index"><i class="bi bi-speedometer2"></i> Bảng điều khiển chính</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/parking-manger"><i class="bi bi-map"></i> Quản lý bãi giữ xe</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminuser"><i class="bi bi-people"></i> Quản lý người dùng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/role-permission"><i class="bi bi-person-badge"></i> Quản lý vai trò</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-currency-dollar"></i> Quản lý doanh thu</a>
        </li> -->
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminsupport"><i class="bi bi-chat-dots"></i> Phản hồi & Hỗ trợ</a>
        </li>
        <!-- <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-gear"></i> Cài đặt hệ thống</a>
        </li>  -->
        <li class="nav-item">
          <a class="nav-link" href="/admin/adminreport"><i class="bi bi-bar-chart"></i> Báo cáo & Phân tích</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/admin/verify-parking-detail"><i class="bi bi-gear"></i>Các địa điểm chờ duyệt</a>
        </li>
      </ul>
    </div>
  </div>
  <!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
</body>

</html>
