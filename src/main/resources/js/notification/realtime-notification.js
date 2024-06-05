var socket = new SockJS("/ws");
var stompClient = Stomp.over(socket);
sessionId = null;
var toastr = window.toastr;
var show = function (data) {
  toastr[data.type](data.message);
};

stompClient.connect({}, function (frame) {
  console.log("Connected: " + frame);
  stompClient.subscribe("/public-notification", function (data) {
    show(JSON.parse(data.body));
  });
});

function sendMessage(type) {
  var message = "Hello test message";
  stompClient.send(
    "/system/notification",
    {},
    JSON.stringify({ message: message, type: type })
  );
}
