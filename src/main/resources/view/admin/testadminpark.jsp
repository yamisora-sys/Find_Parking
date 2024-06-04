<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bãi giữ xe</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" th:href="@{/css/admin/adnav.css}">

</head>
<body>

<div class="d-flex">
    <div th:include="testadmin/adminnav :: adminnav"></div>

    <div class="content w-100">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2>Quản lý bãi giữ xe</h2>
                <button class="btn btn-primary" data-toggle="modal" data-target="#addParkingModal"><i class="bi bi-plus-lg"></i> Thêm bãi giữ xe</button>
            </div>

            <div class="card">
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Tên bãi giữ xe</th>
                                <th>Địa chỉ</th>
                                <th>Số chỗ trống</th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Example row -->
                            <tr>
                                <td>1</td>
                                <td>Bãi giữ xe A</td>
                                <td>123 Đường ABC, TP.HCM</td>
                                <td>10</td>
                                <td>Hoạt động</td>
                                <td>
                                    <button class="btn btn-warning btn-sm" data-toggle="modal" data-target="#editParkingModal"><i class="bi bi-pencil"></i> Sửa</button>
                                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteParkingModal"><i class="bi bi-trash"></i> Xóa</button>
                                </td>
                            </tr>
                            <!-- Add more rows as needed -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Add Parking Modal -->
            <div class="modal fade" id="addParkingModal" tabindex="-1" role="dialog" aria-labelledby="addParkingModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addParkingModalLabel">Thêm bãi giữ xe</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="parkingName">Tên bãi giữ xe</label>
                                    <input type="text" class="form-control" id="parkingName" placeholder="Nhập tên bãi giữ xe">
                                </div>
                                <div class="form-group">
                                    <label for="parkingAddress">Địa chỉ</label>
                                    <input type="text" class="form-control" id="parkingAddress" placeholder="Nhập địa chỉ">
                                </div>
                                <div class="form-group">
                                    <label for="parkingSpots">Số chỗ trống</label>
                                    <input type="number" class="form-control" id="parkingSpots" placeholder="Nhập số chỗ trống">
                                </div>
                                <div class="form-group">
                                    <label for="parkingStatus">Trạng thái</label>
                                    <select class="form-control" id="parkingStatus">
                                        <option>Hoạt động</option>
                                        <option>Không hoạt động</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Edit Parking Modal -->
            <div class="modal fade" id="editParkingModal" tabindex="-1" role="dialog" aria-labelledby="editParkingModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="editParkingModalLabel">Sửa bãi giữ xe</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <label for="editParkingName">Tên bãi giữ xe</label>
                                    <input type="text" class="form-control" id="editParkingName" value="Bãi giữ xe A">
                                </div>
                                <div class="form-group">
                                    <label for="editParkingAddress">Địa chỉ</label>
                                    <input type="text" class="form-control" id="editParkingAddress" value="123 Đường ABC, TP.HCM">
                                </div>
                                <div class="form-group">
                                    <label for="editParkingSpots">Số chỗ trống</label>
                                    <input type="number" class="form-control" id="editParkingSpots" value="10">
                                </div>
                                <div class="form-group">
                                    <label for="editParkingStatus">Trạng thái</label>
                                    <select class="form-control" id="editParkingStatus">
                                        <option selected>Hoạt động</option>
                                        <option>Không hoạt động</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-primary">Lưu</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Delete Parking Modal -->
            <div class="modal fade" id="deleteParkingModal" tabindex="-1" role="dialog" aria-labelledby="deleteParkingModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="deleteParkingModalLabel">Xóa bãi giữ xe</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có chắc chắn muốn xóa bãi giữ xe này không?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                            <button type="button" class="btn btn-danger">Xóa</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
