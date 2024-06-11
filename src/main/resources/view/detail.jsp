<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tìm Bãi Đậu Xe</title>
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <link rel="stylesheet" th:href="@{/css/screen/index.css}">
  <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
  <style>
    /* Custom CSS */
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

    .error-message {
      color: red;
      display: none;
    }
  </style>
</head>

<body>
  <div th:include="layout/header :: header"></div>

  <div class="container">
    <img th:src="${parking.image}" alt="Chỗ đậu xe" class="parking-image">

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
          <label for="parking-description">Giới thiệu</label>
          <input type="text" class="form-control" id="parking-description" th:value="${parking.description}" disabled>
        </div>
        <div class="form-group">
          <label for="opening-hours">Giờ mở cửa</label>
          <input type="text" class="form-control" id="opening-hours" value="8:00 - 22:00" disabled>
        </div>
        <div class="form-group">
          <label for="license-plate">Biển số xe</label>
          <input type="text" class="form-control" id="license-plate">
          <span class="error-message" id="license-plate-error">Vui lòng nhập biển số xe.</span>
        </div>
        <div class="form-group">
          <label for="parking-duration">Thời gian đậu xe (giờ)</label>
          <input type="number" class="form-control" id="parking-duration">
          <span class="error-message" id="parking-duration-error">Vui lòng nhập thời gian đậu xe hợp lệ.</span>
        </div>
        <div class="form-group">
          <label for="parking-rate">Giá giữ xe mỗi giờ</label>
          <div class="input-group">
            <input type="number" class="form-control" id="parking-rate" th:value="${parking.price}">
            <div class="input-group-append">
              <span class="input-group-text">VNĐ</span>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label for="payment-method">Hình thức thanh toán</label>
          <select class="form-control" id="payment-method">
            <option value="">Chọn hình thức thanh toán</option>
            <option value="Tiền mặt">Tiền mặt</option>
            <option value="Thẻ ngân hàng">Thẻ ngân hàng</option>
            <option value="Ví điện tử">Ví điện tử</option>
          </select>
          <span class="error-message" id="payment-method-error">Vui lòng chọn hình thức thanh toán.</span>
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
        <button type="button" class="btn btn-primary" onclick="validateAndPay()">Thanh toán</button>
      </div>
    </div>
  </div>

  <!-- Payment Success Modal -->
  <div class="modal fade" id="paymentSuccessModal" tabindex="-1" role="dialog" aria-labelledby="paymentSuccessModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="paymentSuccessModalLabel">Thanh toán thành công</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Thanh toán của bạn đã được xử lý thành công!</p>
          <p><strong>Biển số xe:</strong> <span id="confirm-license-plate"></span></p>
          <p><strong>Thời gian đậu xe:</strong> <span id="confirm-parking-duration"></span> giờ</p>
          <p><strong>Tổng tiền:</strong> <span id="confirm-total-amount"></span> VNĐ</p>
          <p><strong>Hình thức thanh toán:</strong> <span id="confirm-payment-method"></span></p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        </div>
      </div>
    </div>
  </div>
  <div th:include="layout/footer :: footer"></div>


  <!-- Include Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://kit.fontawesome.com/a076d05399.js"></script>
  <script src="js/toastr.min.js"></script>
  <script>
    // Function to calculate total amount
    function calculateTotal() {
      var duration = parseInt(document.getElementById("parking-duration").value);
      var rate = parseInt(document.getElementById("parking-rate").value);
      var total = duration * rate;
      document.getElementById("total-amount").value = total.toLocaleString();
    }

    // Function to validate form fields and proceed with payment
    function validateAndPay() {
      var licensePlate = document.getElementById("license-plate").value;
      var duration = document.getElementById("parking-duration").value;
      var paymentMethod = document.getElementById("payment-method").value;
      var isValid = true;

      // Reset error messages
      document.getElementById("license-plate-error").style.display = 'none';
      document.getElementById("parking-duration-error").style.display = 'none';
      document.getElementById("payment-method-error").style.display = 'none';

      // Validate license plate
      if (!licensePlate) {
        document.getElementById("license-plate-error").style.display = 'block';
        isValid = false;
      }

      // Validate parking duration
      if (!duration || duration <= 0) {
        document.getElementById("parking-duration-error").style.display = 'block';
        isValid = false;
      }

      // Validate payment method
      if (!paymentMethod) {
        document.getElementById("payment-method-error").style.display = 'block';
        isValid = false;
      }

      if (!isValid) {
        return;
      }

      calculateTotal();
      showPaymentSuccess();
    }

    // Function to show payment success modal with details
    function showPaymentSuccess() {
      var licensePlate = document.getElementById("license-plate").value;
      var duration = document.getElementById("parking-duration").value;
      var totalAmount = document.getElementById("total-amount").value;
      var paymentMethod = document.getElementById("payment-method").value;

      document.getElementById("confirm-license-plate").innerText = licensePlate;
      document.getElementById("confirm-parking-duration").innerText = duration;
      document.getElementById("confirm-total-amount").innerText = totalAmount;
      document.getElementById("confirm-payment-method").innerText = paymentMethod;

      $('#paymentSuccessModal').modal('show');
    }
  </script>
</body>

</html>
