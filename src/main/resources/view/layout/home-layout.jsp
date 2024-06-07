<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">

<head>
  <title th:text="${pageTitle}">Tìm Bãi Đậu Xe</title>
  <script src="js/jquery-3.7.1.min.js"></script>
  <link rel="stylesheet" href="css/toastr.min.css">
  <script src="js/toastr.min.js"></script>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/screen/index.css">
  <style>
    .banner {
      background-image: url('img/baidauxe.webp');
      background-size: cover;
      background-position: center;
      padding: 60px 20px;
      border-radius: 10px;
      color: #ffffff;
      text-align: center;
      margin-bottom: 30px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
  </style>
</head>

<body>
  <!-- Header -->
  <div th:include="~{layout/header :: header}"></div>
  <!-- Kết thúc Header -->

  <!-- body -->
  <div class="container" layout:fragment="sections">
    
  </div>

  <!-- Footer -->
  <div th:include="~{layout/footer :: footer}"></div>
  <!-- Kết thúc Footer -->

  <!-- Bao gồm Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</body>

</html>