<!DOCTYPE html>
<html>
<head>
    <title>Google Maps Example</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaHpCRCXttnCsGwTPU4-ZpPqS06Y8g_uI"></script>
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: {lat: -34.397, lng: 150.644}
            });

            document.getElementById('getLocationBtn').addEventListener('click', function() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function(position) {
                        var pos = {
                            lat: position.coords.latitude,
                            lng: position.coords.longitude
                        };
                        var marker = new google.maps.Marker({
                            position: pos,
                            map: map
                        });
                        map.setCenter(pos);
                    }, function() {
                        alert('Error: The Geolocation service failed.');
                    });
                } else {
                    alert('Error: Your browser doesn\'t support geolocation.');
                }
            });
        }
    </script>
</head>
<body onload="initMap()">
    <div>
        <button id="getLocationBtn">Get My Location</button>
    </div>
    <div id="map" style="height: 500px; width: 100%;"></div>
</body>
</html>
