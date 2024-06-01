socket = new SockJS('/ws');
privateStompClient = Stomp.over(socket)
privateStompClient.connect({}, function (frame) {
  console.log(frame)
  privateStompClient.subscribe('/user/specific', function (result) {
    console.log(result.body)
    show(JSON.parse(result.body))
  })
  file
})