<!DOCTYPE html>
<html>
<head>
    <title>Google Maps Directions Example</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaHpCRCXttnCsGwTPU4-ZpPqS06Y8g_uI"></script>
    <script>
        let map;
        let directionsService;
        let directionsRenderer;

        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {
                zoom: 7,
                center: { lat: 41.85, lng: -87.65 } // Chicago.
            });

            directionsService = new google.maps.DirectionsService();
            directionsRenderer = new google.maps.DirectionsRenderer();
            directionsRenderer.setMap(map);

            document.getElementById('getDirectionsBtn').addEventListener('click', function() {
                calculateAndDisplayRoute(directionsService, directionsRenderer);
            });
        }

        function calculateAndDisplayRoute(directionsService, directionsRenderer) {
            const start = document.getElementById('start').value;
            const end = document.getElementById('end').value;

            directionsService.route(
                {
                    origin: start,
                    destination: end,
                    travelMode: google.maps.TravelMode.DRIVING,
                },
                (response, status) => {
                    if (status === "OK") {
                        directionsRenderer.setDirections(response);
                    } else {
                        window.alert("Directions request failed due to " + status);
                    }
                }
            );
        }
    </script>
</head>
<body onload="initMap()">
    <div>
        <input id="start" type="text" placeholder="Enter start location">
        <input id="end" type="text" placeholder="Enter end location">
        <button id="getDirectionsBtn">Get Directions</button>
    </div>
    <div id="map" style="height: 500px; width: 100%;"></div>
</body>
</html>
