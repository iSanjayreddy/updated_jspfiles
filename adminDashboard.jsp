<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Admin Dashboard - Korporate Kitchen</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Animate.css -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      font-family: 'Arial', sans-serif;
      background: #f8f8f8;
    }
    /* Header */
    .header {
      background: linear-gradient(45deg, #2c3e50, #34495e);
      color: #fff;
      padding: 15px;
      position: relative;
    }
    .hamburger {
      font-size: 30px;
      cursor: pointer;
      position: absolute;
      left: 15px;
      top: 10px;
    }
    .header h2 {
      margin: 0;
      text-align: center;
      font-weight: bold;
    }
    /* Sidebar menu */
    .sidebar {
      height: 100%;
      width: 0;
      position: fixed;
      z-index: 1050;
      top: 0;
      left: 0;
      background-color: #34495e;
      overflow-x: hidden;
      transition: 0.3s;
      padding-top: 60px;
    }
    .sidebar a {
      padding: 10px 15px;
      text-decoration: none;
      font-size: 18px;
      color: #ecf0f1;
      display: block;
      transition: 0.3s;
    }
    .sidebar a:hover {
      background-color: #2c3e50;
    }
    .sidebar .closebtn {
      position: absolute;
      top: 10px;
      right: 20px;
      font-size: 30px;
    }
    /* Main content */
    .main {
      margin-left: 0;
      transition: margin-left 0.3s;
      padding: 20px;
    }
    .stats {
      margin: 20px 0;
      text-align: center;
    }
    .stats div {
      display: inline-block;
      margin: 0 15px;
      padding: 10px 20px;
      background: #e67e22;
      color: #fff;
      border-radius: 5px;
      font-size: 18px;
    }
    .welcome {
      font-size: 1.2rem;
      margin-top: 20px;
      text-align: center;
    }
  </style>
  <script>
    function openNav() {
      document.getElementById("mySidebar").style.width = "250px";
      document.getElementById("main").style.marginLeft = "250px";
    }
    function closeNav() {
      document.getElementById("mySidebar").style.width = "0";
      document.getElementById("main").style.marginLeft= "0";
    }
  </script>
</head>
<body>
  <!-- Header with Hamburger Icon -->
  <div class="header">
    <span class="hamburger" onclick="openNav()"><i class="fas fa-bars"></i></span>
    <h2>Admin Dashboard</h2>
  </div>
  
  <!-- Sidebar Navigation -->
  <div id="mySidebar" class="sidebar animate__animated">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="${pageContext.request.contextPath}/admin/profile"><i class="fas fa-user-circle"></i> Admin Profile</a>
    <a href="${pageContext.request.contextPath}/admin/users"><i class="fas fa-users"></i> User Management</a>
    <a href="${pageContext.request.contextPath}/admin/restaurants"><i class="fas fa-utensils"></i> Restaurant Management</a>
    <a href="${pageContext.request.contextPath}/admin/delivery"><i class="fas fa-motorcycle"></i> Delivery Agent Management</a>
  </div>
  
  <!-- Main Content Area -->
  <div id="main" class="main">
    <div class="stats animate__animated animate__fadeInUp">
      <div>Total Restaurants: ${totalRestaurants}</div>
      <div>Total Users: ${totalUsers}</div>
      <div>Total Delivery Agents: ${totalDeliveryAgents}</div>
    </div>
    <p class="welcome animate__animated animate__fadeInUp">
      Welcome to the Admin Dashboard. Use the menu on the left to manage system users, restaurants, and delivery agents.
    </p>
  </div>
  
  <!-- Bootstrap Bundle with Popper -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
