<!DOCTYPE html>
<html layout:decorate="~{layout/home-layout}">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Hồ Sơ Người Dùng</title>
    <script src="js/jquery-3.7.1.min.js"></script>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .edit-profile-form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 50px;
        }

        .edit-profile-form h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .profile-image-container {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-image {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            object-fit: cover;
        }

        .custom-file-label {
            overflow: hidden;
        }
    </style>
</head>

<body>

    <div layout:fragment="sections"  class="container">
        <div class="edit-profile-form">
            <h2>Chỉnh Sửa Hồ Sơ</h2>
            <div class="profile-image-container">
                <img class="profile-image" id="preview-image" src="img/parking_logo.png" alt="Ảnh Đại Diện">
            </div>
            <div class="form-group">
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="input-image">
                    <label class="custom-file-label" for="input-image">Chọn Ảnh Đại Diện</label>
                </div>
            </div>
            <form>
                <div class="form-group">
                    <label for="name">Tên:</label>
                    <input type="text" class="form-control" id="name" placeholder="Nhập tên">
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" class="form-control" id="email" placeholder="Nhập email">
                </div>
                <div class="form-group">
                    <label for="phone">Số Điện Thoại:</label>
                    <input type="text" class="form-control" id="phone" placeholder="Nhập số điện thoại">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Lưu Thay Đổi</button>
            </form>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        // Hiển thị ảnh được chọn trước khi tải lên
        document.getElementById('input-image').onchange = function (e) {
            var reader = new FileReader();
            reader.onload = function (event) {
                document.getElementById('preview-image').src = event.target.result;
            }
            reader.readAsDataURL(e.target.files[0]);
        }
    </script>
</body>

</html>
