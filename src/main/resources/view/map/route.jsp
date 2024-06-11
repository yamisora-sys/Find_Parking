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
        mapboxgl.accessToken = 'pk.eyJ1IjoieWFtaXNvcmEiLCJhIjoiY2x4MDhsOXE2MGZlMDJtcHRmaWQxN20waSJ9.NYHCInPpPXOytI3kAe2OYQ';
    const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
        projection: 'globe', // Display the map as a globe, since satellite-v9 defaults to Mercator
        zoom: 1,
        center: [30, 15]
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
        parking_data_api = "/parking/get-all"
    fetch(parking_data_api)
        .then(response => response.json())
        .then(data => {
            data.forEach(parking => {
                new mapboxgl.Marker({ color: "blue" })
                    .setLngLat([parking.node.longitude, parking.node.latitude])
                    .addTo(map);
                    // set popup for marker
                new mapboxgl.Popup()
                    .setLngLat([parking.node.longitude, parking.node.latitude])
                    // h2 id=parking-id-parking.id
                    .setHTML("<h2 id=parking-id-"+parking.id+">"+parking.name+"</h2>")
                    .addTo(map);
                // on click popup
                document.getElementById("parking-id-"+parking.id).addEventListener("click", function() {
                    // show parking detail
                    
                });
            });
        });
    </script>

</body>
</html>
