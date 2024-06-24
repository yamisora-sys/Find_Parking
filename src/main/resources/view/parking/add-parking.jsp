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

    #map2{
      z-index: 10;
      color: #000000;
      height: 100%;
      width: 100%;
      border-radius: 10px;
      margin: auto auto;
    }

    .area-maker{
      width: 40px;
      height: 40px;
    }
  </style>
</head>

<body>
  <!-- Main Content -->
  <div layout:fragment="sections" class="container mt-5">
    <div class="form-container">
      <h2 class="text-center mb-4">Thêm Mới Bãi Đỗ Xe</h2>
      <form id="addParkingForm" method="post" action="#" th:object="${newparking}" th:action="@{/parking/create}"
        enctype="multipart/form-data">
        <!-- ownerId = auth.id -->
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="name" class="form-label">Tên Bãi Đỗ Xe</label>
            <input type="text" class="form-control" id="name" name="name" required th:field="*{name}">

          </div>
          <div class="col-md-6 form-group">
            <label for="address" class="form-label">Địa Chỉ</label>
            <input type="text" class="form-control" id="address" name="address" required th:field="*{address}">
            <button type="button" class="btn btn-primary mt-2" onclick="getCoordinates()">Lấy Tọa Độ</button>
            <!-- button display popup -->
            <button type="button" class="btn btn-primary mt-2" data-bs-toggle="modal" data-bs-target="#exampleModal">
              Vẽ Bãi Đỗ Xe Trên Bản Đồ
            </button>
            <!-- popup -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-fullscreen">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">
                      Vẽ Bãi Đỗ Xe
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div id="map2" class="overflow-visible"></div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="onSaveArea()">Save changes</button>
                  </div>
                </div>
              </div>
            </div>

            <!-- longitude -->
            <input type="string" id="longitude" name="longitude" th:field="*{longitude}" required hidden>
            <!-- latitude -->
            <input type="string" id="latitude" name="latitude" th:field="*{latitude}" required hidden>

            <!-- input type = array -->
            <input type="string" id="coordinates" name="coordinates" th:field="*{coordinates}" required hidden>
            <!-- <div id="coordinates">

            </div> -->
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="price" class="form-label">Giá</label>
            <input type="text" class="form-control" id="price" name="price" required th:field="*{price}">
          </div>
          <div class="col-md-6 form-group">
            <label for="unitPrice" class="form-label">Đơn Vị Giá</label>
            <select class="form-control" id="unitPrice" name="unitPrice" required th:field="*{unitPrice}">
              <option value="1 giờ">1 giờ</option>
              <option value="1 lần">1 lần</option>
          </div>
          </select>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="description" class="form-label">Mô Tả</label>
            <textarea class="form-control" id="description" name="description" rows="3" required
              th:field="*{description}"></textarea>
          </div>
          <div class="col-md-6 form-group">
            <label for="phone" class="form-label">Số Điện Thoại</label>
            <input type="text" class="form-control" id="phone" name="phone" required th:field="*{phone}">
          </div>
        </div>153
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="categories" class="form-label">Danh Mục</label>
            <select multiple class="form-control" id="categories" name="categories" required>
              <option th:each="category : ${parkingCategories}" th:value="${category.id}" th:text="${category.name}">
              </option>
            </select>
          </div>
          <div class="col-md-6 form-group">
            <label for="capacity" class="form-label">Sức Chứa</label>
            <input type="number" class="form-control" id="capacity" name="capacity" required th:field="*{capacity}">
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-6 form-group">
            <label for="image" class="form-label">Ảnh</label>
            <input type="text" class="form-control" id="image" name="image" required th:field="*{image}">
          </div>
          <div class="col-md-6 form-group">
            <label for="status" class="form-label">Trạng Thái</label>
            <input type="text" class="form-control" id="status" name="status" required th:field="*{status}">
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
      const map2 = new mapboxgl.Map({
        container: 'map2',
        style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
        center: [mapLongitude, mapLatitude],
        zoom: 13,
      });
      var parking_coordinates = [];
      map2.on('click', function (e) {
        parking_coordinates.push(e.lngLat);
        // custom marker
        var el = document.createElement('img');
        el.className = 'area-maker';
        el.src = 'https://icons.veryicon.com/png/o/miscellaneous/easy-to-reconcile-icon/point-selection.png';
        new mapboxgl.Marker(el)
          .setLngLat([e.lngLat.lng, e.lngLat.lat])
          .addTo(map2);
      });
      // cho phep nguoi dung danh dau bai gui xe tren ban do
      map.on('click', (e) => {
        console.log(e.lngLat);
        mapLatitude = e.lngLat.lat;
        mapLongitude = e.lngLat.lng;
        document.getElementById("latitude").value = mapLatitude;
        document.getElementById("longitude").value = mapLongitude;
        // clear all markers
        document.querySelectorAll('.mapboxgl-marker').forEach(marker => marker.remove());
        map2.flyTo({center: [mapLongitude, mapLatitude], zoom: 15});
        new mapboxgl.Marker({color: "red"})
          .setLngLat([mapLongitude, mapLatitude])
          .addTo(map);
        new mapboxgl.Marker({color: "red"})
          .setLngLat([mapLongitude, mapLatitude])
          .addTo(map2);
      });



      function clearArea() {
        parking_coordinates = [];
        document.getElementById("coordinates").value = "";
        map2.getSource('parking-area').setData({
          type: 'Feature',
          geometry: {
            type: 'Polygon',
            coordinates: []
          }
        });
        map.getSource('parking-area').setData({
          type: 'Feature',
          geometry: {
            type: 'Polygon',
            coordinates: []
          }
        });
        // remove all markers on map2
        document.querySelectorAll('.mapboxgl-marker').forEach(marker => marker.remove());
      }

      // add button to map2
      const clearButton = document.createElement('button');
      clearButton.textContent = 'Xoá Bãi Đỗ Xe';  
      clearButton.style.position = 'absolute';
      clearButton.style.top = '10px';
      clearButton.style.left = '10px';
      clearButton.style.zIndex = '10';
      clearButton.addEventListener('click', clearArea);
      map2.getCanvas().parentNode.appendChild(clearButton);
      
      // save parking area to input
      // set source for layer
      var parkingArea = {
        type: 'FeatureCollection',
        features: [{
          type: 'Feature',
          geometry: {
            type: 'Polygon',
            coordinates: []
          }
        }]
      };

      map2.on('load', function () {
        map2.addSource('parking-area', {
          type: 'geojson',
          data: parkingArea
        });
        map2.addLayer({
          id: 'parking-area',
          type: 'fill',
          source: 'parking-area',
          layout: {},
          paint: {
            'fill-color': '#088',
            'fill-opacity': 0.8
          }
        });
      });

      map.on('load', function () {
        map.addSource('parking-area', {
          type: 'geojson',
          data: parkingArea
        });
        map.addLayer({
          id: 'parking-area',
          type: 'fill',
          source: 'parking-area',
          layout: {},
          paint: {
            'fill-color': '#088',
            'fill-opacity': 0.8
          }
        });
      });


      function onSaveArea() {
        let coordinates = JSON.stringify(parking_coordinates);
        document.getElementById("coordinates").value = coordinates;
        console.log(coordinates);
        // create layer
        // edit coordinates
        var newcoordinates = parking_coordinates.map(function (point) {
          return [point.lng, point.lat];
        });
        map.getSource('parking-area').setData({
          type: 'Feature',
          geometry: {
            type: 'Polygon',
            coordinates: [newcoordinates]
          }
        });
        map2.getSource('parking-area').setData({
          type: 'Feature',
          geometry: {
            type: 'Polygon',
            coordinates: [newcoordinates]
          }
        });
        
        console.log("Save Area");
      }

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
            map2.flyTo({center: [longitude, latitude], zoom: 15});
            // clear all markers
            document.querySelectorAll('.mapboxgl-marker').forEach(marker => marker.remove());
            new mapboxgl.Marker({color: "red"})
              .setLngLat([longitude, latitude])
              .addTo(map)
              .addTo(map2);
            // set input value
            document.getElementById("latitude").value = latitude;
            document.getElementById("longitude").value = longitude;
          } else {
            // document.getElementById("result").innerHTML = "Không tìm thấy tọa độ cho địa chỉ này.";
          }
        } catch (error) {
          // document.getElementById("result").innerHTML = "Có lỗi xảy ra khi lấy tọa độ.";
          console.error(error);
        }
      }
      document.getElementById("address").addEventListener("keypress", function (e) {
        if (e.key === 'Enter') {
          getCoordinates();
        }
      });
    </script>
  </div>
</body>

</html>