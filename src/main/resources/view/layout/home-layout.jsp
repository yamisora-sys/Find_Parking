<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">

<head>
  <title th:text="${pageTitle}">Tìm Bãi Đậu Xe</title>
  <script type="text/javascript" th:src="@{/js/jquery-3.7.1.min.js}"></script>
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <script type="text/javascript" th:src="@{/js/toastr.min.js}"></script>
  <script type="text/javascript" th:src="@{/js/popperjs.js}"></script>
  <link rel="stylesheet" th:href="@{/css/bootstrap.min.css}">
  <link rel="stylesheet" th:href="@{/css/screen/index.css}">
  <link rel="stylesheet" th:href="@{/css/fontawesome.all.min.css}">
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
  <!-- <script src="https://kit.fontawesome.com/a076d05399.js"></script> -->
</body>
</html>