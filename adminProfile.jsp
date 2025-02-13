<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Profile - Korporate Kitchen</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      background: #f4f4f4;
      font-family: 'Arial', sans-serif;
      padding: 20px;
    }
    .profile-card {
      max-width: 600px;
      margin: 30px auto;
      padding: 20px;
      background: #fff;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }
    .profile-card h2 {
      color: #e74c3c;
      text-align: center;
      margin-bottom: 20px;
    }
    .profile-info p {
      font-size: 1.2em;
      line-height: 1.5;
      margin-bottom: 10px;
    }
    .profile-info p i {
      margin-right: 10px;
      color: #e67e22;
    }
    .btn-back {
      background-color: #e67e22;
      color: #fff;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 5px;
      display: block;
      text-align: center;
      margin-top: 20px;
      transition: background-color 0.3s;
    }
    .btn-back:hover {
      background-color: #d35400;
    }
  </style>
</head>
<body>
  <div class="profile-card animate__animated animate__fadeInUp">
    <h2><i class="fas fa-user-circle"></i> Admin Profile</h2>
    <div class="profile-info">
      <p><i class="fas fa-user"></i> <strong>Name:</strong> ${admin.userName}</p>
      <p><i class="fas fa-envelope"></i> <strong>Email:</strong> ${admin.email}</p>
      <p><i class="fas fa-phone"></i> <strong>Contact:</strong> ${admin.contact}</p>
    </div>
    <a class="btn-back" href="${pageContext.request.contextPath}/admin/dashboard"><i class="fas fa-arrow-left"></i> Back to Dashboard</a>
  </div>
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
