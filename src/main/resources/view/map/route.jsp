<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Display navigation directions</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
    <style>
        body { margin: 0; padding: 0; }
        #map { position: absolute; top: 0; bottom: 0; width: 100%; }
    </style>
</head>
<body>
    <script src="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.3.1/mapbox-gl-directions.js"></script>
    <link rel="stylesheet" href="https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.3.1/mapbox-gl-directions.css" type="text/css">
    <div id="map"></div>

    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoibGFtZG8xMSIsImEiOiJjbHgwN3hoMDcwZzJzMmtxMHhseXpkaTA4In0.k2LXdcNHw5n1OASvF3tSkw';
        const map = new mapboxgl.Map({
            container: 'map',
            // Choose from Mapbox's core styles, or make your own style with Mapbox Studio
            style: 'mapbox://styles/mapbox/streets-v12',
            center: [106.660172, 10.762622],
            zoom: 13
        });

        // Lấy vị trí hiện tại của người dùng
        navigator.geolocation.getCurrentPosition(function (position) {
            var userLocation = [position.coords.longitude, position.coords.latitude];
            map.flyTo({ center: userLocation, zoom: 15 });

            new mapboxgl.Marker({ color: "red" })
                .setLngLat(userLocation)
                .addTo(map);

            // Lấy tham số latitude và longitude từ URL
            const urlParams = new URLSearchParams(window.location.search);
            const lat = parseFloat(urlParams.get('latitude'));
            const lng = parseFloat(urlParams.get('longitude'));
            //hiển thị vị trí với marker màu xanh
            new mapboxgl.Marker({ color: "blue" })
                .setLngLat([lng, lat])
                .addTo(map);

            // Hiển thị chỉ đường từ vị trí hiện tại của người dùng tới vị trí được chỉ định
            map.addControl(
                new MapboxDirections({
                    accessToken: mapboxgl.accessToken,
                    destination: [lng, lat], // Điểm đích là vị trí được chỉ định từ tham số
                    origin: userLocation, // Điểm xuất phát là vị trí hiện tại của người dùng
                    unit: 'metric',
                    profile: 'mapbox/driving-traffic',
                    alternatives: true
                }),
                'top-left'
            );
        });
    </script>

</body>
</html>
