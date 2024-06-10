<!DOCTYPE html>
<html layout:decorate="~{layout/home-layout}">

<head>
  <title th:text="${pageTitle}">Tìm Bãi Đậu Xe</title>
  <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <script th:src="@{/js/toastr.min.js}"></script>
  <script type="text/javascript" th:src="@{/js/popperjs.js}"></script>
  <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
  <link rel="stylesheet" th:href="@{/css/screen/index.css}">
  <script th:src="@{/js/bootstrap.bundle.min.js}"></script>
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

  <!-- Banner -->
  <div layout:fragment="sections">
    <div class="banner">
      <h1>Tìm Bãi Đậu Xe</h1>
      <!-- Phần Tìm kiếm trong Banner -->
      <div class="search-section">
        <form>
          <div class="row">
            <div class="col-md-3">
              <div class="form-group">
                <label for="address">Nhập địa chỉ:</label>
                <input style="padding-bottom: 14px" type="text" class="form-control" id="location" placeholder="Nhập địa điểm">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="checkin">Thời gian Check-in</label>
                <input type="date" class="form-control" id="checkin">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="checkout">Thời gian Check-out</label>
                <input type="date" class="form-control" id="checkout">
              </div>
            </div>
            <div class="col-md-3">
              <div class="form-group">
                <label for="vehicleType">Loại Xe</label>
                <select style="padding-bottom: 14px" class="form-control" id="vehicleType">
                  <option>Xe Hơi</option>
                  <option>Xe Máy</option>
                  <option>Xe Tải</option>
                </select>
              </div>
            </div>

          </div>
          <div class="row align-self-center" style="margin-top: 10px">
            <div class="col">
              <button type="submit" class="btn btn-primary btn-block">Tìm kiếm</button>
            </div>
          </div>
        </form>
      </div>
    </div>

    <!-- Nội dung chính -->
    <div class="container">
      <div class="parking-list">
        <!-- Mục Bãi đậu xe -->
        <div class="parking-item" th:each="parking : ${parkings}">
          <img th:src="${parking.image}" alt="Bãi đậu xe">
          <div class="details">
            <h5 th:text="${parking.name}"></h5>
            <p th:text="${parking.description}"></p>
            <a th:href="@{/park/detail(id=${parking.id})}"><button type="button" class="btn btn-primary">Chi tiết</button></a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bao gồm Bootstrap JS -->
  <script type="text/javascript" th:src="@{/js/popperjs.js}"></script>
</body>

</html>