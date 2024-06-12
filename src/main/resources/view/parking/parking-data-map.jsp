<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parking Locations</title>
    <meta name="viewport" content="initial-scale=1,maximum-scale=1,user-scalable=no">
    <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
    <script type="text/javascript" th:src="@{/js/jquery-3.7.1.min.js}"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" th:href="@{/css/bootstrap.css}">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        #map {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
        }

        .modal-content {
            padding: 20px;
        }

        .modal-header {
            background-color: #007bff;
            color: white;
        }

        .modal-body p {
            margin: 0;
        }
    </style>
</head>

<body>
    <div id="map"></div>
    <div th:each="parking : ${parkings}">
        <div th:attr="id='parking-modal-' + ${parking.id}" class="modal fade" tabindex="-1" role="dialog"
            aria-labelledby="parking-modal-label" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="parking-modal-label" th:text="${parking.name}"></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Address:</strong> <span th:text="${parking.address}"></span></p>
                        <p><strong>Price:</strong> <span th:text="${parking.price}"></span></p>
                        <p><strong>Unit Price:</strong> <span th:text="${parking.unitPrice}"></span></p>
                        <p><strong>Description:</strong> <span th:text="${parking.description}"></span></p>
                        <p><strong>Status:</strong> <span th:text="${parking.status}"></span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        mapboxgl.accessToken = 'pk.eyJ1IjoieWFtaXNvcmEiLCJhIjoiY2x4MDhsOXE2MGZlMDJtcHRmaWQxN20waSJ9.NYHCInPpPXOytI3kAe2OYQ';
        const map = new mapboxgl.Map({
            container: 'map',
            style: 'mapbox://styles/yamisora/clx4wr6a5001i01pj0xm472qf',
            projection: 'globe',
            zoom: 1,
            center: [30, 15]
        });

        map.addControl(new mapboxgl.NavigationControl());
        map.scrollZoom.disable();

        map.on('style.load', () => {
            map.setFog({});
        });

        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                var userLocation = [position.coords.longitude, position.coords.latitude];
                map.flyTo({ center: userLocation, zoom: 5 });

                new mapboxgl.Marker({ color: "red" })
                    .setLngLat(userLocation)
                    .addTo(map);
            });
        }

        const secondsPerRevolution = 240;
        const maxSpinZoom = 5;
        const slowSpinZoom = 3;

        let userInteracting = false;
        const spinEnabled = true;

        function spinGlobe() {
            const zoom = map.getZoom();
            if (spinEnabled && !userInteracting && zoom < maxSpinZoom) {
                let distancePerSecond = 360 / secondsPerRevolution;
                if (zoom > slowSpinZoom) {
                    const zoomDif =
                        (maxSpinZoom - zoom) / (maxSpinZoom - slowSpinZoom);
                    distancePerSecond *= zoomDif;
                }
                const center = map.getCenter();
                center.lng -= distancePerSecond;
                map.easeTo({ center, duration: 1000, easing: (n) => n });
            }
        }

        map.on('mousedown', () => {
            userInteracting = true;
        });
        map.on('dragstart', () => {
            userInteracting = true;
        });

        const parkingDataApi = "/parking/get-all";
        fetch(parkingDataApi)
            .then(response => response.json())
            .then(data => {
                data.forEach(parking => {
                    const marker = new mapboxgl.Marker({ color: "blue" })
                        .setLngLat([parking.node.longitude, parking.node.latitude])
                        .addTo(map);

                    const popup = new mapboxgl.Popup()
                        .setLngLat([parking.node.longitude, parking.node.latitude])
                        .setHTML(`
                            <h5>${parking.name}</h5>
                            <button type='button' class='btn btn-primary' data-bs-toggle='modal' data-bs-target='#parking-modal-${parking.id}'>
                                View Details
                            </button>
                        `)
                        .addTo(map);

                    marker.setPopup(popup);
                });
            });
    </script>
</body>

</html>
