<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Menu Item - Restaurant Dashboard</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: #fdf6e3;
      font-family: 'Segoe UI', sans-serif;
    }
    .card {
      border: none;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .card-header {
      background-color: #e74c3c;
      color: #fff;
      text-align: center;
      font-size: 1.5rem;
    }
    .form-label {
      font-weight: 500;
    }
    .btn-primary {
      background-color: #e67e22;
      border: none;
    }
    .btn-primary:hover {
      background-color: #d35400;
    }
    .back-link {
      text-decoration: none;
      color: #e67e22;
      font-weight: 500;
    }
    .back-link:hover {
      color: #d35400;
    }
  </style>
</head>
<body>
  <div class="container my-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card animate__animated animate__fadeInUp">
          <div class="card-header">
            <i class="fas fa-plus-circle"></i> Add New Menu Item
          </div>
          <div class="card-body">
            <form action="${pageContext.request.contextPath}/restaurant/addMenuItem" method="post">
              <div class="mb-3">
                <label class="form-label" for="itemName"><i class="fas fa-utensils"></i> Item Name</label>
                <input type="text" class="form-control" id="itemName" name="itemName" required />
              </div>
              <div class="mb-3">
                <label class="form-label" for="itemDescription"><i class="fas fa-info-circle"></i> Description</label>
                <textarea class="form-control" id="itemDescription" name="itemDescription" rows="3" required></textarea>
              </div>
              <div class="mb-3">
                <label class="form-label" for="price"><i class="fas fa-tag"></i> Price</label>
                <input type="number" class="form-control" id="price" name="price" step="0.01" required />
              </div>
              <div class="mb-3">
                <label class="form-label" for="itemType"><i class="fas fa-concierge-bell"></i> Type</label>
                <input type="text" class="form-control" id="itemType" name="itemType" />
              </div>
              <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Add Item</button>
            </form>
            <div class="text-center mt-3">
              <a class="back-link" href="${pageContext.request.contextPath}/restaurant/manageMenu"><i class="fas fa-arrow-left"></i> Back to Manage Menu</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
