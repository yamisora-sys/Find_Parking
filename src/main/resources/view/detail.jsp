<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tìm Bãi Đậu Xe</title>
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <link rel="stylesheet" th:href="@{/css/screen/index.css}">
  <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
  <style>
    /* CSS tùy chỉnh */
    .parking-image {
      max-width: 80%;
      height: auto;
      margin-bottom: 20px;
      display: block;
      margin-left: auto;
      margin-right: auto;
    }

    .modal-content {
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .modal-header {
      background-color: #007bff;
      color: white;
      border-top-left-radius: 10px;
      border-top-right-radius: 10px;
    }

    .modal-title {
      margin: 0 auto;
    }

    .form-group label {
      font-weight: bold;
    }

    .input-group-text {
      background-color: #007bff;
      color: white;
    }

    .btn-primary {
      background-color: #007bff;
      border: none;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }

    .btn-secondary {
      border: none;
    }
  </style>
</head>

<body>
  <div th:include="layout/header :: header"></div>

  <div class="container">
    <img src="img/baidauxe.webp" alt="Chỗ đậu xe" class="parking-image">

    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="parking-details-modal-label">Chi tiết bãi đậu xe</h5>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <label for="parking-status">Trạng thái</label>
          <input type="text" class="form-control" id="parking-status" value="20/25 (Còn chỗ)" disabled>
        </div>
        <div class="form-group">
          <label for="opening-hours">Giờ mở cửa</label>
          <input type="text" class="form-control" id="opening-hours" value="8:00 - 22:00" disabled>
        </div>
        <div class="form-group">
          <label for="license-plate">Biển số xe</label>
          <input type="text" class="form-control" id="license-plate">
        </div>
        <div class="form-group">
          <label for="parking-duration">Thời gian đậu xe (giờ)</label>
          <input type="number" class="form-control" id="parking-duration">
        </div>
        <div class="form-group">
          <label for="parking-rate">Giá giữ xe mỗi giờ</label>
          <div class="input-group">
            <input type="number" class="form-control" id="parking-rate" th:value=${parking.price}>
            <div class="input-group-append">
              <span class="input-group-text">VNĐ</span>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="payment-method">Hình thức thanh toán</label>
          <select class="form-control" id="payment-method">
            <option>Tiền mặt</option>
            <option>Thẻ ngân hàng</option>
            <option>Ví điện tử</option>
          </select>
        </div>
        <div class="form-group">
          <label for="total-amount">Tổng tiền</label>
          <div class="input-group">
            <input type="text" class="form-control" id="total-amount" readonly>
            <div class="input-group-append">
              <span class="input-group-text">VNĐ</span>
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        <button type="button" class="btn btn-primary" onclick="calculateTotal()">Thanh toán</button>
      </div>
    </div>
  </div>

  <div th:include="layout/footer :: footer"></div>

  <!-- Bao gồm Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="js/toastr.min.js"></script>
  <script>
    // Hàm tính tổng tiền
    function calculateTotal() {
      var duration = parseInt(document.getElementById("parking-duration").value);
      var rate = parseInt(document.getElementById("parking-rate").value);
      var total = duration * rate;
      document.getElementById("total-amount").value = total.toLocaleString();
    }
  </script>
</body>

</html>