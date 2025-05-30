<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null) {
    if (username.equals("admin") && password.equals("admin123")) {
        response.sendRedirect("home.jsp");
        return;
    } else {
%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        showError("Invalid credentials. Please check your username and password.");
    });
</script>
<%
    }
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Portal</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            position: relative;
        }

        /* Animated background particles */
        .particle {
            position: absolute;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .particle:nth-child(1) {
            top: 20%;
            left: 20%;
            animation-delay: 0s;
            animation-duration: 8s;
        }

        .particle:nth-child(2) {
            top: 60%;
            right: 20%;
            animation-delay: 2s;
            animation-duration: 6s;
        }

        .particle:nth-child(3) {
            bottom: 20%;
            left: 60%;
            animation-delay: 4s;
            animation-duration: 10s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
                opacity: 0.7;
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
                opacity: 1;
            }
        }

        /* Glass morphism effect for login container */
        .login-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
            animation: slideIn 0.8s ease-out;
            position: relative;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: white;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 8px;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
        }

        .login-header p {
            color: rgba(255, 255, 255, 0.8);
            font-size: 0.95rem;
            font-weight: 400;
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
            transition: all 0.3s ease;
        }

        .form-group input {
            width: 100%;
            height: 55px;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 0 20px 0 55px;
            font-size: 16px;
            color: white;
            outline: none;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .form-group input::placeholder {
            color: rgba(255, 255, 255, 0.7);
            font-weight: 400;
        }

        .form-group input:focus {
            border-color: rgba(255, 255, 255, 0.6);
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .form-group i {
            position: absolute;
            left: 18px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            font-size: 18px;
            transition: all 0.3s ease;
        }

        .form-group:focus-within i {
            color: white;
            transform: translateY(-50%) scale(1.1);
        }

        .login-btn {
            width: 100%;
            height: 55px;
            background: linear-gradient(135deg, #ff6b6b, #ee5a52);
            border: none;
            border-radius: 12px;
            color: white;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: all 0.5s ease;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 35px rgba(255, 107, 107, 0.4);
            background: linear-gradient(135deg, #ff5252, #d32f2f);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        /* Error message styling */
        .error-message {
            background: rgba(244, 67, 54, 0.15);
            border: 1px solid rgba(244, 67, 54, 0.3);
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 20px;
            color: #ffcdd2;
            display: none;
            backdrop-filter: blur(10px);
            animation: shake 0.5s ease-in-out;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .error-message i {
            margin-right: 8px;
            color: #ff5252;
        }

        /* Additional decorative elements */
        .login-container::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            border-radius: 20px;
            z-index: -1;
            animation: borderGlow 3s ease-in-out infinite;
        }

        @keyframes borderGlow {
            0%, 100% {
                opacity: 0.5;
            }
            50% {
                opacity: 1;
            }
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .login-container {
                margin: 20px;
                padding: 30px 25px;
            }

            .login-header h1 {
                font-size: 1.8rem;
            }

            .form-group input,
            .login-btn {
                height: 50px;
            }
        }

        /* Focus indicators for accessibility */
        .form-group input:focus,
        .login-btn:focus {
            outline: 2px solid rgba(255, 255, 255, 0.8);
            outline-offset: 2px;
        }

        /* Loading state for button */
        .login-btn.loading {
            pointer-events: none;
            opacity: 0.8;
        }

        .login-btn.loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to {
                transform: translate(-50%, -50%) rotate(360deg);
            }
        }
    </style>
    
</head>
<body>
    <div class="particle"></div>
    <div class="particle"></div>
    <div class="particle"></div>
    
    <div class="login-container">
       


        <form method="post" action="index.jsp">
            <div class="form-group">
                <input type="text" name="username" placeholder="Administrator Username" required>
                <i class="fas fa-user"></i>
            </div>

            <div class="form-group">
                <input type="password" name="password" placeholder="Secure Password" required>
                <i class="fas fa-lock"></i>
            </div>

            <button type="submit" class="login-btn">
             Login
            </button>
        </form>

       
    </div>

    <script>
        function showError(message) {
            const errorDiv = document.getElementById('errorMessage');
            const errorText = document.getElementById('errorText');
            errorText.textContent = message;
            errorDiv.style.display = 'block';
            
            setTimeout(() => {
                errorDiv.style.display = 'none';
            }, 5000);
        }

        // Add subtle interactions
        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('input');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>
</html>