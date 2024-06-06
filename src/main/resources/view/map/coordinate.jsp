<!DOCTYPE html>
<html>
<head>
    <title>Geocoding Example</title>
    <script>
        async function getCoordinates() {
            const address = document.getElementById("address").value;
            const apiKey = '37115a7a77524c859abcd229d39a1b5b'; 
            const url = `https://api.opencagedata.com/geocode/v1/json?q=${encodeURIComponent(address)}&key=${apiKey}`;

            try {
                const response = await fetch(url);
                const data = await response.json();
                if (data.results.length > 0) {
                    const latitude = data.results[0].geometry.lat;
                    const longitude = data.results[0].geometry.lng;
                    document.getElementById("result").innerHTML = `Latitude: ${latitude}, Longitude: ${longitude}`;
                } else {
                    document.getElementById("result").innerHTML = "Không tìm thấy tọa độ cho địa chỉ này.";
                }
            } catch (error) {
                document.getElementById("result").innerHTML = "Có lỗi xảy ra khi lấy tọa độ.";
                console.error(error);
            }
        }
    </script>
</head>
<body>
    <h2>Geocoding Example</h2>
    <label for="address">Nhập địa chỉ:</label>
    <input type="text" id="address" name="address">
    <button onclick="getCoordinates()">Lấy tọa độ</button>
    <p id="result"></p>
</body>
</html>
