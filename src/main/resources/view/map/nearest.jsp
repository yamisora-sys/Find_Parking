<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Display nearest</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href='https://api.mapbox.com/mapbox-gl-js/v2.7.0/mapbox-gl.css' rel='stylesheet' />
    <link href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.1/mapbox-gl-directions.css' rel='stylesheet' />
    <style>
        body { margin: 0; padding: 0; }
        #map { position: absolute; top: 0; bottom: 0; width: 100%; }
    </style>
</head>
<body>
    <div id='map'></div>
    <script src='https://api.mapbox.com/mapbox-gl-js/v2.7.0/mapbox-gl.js'></script>
    <script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.1/mapbox-gl-directions.js'></script>
    <script src='https://unpkg.com/@turf/turf@6/turf.min.js'></script>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoibGFtZG8xMSIsImEiOiJjbHgwN3hoMDcwZzJzMmtxMHhseXpkaTA4In0.k2LXdcNHw5n1OASvF3tSkw';
        var map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/mapbox/streets-v11',
            center: [106.660172, 10.762622], 
            zoom: 10
        });

        // Danh sách các điểm đánh dấu
        var markers = [
            { coordinates: [106.6992, 10.7798], name: "Nhà thờ Đức Bà" },
            { coordinates: [106.6983, 10.7721], name: "Chợ Bến Thành" },
            { coordinates: [106.7048, 10.7734], name: "Phố đi bộ Nguyễn Huệ" }
        ];

        // Lưu trữ các marker và popup để có thể thay đổi tên sau này
        var markerElements = [];

        // Thêm các marker vào bản đồ
        markers.forEach(function(marker) {
            var popup = new mapboxgl.Popup().setText(marker.name);
            var markerElement = new mapboxgl.Marker()
                .setLngLat(marker.coordinates)
                .setPopup(popup)
                .addTo(map);
            markerElements.push({ marker: markerElement, popup: popup });
        });

        // Sử dụng vị trí thực tế
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var userLocation = [position.coords.longitude, position.coords.latitude];
                map.flyTo({ center: userLocation, zoom: 15 });

                new mapboxgl.Marker({ color: "red" })
                    .setLngLat(userLocation)
                    .addTo(map);

                // Tính khoảng cách và tìm điểm gần nhất
                var minDistance = Infinity;
                var nearestMarker = null;

                markers.forEach(function(marker) {
                    var distance = turf.distance(turf.point(userLocation), turf.point(marker.coordinates), { units: 'kilometers' });
                    if (distance < minDistance) {
                        minDistance = distance;
                        nearestMarker = marker;
                    }
                });

                // Hiển thị điểm gần nhất và thay đổi tên hiển thị
                if (nearestMarker) {
                    console.log("Điểm gần nhất: " + nearestMarker.name + " (" + minDistance.toFixed(2) + " km)");
                    alert("Điểm gần nhất: " + nearestMarker.name + " (" + minDistance.toFixed(2) + " km)");

                    // Thay đổi tên hiển thị của điểm gần nhất
                    var newName = "Điểm gần nhất: " + nearestMarker.name;
                    var nearestMarkerElement = markerElements.find(el => el.marker.getLngLat().equals(nearestMarker.coordinates));
                    if (nearestMarkerElement) {
                        nearestMarkerElement.popup.setText(newName);
                        nearestMarkerElement.marker.setPopup(nearestMarkerElement.popup);
                    }
                }
            });
        }

        // Thêm chỉ đường đến điểm gần nhất
        var directions = new MapboxDirections({
                        accessToken: mapboxgl.accessToken,
                        unit: 'metric',
                        profile: 'mapbox/driving'
                    });

                    map.addControl(directions, 'top-left');

                    directions.setOrigin(userLocation);
                    directions.setDestination(nearestMarker.coordinates);
    </script>
</body>
</html>
