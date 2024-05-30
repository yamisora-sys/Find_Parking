<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="https://www.thymeleaf.org">
<head>
    <title>Giới Thiệu Về Website Tìm Bãi Đậu Xe</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/screen/about.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        
    </style>
</head>
<body>
    <!-- Header -->
    <div th:include="layout/header :: header"></div>
    <!-- Kết thúc Header -->

    <!-- Nội dung chính -->
    <div class="container">
        <div class="intro-section">
            <div class="intro-content">
                <h1>Chào Mừng Đến Với Website Tìm Bãi Đậu Xe</h1>
                <div class="icon">
                    <i class="fas fa-car"></i>
                </div>
                <p>Website của chúng tôi cung cấp dịch vụ tìm kiếm và đặt trước bãi đậu xe một cách nhanh chóng và tiện lợi. Với hệ thống bãi đậu xe được phân bố rộng khắp và thông tin chi tiết về từng bãi đậu, bạn có thể dễ dàng tìm kiếm được chỗ đậu xe phù hợp với nhu cầu của mình.</p>
                <p>Chỉ với vài thao tác đơn giản, bạn có thể đặt chỗ đậu xe trước và yên tâm về chỗ đậu xe khi đến nơi. Website của chúng tôi hỗ trợ nhiều loại xe khác nhau như xe hơi, xe máy và xe tải, đảm bảo đáp ứng mọi nhu cầu của bạn.</p>
                <div class="image-section">
                    <img src="img/baidauxe.webp" alt="Bãi đậu xe">
                </div>
                <p>Hãy bắt đầu hành trình của bạn bằng cách tìm kiếm bãi đậu xe ngay hôm nay. Chúng tôi cam kết mang đến cho bạn trải nghiệm dịch vụ tốt nhất.</p>
                <p>Chúc bạn có một ngày tốt lành và cảm ơn bạn đã sử dụng dịch vụ của chúng tôi!</p>
            </div>
        </div>
    </div>
    <!-- Footer -->
    <div th:include="layout/footer :: footer"></div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
