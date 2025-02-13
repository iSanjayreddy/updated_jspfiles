<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Cart Dashboard - Korporate Kitchen</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: #fcfcfc;
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      padding: 20px;
    }
    .container {
      max-width: 1200px;
      margin: 0 auto;
    }
    h2 {
      color: #e74c3c;
      text-align: center;
      margin-bottom: 30px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }
    table, th, td {
      border: 1px solid #ddd;
    }
    th, td {
      padding: 12px;
      text-align: center;
    }
    th {
      background-color: #f8f8f8;
    }
    .btn {
      background-color: #e67e22;
      color: #fff;
      padding: 8px 12px;
      border: none;
      border-radius: 5px;
      text-decoration: none;
      margin: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }
    .btn:hover {
      background-color: #d35400;
    }
    form {
      display: inline;
    }
  </style>
</head>
<body>
  <div class="container animate__animated animate__fadeInUp">
    <h2><i class="fas fa-shopping-cart"></i> Your Cart</h2>
    <div class="table-responsive">
      <table class="table table-striped">
        <thead>
          <tr>
            <th>Item Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="item" items="${cartItems}">
            <tr class="animate__animated animate__fadeIn">
              <td>${item.itemName}</td>
              <td>$${item.itemPrice}</td>
              <td>
                ${item.quantity}
                <form action="${pageContext.request.contextPath}/user/increaseQuantity" method="post">
                  <input type="hidden" name="cartId" value="${item.cartId}" />
                  <button class="btn" type="submit"><i class="fas fa-plus"></i></button>
                </form>
                <form action="${pageContext.request.contextPath}/user/decreaseQuantity" method="post">
                  <input type="hidden" name="cartId" value="${item.cartId}" />
                  <button class="btn" type="submit"><i class="fas fa-minus"></i></button>
                </form>
              </td>
              <td>
                <form action="${pageContext.request.contextPath}/user/removeFromCart" method="post">
                  <input type="hidden" name="cartId" value="${item.cartId}" />
                  <button class="btn" type="submit"><i class="fas fa-trash"></i> Remove</button>
                </form>
              </td>
            </tr>
          </c:forEach>
        </tbody>
      </table>
    </div>
    <h3 class="text-end mt-4">Total: $${totalPrice}</h3>
    <div class="d-flex justify-content-end mt-3">
      <a class="btn" href="${pageContext.request.contextPath}/user/payment"><i class="fas fa-credit-card"></i> Proceed to Payment</a>
      <a class="btn" href="${pageContext.request.contextPath}/user/home"><i class="fas fa-home"></i> Back to Home</a>
    </div>
  </div>
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
