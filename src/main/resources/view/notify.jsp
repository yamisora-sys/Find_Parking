<!DOCTYPE html>
<html>
<head>
    <title>Notify</title>
    <link rel="stylesheet" href="css/toastr.min.css">

    <script src="js/jquery-3.7.1.min.js"></script>
    <script src="js/toastr.min.js"></script>
    <script src="js/sockjs.min.js"></script>
    <script src="js/stomp.umd.min.js"></script>
    <script src="js/stomp.min.js"></script>
</head>
<body>
     <button onclick="sendMessage('info')">Send Info</button>
        <button onclick="sendMessage('success')">Send Success</button>
        <button onclick="sendMessage('warning')">Send Warning</button>
        <button onclick="sendMessage('error')">Send Error</button>
</body>
<script  type="text/javascript" th:src="@{/js/notification/realtime-notification.js}"></script>
</html>
