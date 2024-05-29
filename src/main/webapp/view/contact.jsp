<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Liên Hệ Hỗ Trợ - Website Tìm Bãi Đậu Xe</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>
        .banner {
            border: 2px solid #343a40;
            padding: 20px;
            text-align: center;
            margin-bottom: 20px;
            background-color: #f8f9fa;
        }
        .contact-section {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }
        .contact-content h2 {
            margin-bottom: 20px;
        }
        .contact-content form {
            max-width: 600px;
            margin: 0 auto;
        }
        .contact-content form .form-group {
            margin-bottom: 15px;
        }
        .contact-content form button {
            width: 100%;
        }
    </style>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
</head>
<body>
    <!-- Header -->
    <div th:include="layout/header :: header"></div>
    <!-- Kết thúc Header -->

    <!-- Nội dung chính -->
    <div class="container">
        <!-- Liên hệ hỗ trợ -->
        <div class="contact-section">
            <div class="contact-content">
                <h2>Liên Hệ Hỗ Trợ</h2>
                <form action="/submit_contact" method="post">
                    <div class="form-group">
                        <label for="name">Tên của bạn:</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email của bạn:</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Tin nhắn:</label>
                        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Gửi</button>
                </form>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <div th:include="layout/footer :: footer"></div>
    <!-- Kết thúc Footer -->

    <!-- Bao gồm Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
