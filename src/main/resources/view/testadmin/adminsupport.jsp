<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Feedback & Support</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" href="css/admin/adnav.css">


  <style>
    .response-message {
      margin-bottom: 20px;
      padding: 10px;
      border: 1px solid #ccc;
      background-color: #fff;
    }

    .btn-reply {
      margin-top: 10px;
    }
  </style>
</head>

<body>
  <div class="d-flex">
    <div th:include="testadmin/adminnav :: adminnav"></div>
    <div class="content w-100">
      <h1>Feedback & Support</h1>

      <div class="response-section">
        <h3>Phản hồi</h3>
        <div class="response-container">
          <!-- Response messages will be displayed here -->
          <div class="response-message">
            <strong>Tên:</strong> John Doe<br>
            <strong>Email:</strong> john@example.com<br>
            <strong>Nội dung:</strong> Phản hồi của bạn rất hữu ích. Cảm ơn bạn!<br>
            <button class="btn btn-primary btn-reply" onclick="replyToFeedback('John Doe', 'john@example.com')">Trả lời</button>
          </div>
          <div class="response-message">
            <strong>Tên:</strong> Jane Smith<br>
            <strong>Email:</strong> jane@example.com<br>
            <strong>Nội dung:</strong> Xin lỗi, chúng tôi không thể giải quyet vấn đề của bạn.<br>
            <button class="btn btn-primary btn-reply" onclick="replyToFeedback('Jane Smith', 'jane@example.com')">Trả lời</button>
          </div>
        </div>
      </div>

      <div id="replyFormSection" style="display: none;">
        <h3>Trả lời</h3>
        <form id="replyForm">
          <div class="form-group">
            <label for="replyName">Tên</label>
            <input type="text" class="form-control" id="replyName" readonly>
          </div>
          <div class="form-group">
            <label for="replyEmail">Email</label>
            <input type="email" class="form-control" id="replyEmail" readonly>
          </div>
          <div class="form-group">
            <label for="replyMessage">Nội dung trả lời</label>
            <textarea class="form-control" id="replyMessage" rows="3" placeholder="Nhập nội dung trả lời"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">Gửi Trả lời</button>
        </form>
      </div>
    </div>
  </div>
  <script>
    function replyToFeedback(name, email) {
      document.getElementById('replyName').value = name;
      document.getElementById('replyEmail').value = email;
      document.getElementById('replyFormSection').style.display = 'block';
    }

    document.getElementById('replyForm').addEventListener('submit', function(event) {
      event.preventDefault();
      var replyMessage = document.getElementById('replyMessage').value;
      // Xử lý việc gửi trả lời ở đây
      alert('Đã gửi trả lời: ' + replyMessage);
      // Sau khi gửi, ẩn form trả lời
      document.getElementById('replyFormSection').style.display = 'none';
    });
  </script>

</body>

</html>