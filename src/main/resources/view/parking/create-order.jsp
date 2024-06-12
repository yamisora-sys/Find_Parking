<!DOCTYPE html>
<html lang="en" layout:decorate="~{layout/home-layout}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt chỗ đậu xe</title>
    <link rel="stylesheet" th:href="@{/css/bootstrap.min.css}">
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
  <script th:src="@{/js/toastr.min.js}"></script>
  <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
    <script th:src="@{/js/bootstrap.bundle.min.js}"></script>
</head>

<body>
    <div layout:fragment="sections">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h1>Đặt chỗ đậu xe</h1>
                    <!-- set params to th:action for form -->
                    <form th:action="@{/parking/order/create}" method="post" th:object="${order}">
                        <!-- avalible slot -->
                        <div class="form-group">
                            <label for="slot">Số chỗ trống</label>
                            <input type="number" class="form-control" id="slot" name="slot" disabled
                                th:value="${parking.capacity} - ${usedSlot}">
                        </div>
                        <div class="form-group">
                            <label for="licensePlate">Biển số xe</label>
                            <input type="text" class="form-control" id="licensePlate" name="licensePlate" required
                                th:field="*{licensePlate}">
                        </div>
                        <div class="form-group">
                            <label for="parkingId">Tên bãi đỗ xe</label>
                            <input type="text" class="form-control" id="parkingName" disabled
                                th:value="${parking.name}">
                            <input type="hidden" class="form-control" id="parking" name="parking" 
                                th:value="${parking}" th:field="*{parking}">
                        </div>
                        <div class="form-group">
                            <label for="timeIn">Thời gian vào</label>
                            <input type="datetime-local" class="form-control" id="timeIn" name="timeIn" required
                                th:field="*{timeIn}">
                        </div>
                        <div class="form-group">
                            <label for="price">Giá tiền</label>
                            <input type="number" class="form-control" id="price" name="price" disabled
                                th:value="${parking.price}">
                        </div>
                        <button type="submit" class="btn btn-primary center">Đặt chỗ</button>
                    </form>
                </div>
            </div>
    </div>
</body>
</html>