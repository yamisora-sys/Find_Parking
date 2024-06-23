<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>Maps</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
    <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">

    <link href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.1/mapbox-gl-directions.css'
        rel='stylesheet' />
    <script
        src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v4.1.1/mapbox-gl-directions.js'></script>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #map {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>

<body>
    <div id="map"></div>
    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoieWFtaXNvcmEiLCJhIjoiY2x4MDhsOXE2MGZlMDJtcHRmaWQxN20waSJ9.NYHCInPpPXOytI3kAe2OYQ';
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
            projection: 'globe', // Display the map as a globe, since satellite-v9 defaults to Mercator
            zoom: 1,
            center: [30, 15],
            pitch: 45, // Initial pitch in degrees
            bearing: 0 // Initial bearing in degrees
        });

        map.addControl(new mapboxgl.NavigationControl({showCompass: true}));
        map.scrollZoom.disable();

        map.on('style.load', () => {
            map.setFog({}); // Set the default atmosphere style

            // Add 3D terrain
            map.addSource('mapbox-dem', {
                'type': 'raster-dem',
                'url': 'mapbox://mapbox.mapbox-terrain-dem-v1',
                'tileSize': 512,
                'maxzoom': 14
            });
            map.setTerrain({'source': 'mapbox-dem', 'exaggeration': 1.5});

            // Add 3D buildings
            map.addLayer({
                'id': '3d-buildings',
                'source': 'composite',
                'source-layer': 'building',
                'filter': ['==', 'extrude', 'true'],
                'type': 'fill-extrusion',
                'minzoom': 15,
                'paint': {
                    'fill-extrusion-color': '#aaa',
                    'fill-extrusion-height': ['get', 'height'],
                    'fill-extrusion-base': ['get', 'min_height'],
                    'fill-extrusion-opacity': 0.6
                }
            });
        });

        // Calculate the distance between two coordinates using the Haversine formula
        function calculateDistance(coord1, coord2) {
            const toRad = (value) => (value * Math.PI) / 180;
            const R = 6371; // Radius of the Earth in kilometers
            const dLat = toRad(coord2.latitude - coord1.latitude);
            const dLng = toRad(coord2.longitude - coord1.longitude);
            const a =
                Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.cos(toRad(coord1.latitude)) * Math.cos(toRad(coord2.latitude)) *
                Math.sin(dLng / 2) * Math.sin(dLng / 2);
            const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            return R * c; // Distance in kilometers
        }

        let userLocation;
        let parkingMarkers = [];

        // Current location 
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                userLocation = {latitude: position.coords.latitude, longitude: position.coords.longitude};
                map.flyTo({center: [userLocation.longitude, userLocation.latitude], zoom: 15});

                new mapboxgl.Marker({color: "red"})
                    .setLngLat([userLocation.longitude, userLocation.latitude])
                    .addTo(map);

                if (parkingMarkers.length > 0) {
                    highlightClosestMarkers();
                }
            });
        }

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
                center.longitude -= distancePerSecond;
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

        // map.on('click', (e) => {
        //     console.log(e.lngLat);
        //     mapLatitude = e.lngLat.latitude;
        //     mapLongitude = e.lngLat.longitude;
        //     map.flyTo({center: [mapLongitude, mapLatitude], zoom: 13, pitch: 60, bearing: -60});
        //     // add maker
        //     new mapboxgl.Marker({color: "red"})
        //         .setLngLat([mapLongitude, mapLatitude])
        //         .addTo(map);
        //     // title for maker
        //     new mapboxgl.Popup()
        //         .setLngLat([mapLongitude, mapLatitude])
        //         .setHTML("<h1>Đây là vị trí bạn chọn</h1>")
        //         .addTo(map);
        // });

        // Thêm chỉ đường đến điểm gần nhất
        var directions = new MapboxDirections({
            accessToken: mapboxgl.accessToken,
            unit: 'metric',
            profile: 'mapbox/driving'
        });

        map.addControl(directions, 'top-left');

        // When animation is complete, start spinning if there is no ongoing interaction
        map.on('moveend', () => {
            spinGlobe();
        });

        spinGlobe();

        fetch("/parking/get-all")
            .then(response => response.json())
            .then(data => {
                data.forEach(parking => {
                    const marker = new mapboxgl.Marker({color: "blue"})
                        .setLngLat([parking.node.longitude, parking.node.latitude])
                        .addTo(map);

                    new mapboxgl.Popup()
                        .setLngLat([parking.node.longitude, parking.node.latitude])
                        .setHTML("<h2 id='parking-id-" + parking.id + "'>" + parking.name + "</h2>")
                        .addTo(map);

                    parkingMarkers.push({
                        id: parking.id,
                        name: parking.name,
                        coordinates: {latitude: parking.node.latitude, longitude: parking.node.longitude},
                        marker: marker
                    });

                    
                });

                if (userLocation) {
                    highlightClosestMarkers();
                }
            });

        function highlightClosestMarkers() {
            const distances = parkingMarkers.map(parking => {
                return {
                    ...parking,
                    distance: calculateDistance(userLocation, parking.coordinates)
                };
            });

            distances.sort((a, b) => a.distance - b.distance);

            const closestMarkers = distances.slice(0, 3);

            let alertMessage = "Ba vị trí đậu xe gần đây nhất:\n";
            closestMarkers.forEach(parking => {
                parking.marker.getElement().style.backgroundColor = "green"; // Change color to green for closest markers
                new mapboxgl.Popup()
                    .setLngLat([parking.coordinates.longitude, parking.coordinates.latitude])
                    .setHTML("<h2 id='parking-id-" + parking.id + "'>" + parking.name + "<br>Distance: " + parking.distance.toFixed(2) + " km</h2>")
                    .addTo(map);
                alertMessage += `${parking.name}: ${parking.distance.toFixed(2)} km\n`;
            });
            alert(alertMessage);
            console.log(userLocation);
            directions.setOrigin(userLocation);
            directions.setDestination(closestMarkers[0].coordinates);
            console.log(closestMarkers[0].coordinates);
        }

    </script>
</body>

</html>