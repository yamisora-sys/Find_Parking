<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
    <script type="text/javascript" th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script type="text/javascript" th:src="@{/js/popperjs.js}"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
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
    <div>
        <div id="map"></div>
        <div th:each="parking : ${parkings}">
            <div th:attr="id='parking-model-' + ${parking.id}"
            class="modal fade" tabindex="-1" role="dialog" aria-labelledby="parking-modal-label"
            aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="parking-modal-label" th:text="${parking.name}"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body
                    ">
                        <p th:text="${parking.address}"></p>
                        <p th:text="${parking.price}"></p>
                        <p th:text="${parking.unitPrice}"></p>
                        <p th:text="${parking.description}"></p>
                        <p th:text="${parking.status}"></p>
                    </div>
                </div>
            </div>
            </div>

            <script>
                mapboxgl.accessToken = 'pk.eyJ1IjoieWFtaXNvcmEiLCJhIjoiY2x4MDhsOXE2MGZlMDJtcHRmaWQxN20waSJ9.NYHCInPpPXOytI3kAe2OYQ';
                const map = new mapboxgl.Map({
                    container: 'map',
                    style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
                    projection: 'globe', // Display the map as a globe, since satellite-v9 defaults to Mercator
                    zoom: 1,
                    center: [30, 15]
                });

                map.addControl(new mapboxgl.NavigationControl());
                map.scrollZoom.disable();

                map.on('style.load', () => {
                    map.setFog({}); // Set the default atmosphere style
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
                parking_data_api = "/parking/get-all"
                fetch(parking_data_api)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(parking => {
                            new mapboxgl.Marker({color: "blue"})
                                .setLngLat([parking.node.longitude, parking.node.latitude])
                                .addTo(map);
                            // set popup for marker
                            new mapboxgl.Popup()
                                .setLngLat([parking.node.longitude, parking.node.latitude])
                                // h2 id=parking-id-parking.id
                                .setHTML("<h2 id=parking-id-" + parking.id + ">" + parking.name + "</h2>")
                                // .setHTML("<button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#parking-model-" + parking.id + "'>Chi tiết</button>")
                                .addTo(map); 
                            // on click popup
                            // document.getElementById("parking-id-" + parking.id).addEventListener("click", function() {
                            //     $('#parking-model-' + parking.id).focus();  
                            //     console.log("click");
                            // });
                        });
                    });
            </script>
        </div>
</body>

</html>