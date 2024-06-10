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
      z-index: 10;
      color: #000000;
      height: 400px;
      width: 500px;
      border-radius: 10px;
      margin: auto auto;
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
            <button type="button" class="btn btn-primary mt-2" onclick="getCoordinates()">Lấy Tọa Độ</button>
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
    <script>
      let mapLatitude = 10.762622;
      let mapLongitude = 106.660172;
      mapboxgl.accessToken = 'pk.eyJ1IjoieWFtaXNvcmEiLCJhIjoiY2x4MDhsOXE2MGZlMDJtcHRmaWQxN20waSJ9.NYHCInPpPXOytI3kAe2OYQ';
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
        center: [mapLongitude, mapLatitude],
        zoom: 13
      });

      // Current location 
      if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
          var userLocation = [position.coords.longitude, position.coords.latitude];
          map.flyTo({center: userLocation, zoom: 15});

          new mapboxgl.Marker({color: "red"})
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
      // At low zooms, complete a revolution every two minutes.
      const secondsPerRevolution = 240;
      // Above zoom level 5, do not rotate.
      const maxSpinZoom = 5;
      // Rotate at intermediate speeds between zoom levels 3 and 5.
      const slowSpinZoom = 3;

      let userInteracting = false;
      const spinEnabled = true;

      function spinGlobe() {
        const zoom = map.getZoom();
        if (spinEnabled && !userInteracting && zoom < maxSpinZoom) {
          let distancePerSecond = 360 / secondsPerRevolution;
          if (zoom > slowSpinZoom) {
            // Slow spinning at higher zooms
            const zoomDif =
              (maxSpinZoom - zoom) / (maxSpinZoom - slowSpinZoom);
            distancePerSecond *= zoomDif;
          }
          const center = map.getCenter();
          center.lng -= distancePerSecond;
          // Smoothly animate the map over one second.
          // When this animation is complete, it calls a 'moveend' event.
          map.easeTo({center, duration: 1000, easing: (n) => n});
        }
      }

      // Pause spinning on interaction
      map.on('mousedown', () => {
        userInteracting = true;
      });
      map.on('dragstart', () => {
        userInteracting = true;
      });

      // When animation is complete, start spinning if there is no ongoing interaction
      map.on('moveend', () => {
        spinGlobe();
      });

      spinGlobe();

      async function getCoordinates() {
        const address = document.getElementById("address").value;
        const apiKey = '37115a7a77524c859abcd229d39a1b5b';
        const url = `https://api.opencagedata.com/geocode/v1/json?q=${encodeURIComponent(address)}&key=${apiKey}`;

        try {
          const response = await fetch(url);
          const data = await response.json();
          if (data.results.length > 0) {
            const latitude = data.results[0].geometry.lat;
            const longitude = data.results[0].geometry.lng;
            console.log(mapLatitude, mapLongitude);
            map.flyTo({center: [longitude, latitude], zoom: 15});
            new mapboxgl.Marker({color: "red"})
              .setLngLat([longitude, latitude])
              .addTo(map);
            // document.getElementById("result").innerHTML = `Latitude: ${latitude}, Longitude: ${longitude}`;
          } else {
            // document.getElementById("result").innerHTML = "Không tìm thấy tọa độ cho địa chỉ này.";
          }
        } catch (error) {
          // document.getElementById("result").innerHTML = "Có lỗi xảy ra khi lấy tọa độ.";
          console.error(error);
        }
      }
      // onchange event for address input
      document.getElementById("address").addEventListener("change", getCoordinates);
    </script>
  </div>
</body>

</html>