<!DOCTYPE html>
<html>
<head>
    <title>Google Maps Example</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=cocaiconcacaytuoilozlaykeycuatao"></script>
    <script>
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 8,
                center: {lat: -34.397, lng: 150.644}
            });

            fetch('/geocode?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA')
                .then(response => response.json())
                .then(data => {
                    var location = data[0].geometry.location;
                    var marker = new google.maps.Marker({
                        position: {lat: location.lat, lng: location.lng},
                        map: map
                    });
                    map.setCenter({lat: location.lat, lng: location.lng});
                });
        }
    </script>
</head>
<body onload="initMap()">
    <div id="map" style="height: 500px; width: 100%;"></div>
</body>
</html>
