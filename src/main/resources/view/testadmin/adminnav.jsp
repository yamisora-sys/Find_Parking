<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> -->
  <link rel="stylesheet" href="css/admin/adnav.css">
</head>

<body>
  <div th:fragment="adminnav">
    <div class="sidebar p-4" style="background-color: #343a40">
      <h3 class="text-white">Admin Dashboard</h3>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a class="nav-link" href="/testadmin"><i class="bi bi-speedometer2"></i> Bảng điều khiển chính</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/testadminpark"><i class="bi bi-map"></i> Quản lý bãi giữ xe</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-bookmark-check"></i> Quản lý đặt chỗ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-people"></i> Quản lý người dùng</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-currency-dollar"></i> Quản lý doanh thu</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/adminsupport"><i class="bi bi-chat-dots"></i> Phản hồi & Hỗ trợ</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="bi bi-gear"></i> Cài đặt hệ thống</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/adminreport"><i class="bi bi-bar-chart"></i> Báo cáo & Phân tích</a>
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