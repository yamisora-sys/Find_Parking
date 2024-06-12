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
</head>

<body>
    <div layout:fragment="sections">
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h1>Đặt chỗ đậu xe</h1>
                    <form th:action="@{/parking-order/create}" method="post" th:object="${order}">
                        <div class="form-group">
                            <label for="licensePlate">Biển số xe</label>
                            <input type="text" class="form-control" id="licensePlate" name="licensePlate" required
                                th:field="*{licensePlate}">
                        </div>
                        <div class="form-group">
                            <label for="parkingId">Tên bãi đỗ xe</label>
                            <input type="text" class="form-control" id="parkingName" disabled
                                th:value="${parking.name}">
                            <input id="parking" th:field="*{parking}" th:value="${parking}" hidden>
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
                        <button type="submit" class="btn btn-primary">Đặt chỗ</button>
                    </form>
                </div>
            </div>
    </div>
</body>
</html>