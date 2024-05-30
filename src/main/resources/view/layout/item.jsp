<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Item</title>
  <link rel="stylesheet" href="style.css">
</head>
<style>
/* style.css */

.product {
  border: 1px solid #ccc;
  margin-bottom: 20px;
  padding: 10px;
  border-radius: 25px
}

.product-image {
  position: relative;
  overflow: hidden;
  border-radius: 25px
}

.product-image img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.btn-like {
  position: absolute;
  top: 10px;
  right: 10px;
  padding: 5px 10px;
  background-color: #ce005c;
  border: none;
  border-radius: 25px;
  cursor: pointer;
}

.product-info {
  margin-top: 10px;
}

.product-rating {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.rating-stars {
  color: #ff0000;
}

.rating-count {
  font-size: 0.8em;
  margin-left: 5px;
}

.product-name {
  font-size: 18px;
  font-weight: bold;
  margin-bottom: 5px;
}

.product-address {
  color: #666;
  margin-bottom: 10px;
}

.product-price {
  display: flex;
  align-items: center;
}

.price {
  font-size: 16px;
  font-weight: bold;
  margin-right: 10px;
}

.btn-view-more {
  padding: 5px 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  cursor: pointer;
}

</style>

<body>
  <div class="product">
  <div class="product-image">
    <img src="image.jpg" alt="Tên sản phẩm">
    <button class="btn-like">👍</button>
  </div>
  <div class="product-info">
    <div class="product-rating">
      <span class="rating-stars">4.5</span>
      <span class="rating-count">(123 đánh giá)</span>
    </div>
    <h3 class="product-name">Downtown Parkspot</h3>
    <p class="product-address">Trung tâm mua sắm</p>
    <div class="product-price">
      <span class="price">1.000.000đ</span>
      <button class="btn-view-more">Xem thêm</button>
    </div>
  </div>
</div>


  <main>
    </main>

  <footer>
    </footer>

  <script src="script.js"></script>
</body>
</html>


</body>
</html>
