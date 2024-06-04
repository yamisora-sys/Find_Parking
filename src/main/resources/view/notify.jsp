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
    <h1>Notification</h1>
    <p>Click on the buttons to send notification</p>
    <div id="notification"></div>
</body>
<script  type="text/javascript">
    var socket = new SockJS('/ws');
    var stompClient = Stomp.over(socket);
    sessionId = null;
    var toastr = window.toastr;
    var show = function(data) {
            toastr[data.type](data.message);
            var p = document.createElement('p');
            p.style.wordWrap = 'break-word';
            p.appendChild(document.createTextNode(data.message));
            document.getElementById('notification').appendChild(p);

        };

    stompClient.connect({}, function(frame) {
        console.log('Connected: ' + frame);
        stompClient.subscribe('/public-notification', function (data) {
            show(JSON.parse(data.body));
        });
        
    });

    function sendMessage(type) {
        var message = "Hello test message";
        stompClient.send("/system/notification", {}, JSON.stringify({message: message, type: type}));
    }
</script>
</html>
