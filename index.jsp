<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Home Dashboard - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --dark-color: #2d3436;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #fff5f5 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
        }

        .dashboard-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.08);
        }

        .restaurant-card {
            border: none;
            border-radius: 15px;
            transition: all 0.3s ease;
            overflow: hidden;
        }

        .restaurant-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.1);
        }

        .restaurant-image {
            height: 200px;
            background-size: cover;
            background-position: center;
            position: relative;
        }

        .rating-badge {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: rgba(255, 255, 255, 0.9);
            padding: 0.25rem 0.75rem;
            border-radius: 20px;
            font-weight: 600;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-card {
            animation: fadeIn 0.4s ease-out;
        }
    </style>
</head>
<body class="py-4">
<div class="container">
    <!-- Header Section -->
    <div class="dashboard-card p-4 mb-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h1 class="fw-bold mb-0" style="color: var(--primary-color);">
                    Welcome, ${user.userName} 👋
                </h1>
                <p class="text-muted mb-0">What would you like to order today?</p>
            </div>
            <div class="d-flex gap-2">
                <div class="position-relative">
                    <a href="${pageContext.request.contextPath}/user/cart" 
                       class="btn btn-primary position-relative rounded-pill">
                       <i class="fas fa-shopping-cart"></i>
                       <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
                         ${cartItemCount}
                       </span>
                    </a>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="d-flex flex-wrap gap-2 mb-4">
            <a href="${pageContext.request.contextPath}/user/profile" 
               class="btn btn-outline-primary rounded-pill px-4">
               <i class="fas fa-user me-2"></i>Profile
            </a>
            <a href="${pageContext.request.contextPath}/user/orders" 
               class="btn btn-outline-primary rounded-pill px-4">
               <i class="fas fa-receipt me-2"></i>My Orders
            </a>
            <a href="${pageContext.request.contextPath}/user/logout" 
               class="btn btn-outline-danger rounded-pill px-4">
               <i class="fas fa-sign-out-alt me-2"></i>Logout
            </a>
        </div>
    </div>

    <!-- Restaurants Section -->
    <div class="dashboard-card p-4">
        <h3 class="fw-bold mb-4" style="color: var(--dark-color);">
            <i class="fas fa-utensils me-2"></i>🍴 Available Restaurants
        </h3>
        
        <div class="row g-4">
            <c:forEach var="restaurant" items="${restaurants}" varStatus="loop">
                <div class="col-md-6 col-lg-4 animate-card" style="animation-delay: ${loop.index * 0.1}s">
                    <div class="restaurant-card card">
                        <div class="restaurant-image" 
                             style="background-image: url('${restaurant.imageUrl}')">
                            <div class="rating-badge">
                                ⭐ ${restaurant.rating}
                            </div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title fw-bold">${restaurant.restaurantName}</h5>
                            <div class="d-flex flex-wrap gap-2 mb-3">
                                <span class="badge bg-primary">${restaurant.cuisine}</span>
                                <span class="badge bg-success">
                                    <i class="fas fa-clock me-1"></i>${restaurant.deliveryTime} mins
                                </span>
                            </div>
                            <a href="${pageContext.request.contextPath}/user/restaurantMenu?restaurantId=${restaurant.restaurantId}" 
                               class="btn btn-primary w-100 rounded-pill">
                               View Menu <i class="fas fa-arrow-right ms-2"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty restaurants}">
            <div class="text-center py-5">
                <i class="fas fa-store-alt-slash fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No restaurants available</h4>
                <p class="text-muted">Please check back later</p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
