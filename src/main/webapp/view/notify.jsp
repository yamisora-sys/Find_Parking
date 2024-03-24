<!DOCTYPE html>
<html>
<head>
    <title>Notify</title>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="css/toastr.min.css">
    
    <script src="js/sockjs.min.js"></script>
    <script src="js/stomp.umd.min.js"></script>
    <script src="js/stomp.min.js"></script>
    <script src="js/toastr.min.js"></script>
    <script src="js/jquery-3.7.1.min.js"></script>
</head>
<body>
     <button onclick="sendMessage()">Send Message</button>
</body>
<script  type="text/javascript">
    var socket = new SockJS('/ws');
    var stompClient = Stomp.over(socket);
    var toastr = window.toastr;
    stompClient.connect({}, function(frame) {
        console.log(frame);
        stompClient.subscribe('/all/messages', function(result) {
            show(JSON.parse(result.body));
        });
    });

    function sendMessage() {
        var text = "Hello test message";
        stompClient.send("/app/message", {}, JSON.stringify({text: text}));
        toastr.success('Hello World', 'New Message');
    }
</script>
</html>
