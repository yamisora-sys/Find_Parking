<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/adminlayout}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" th:href="@{/css/admin/adnav.css}">
    <link href="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.css" rel="stylesheet">
    <script src="https://api.mapbox.com/mapbox-gl-js/v3.4.0/mapbox-gl.js"></script>
</head>

<body>
    <div layout:fragment="sections">
        <!-- verify parking -->
        <table class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>address</th>
                    <th>capacity</th>
                    <th>price</th>
                    <th>unit price</th>
                    <th>owner</th>
                </tr>
            </thead>
            <tbody>
                <tr th:each="parking : ${parkings}">
                    <td th:text="${parking.id}"></td>
                    <td th:text="${parking.address}"></td>
                    <td th:text="${parking.capacity}"></td>
                    <td th:text="${parking.price}"></td>
                    <td th:text="${parking.unitPrice}"></td>
                    <td th:text="${parking.user.username}"></td>
                    <td>
                        <a th:href="@{'/admin/verify-parking?parkingId=' + ${parking.id}}" class="btn btn-primary">Verify</a>
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                            Launch demo modal
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
        <!-- modal map -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div id="map" style="width: 50%; height: 300px;"></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
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
                map.flyTo({ center: userLocation, zoom: 15 });
    
                new mapboxgl.Marker({ color: "red" })
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
                map.easeTo({ center, duration: 1000, easing: (n) => n });
            }
        }
    
        // Pause spinning on interaction
        map.on('mousedown', () => {
            userInteracting = true;
        });
        map.on('dragstart', () => {
            userInteracting = true;
        });

    </script>
</body>

</html>