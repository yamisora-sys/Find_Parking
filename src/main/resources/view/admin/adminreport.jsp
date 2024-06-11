<!DOCTYPE html>
<html lang="en" layout:decorate="~{admin/adminlayout}">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
  <link rel="stylesheet" th:href="@{/css/admin/adnav.css}">

</head>

<body>
  <div class="d-flex">
    <div layout:fragment="sections">
    <div class="content w-100">
      <h1>Báo cáo & Phân tích</h1>
      <button class="btn btn-primary btn-export" onclick="exportToExcel()">Xuất dữ liệu ra Excel</button>
      <table id="reportTable" class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Tên</th>
            <th>Doanh thu</th>
            <th>Số lượng đặt chỗ</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>1</td>
            <td>Item 1</td>
            <td>$100</td>
            <td>10</td>
          </tr>
          <tr>
            <td>2</td>
            <td>Item 2</td>
            <td>$150</td>
            <td>15</td>
          </tr>
          <tr>
            <td>3</td>
            <td>Item 3</td>
            <td>$200</td>
            <td>20</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <script>
    function exportToExcel() {
      const table = document.getElementById('reportTable');
      const rows = table.querySelectorAll('tr');
      let csv = [];

      for (let i = 0; i < rows.length; i++) {
        const row = [],
          cols = rows[i].querySelectorAll('td, th');
        for (let j = 0; j < cols.length; j++) {
          row.push(cols[j].innerText);
        }
        csv.push(row.join(','));
      }

      const csvContent = 'data:text/csv;charset=utf-8,' + csv.join('\n');
      const encodedUri = encodeURI(csvContent);
      const link = document.createElement('a');
      link.setAttribute('href', encodedUri);
      link.setAttribute('download', 'report.csv');
      document.body.appendChild(link);
      link.click();
    }
  </script>

</body>

</html>