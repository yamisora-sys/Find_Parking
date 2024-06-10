<!DOCTYPE html>
<html layout:decorate="~{layout/home-layout}">
<head>
  <title>Thêm Mới Bãi Đỗ Xe</title>
  <meta charset="utf-8">
  <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
  <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
  <link rel="stylesheet" th:href="@{/css/toastr.min.css}">
  <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">
  <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
  <script th:src="@{/js/jquery-3.7.1.min.js}"></script>
  <script th:src="@{/js/toastr.min.js}"></script>
  <script th:src="@{/js/bootstrap.bundle.min.js}"></script>
  <style>
    .form-container {
      max-width: 800px;
      margin: 0 auto;
      padding: 20px;
      background-color: #f8f9fa;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    #map {
      z-index: 1000;
      color: #000000;
      margin-top: 20px;
      height: 400px;
      width: 100%;
      border-radius: 10px;
    }
  </style>
</head>
<body>
  <!-- Main Content -->
  <div layout:fragment="sections" class="container mt-5">
    <div class="form-container">
      <h2 class="text-center mb-4">Thêm Mới Bãi Đỗ Xe</h2>
      <form id="addParkingForm" method="post" action="#">
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="name" class="form-label">Tên Bãi Đỗ Xe</label>
            <input type="text" class="form-control" id="name" name="name" required>
          </div>
          <div class="col-md-6 form-group">
            <label for="address" class="form-label">Địa Chỉ</label>
            <input type="text" class="form-control" id="address" name="address" required>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="price" class="form-label">Giá</label>
            <input type="text" class="form-control" id="price" name="price" required>
          </div>
          <div class="col-md-6 form-group">
            <label for="unitPrice" class="form-label">Đơn Vị Giá</label>
            <input type="text" class="form-control" id="unitPrice" name="unitPrice">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="description" class="form-label">Mô Tả</label>
            <textarea class="form-control" id="description" name="description" rows="3" required></textarea>
          </div>
          <div class="col-md-6 form-group">
            <label for="phone" class="form-label">Số Điện Thoại</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="categories" class="form-label">Danh Mục</label>
            <select multiple class="form-control" id="categories" name="categories">
              <option value="1">Xe Hơi</option>
              <option value="2">Xe Máy</option>
              <option value="3">Xe Tải</option>
            </select>
          </div>
          <div class="col-md-6 form-group">
            <label for="capacity" class="form-label">Sức Chứa</label>
            <input type="number" class="form-control" id="capacity" name="capacity" required>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="image" class="form-label">Ảnh</label>
            <input type="file" class="form-control" id="image" name="image" required>
          </div>
          <div class="col-md-6 form-group">
            <label for="status" class="form-label">Trạng Thái</label>
            <input type="text" class="form-control" id="status" name="status" required>
          </div>
        </div>
        <div id="map"></div>
        <div class="text-center mt-3">
          <button type="submit" class="btn btn-primary">Thêm Bãi Đỗ Xe</button>
        </div>
      </form>
    </div>
  </div>

  <script>
    mapboxgl.accessToken = 'pk.eyJ1IjoibGFtZG8xMSIsImEiOiJjbHgwN3hoMDcwZzJzMmtxMHhseXpkaTA4In0.k2LXdcNHw5n1OASvF3tSkw';
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
      center: [106.660172, 10.762622],
      zoom: 13
    });

    // Current location 
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function (position) {
        var userLocation = [position.coords.longitude, position.coords.latitude];
        map.flyTo({ center: userLocation, zoom: 15 });

        new mapboxgl.Marker({ color: "red" })
          .setLngLat(userLocation)
          .addTo(map);
      });
    }

    map.addControl(
      new MapboxDirections({
        accessToken: mapboxgl.accessToken
      }),
      'top-left'
    );
  </script>
</body>
</html>
