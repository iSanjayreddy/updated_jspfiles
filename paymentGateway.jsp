<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Payment Gateway - Korporate Kitchen</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #4ecdc4;
            --secondary-color: #ff6b6b;
            --dark-color: #2d3436;
        }

        body {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .payment-card {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
            padding: 2rem;
            max-width: 500px;
            animation: cardEntrance 0.6s ease;
        }

        .payment-method {
            border: 2px solid #eee;
            border-radius: 15px;
            padding: 1.5rem;
            margin: 1rem 0;
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .payment-method:hover {
            border-color: var(--primary-color);
            transform: translateY(-3px);
        }

        .card-preview {
            background: linear-gradient(45deg, #2d3436, #636e72);
            color: white;
            padding: 1.5rem;
            border-radius: 15px;
            position: relative;
        }

        @keyframes cardEntrance {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .checkmark {
            width: 60px;
            height: 60px;
            background: var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            animation: checkmark 0.6s ease;
        }

        @keyframes checkmark {
            0% { transform: scale(0); }
            80% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }
    </style>
</head>
<body>
    <div class="payment-card">
        <h2 class="text-center mb-4"><i class="fas fa-credit-card me-2"></i>Payment Gateway</h2>
        
        <div class="card-preview mb-4">
            <div class="d-flex justify-content-between align-items-center">
                <i class="fab fa-cc-visa fa-2x"></i>
                <div class="text-end">
                    <small>Valid Thru</small>
                    <div class="fw-bold">MM/YY</div>
                </div>
            </div>
            <div class="mt-3">•••• •••• •••• 4242</div>
        </div>

        <div class="payment-method" onclick="showPayment('card')">
            <div class="d-flex align-items-center">
                <i class="fas fa-credit-card fa-2x me-3"></i>
                <div>
                    <h5 class="mb-0">Credit/Debit Card</h5>
                    <small class="text-muted">Secure card payment</small>
                </div>
            </div>
        </div>

        <div class="payment-method" onclick="showPayment('upi')">
            <div class="d-flex align-items-center">
                <i class="fas fa-mobile-alt fa-2x me-3"></i>
                <div>
                    <h5 class="mb-0">UPI Payment</h5>
                    <small class="text-muted">Instant UPI transaction</small>
                </div>
            </div>
        </div>

        <!-- Payment Forms -->
        <div id="cardForm" class="mt-4" style="display: none;">
            <div class="mb-3">
                <label>Card Number</label>
                <input type="text" class="form-control" placeholder="4242 4242 4242 4242">
            </div>
            <div class="row g-3">
                <div class="col-md-6">
                    <label>Expiry Date</label>
                    <input type="month" class="form-control">
                </div>
                <div class="col-md-6">
                    <label>CVV</label>
                    <input type="number" class="form-control" placeholder="123">
                </div>
            </div>
            <button class="btn btn-primary w-100 mt-3" onclick="processPayment()">
                Pay ₹${totalPrice} <i class="fas fa-lock ms-2"></i>
            </button>
        </div>

        <div id="upiForm" class="mt-4" style="display: none;">
            <div class="mb-3">
                <label>UPI ID</label>
                <input type="text" class="form-control" placeholder="username@upi">
            </div>
            <button class="btn btn-primary w-100" onclick="processUPI()">
                Pay ₹${totalPrice} <i class="fas fa-mobile-alt ms-2"></i>
            </button>
        </div>
    </div>

    <!-- Success Modal -->
    <div class="modal fade" id="successModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body text-center p-4">
                    <div class="checkmark">
                        <i class="fas fa-check text-white fa-2x"></i>
                    </div>
                    <h3 class="mt-3">Payment Successful!</h3>
                    <p>Your order is being processed</p>
                    <button class="btn btn-primary" onclick="redirectToConfirm()">
                        Continue <i class="fas fa-arrow-right ms-2"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showPayment(type) {
            document.getElementById('cardForm').style.display = type === 'card' ? 'block' : 'none';
            document.getElementById('upiForm').style.display = type === 'upi' ? 'block' : 'none';
        }

        function processPayment() {
            new bootstrap.Modal(document.getElementById('successModal')).show();
        }

        function processUPI() {
            new bootstrap.Modal(document.getElementById('successModal')).show();
        }

        function redirectToConfirm() {
            window.location.href = "${pageContext.request.contextPath}/user/confirmPayment";
        }
    </script>
</body>
</html>
