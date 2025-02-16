<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Restaurant Management - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #ff6b6b;
            --secondary-color: #4ecdc4;
            --dark-color: #2d3436;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            font-family: 'Poppins', sans-serif;
        }

        .management-card {
            background: rgba(255, 255, 255, 0.98);
            border-radius: 20px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.08);
        }

        .restaurant-card {
            border-left: 4px solid var(--primary-color);
            transition: all 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateX(10px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .action-btn {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .delete-btn:hover {
            transform: rotate(15deg) scale(1.1);
        }

        @keyframes slideIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-restaurant {
            animation: slideIn 0.4s ease-out;
        }
    </style>
</head>
<body class="py-4">
<div class="container">
    <div class="management-card p-4 mb-4">
        <!-- Header -->
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold mb-0" style="color: var(--primary-color);">
                    <i class="fas fa-store-alt me-2"></i>🏪 Restaurant Management
                </h2>
                <p class="text-muted mb-0">${restaurants.size()} restaurants registered</p>
            </div>
            <div>
                <a href="${pageContext.request.contextPath}/admin/dashboard" 
                   class="btn btn-outline-secondary rounded-pill">
                   <i class="fas fa-arrow-left me-2"></i>Back to Dashboard
                </a>
            </div>
        </div>

        <!-- Restaurants -->
        <div class="row g-4">
            <c:forEach var="restaurant" items="${restaurants}" varStatus="loop">
                <div class="col-12 animate-restaurant" style="animation-delay: ${loop.index * 0.1}s">
                    <div class="restaurant-card card p-3">
                        <div class="row align-items-center">
                            <!-- Restaurant Info -->
                            <div class="col-md-8">
                                <h5 class="mb-1">${restaurant.restaurantName}</h5>
                                <p class="text-muted mb-2">${restaurant.email}</p>
                                <p class="text-muted mb-0">${restaurant.contact}</p>
                            </div>

                            <!-- Actions -->
                            <div class="col-md-4 text-end">
                                <form action="${pageContext.request.contextPath}/admin/deleteRestaurant" method="post" class="m-0">
                                    <input type="hidden" name="restaurantId" value="${restaurant.restaurantId}" />
                                    <button type="submit" 
                                            class="btn btn-danger action-btn delete-btn rounded-circle"
                                            onclick="return confirm('Are you sure you want to delete this restaurant?');">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Empty State -->
        <c:if test="${empty restaurants}">
            <div class="text-center py-5">
                <i class="fas fa-store-alt-slash fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">No restaurants found</h4>
                <p class="text-muted">Add new restaurants to manage them here</p>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
