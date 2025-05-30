<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Employee Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
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
            background: linear-gradient(135deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
            overflow-x: hidden;
            position: relative;
            opacity: 0;
        }

        /* Animated background */
        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, rgba(102, 126, 234, 0.1), rgba(118, 75, 162, 0.1), rgba(240, 147, 251, 0.1));
            z-index: -1;
        }

        .bg-animation::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 1px, transparent 1px);
            background-size: 50px 50px;
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% {
                transform: translate(0, 0) rotate(0deg);
            }
            33% {
                transform: translate(30px, -30px) rotate(120deg);
            }
            66% {
                transform: translate(-20px, 20px) rotate(240deg);
            }
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Welcome Section */
        .welcome-section {
            text-align: center;
            margin-bottom: 60px;
            animation: slideDown 0.8s ease-out;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .welcome-title {
            font-family: 'Poppins', sans-serif;
            font-size: 3.5rem;
            font-weight: 700;
            color: white;
            margin-bottom: 15px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            background: linear-gradient(135deg, #fff, #f0f9ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .welcome-subtitle {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 400;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* Card Grid */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        /* Card Styling */
        .card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 30px;
            transition: all 0.4s cubic-bezier(0.25, 0.8, 0.25, 1);
            position: relative;
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        .card:nth-child(1) { animation-delay: 0.1s; }
        .card:nth-child(2) { animation-delay: 0.2s; }
        .card:nth-child(3) { animation-delay: 0.3s; }
        .card:nth-child(4) { animation-delay: 0.4s; }
        .card:nth-child(5) { animation-delay: 0.5s; }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: all 0.5s ease;
        }

        .card:hover::before {
            left: 100%;
        }

        .card:hover {
            transform: translateY(-10px) scale(1.02);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.2);
            border-color: rgba(255, 255, 255, 0.4);
        }

        .card a {
            text-decoration: none;
            color: inherit;
            display: block;
            height: 100%;
        }

        .card-icon {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.1));
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 25px;
            transition: all 0.3s ease;
            position: relative;
        }

        .card:hover .card-icon {
            transform: scale(1.1) rotate(5deg);
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0.2));
        }

        .card-icon i {
            font-size: 2.2rem;
            color: white;
            transition: all 0.3s ease;
        }

        .card:hover .card-icon i {
            transform: scale(1.1);
        }

        .card-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.4rem;
            font-weight: 600;
            color: white;
            margin-bottom: 12px;
            transition: all 0.3s ease;
        }

        .card:hover .card-title {
            color: #f0f9ff;
            transform: translateX(5px);
        }

        .card-description {
            font-size: 0.95rem;
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
            transition: all 0.3s ease;
        }

        .card:hover .card-description {
            color: rgba(255, 255, 255, 0.95);
        }

        /* Special styling for different card types */
        .card:nth-child(1) .card-icon {
            background: linear-gradient(135deg, #4ade80, #22c55e);
        }

        .card:nth-child(2) .card-icon {
            background: linear-gradient(135deg, #60a5fa, #3b82f6);
        }

        .card:nth-child(3) .card-icon {
            background: linear-gradient(135deg, #f87171, #ef4444);
        }

        .card:nth-child(4) .card-icon {
            background: linear-gradient(135deg, #a78bfa, #8b5cf6);
        }

        .card:nth-child(5) .card-icon {
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
        }

        /* Header with logout button */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 15px 30px;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            font-weight: 700;
            color: white;
        }

        .logout-btn {
            background: linear-gradient(135deg, #ff6b6b, #ee5a52);
            border: none;
            padding: 10px 20px;
            border-radius: 25px;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            font-size: 0.9rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logout-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.4);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px 15px;
            }

            .welcome-title {
                font-size: 2.5rem;
            }

            .welcome-subtitle {
                font-size: 1rem;
            }

            .card-grid {
                grid-template-columns: 1fr;
                gap: 20px;
            }

            .card {
                padding: 25px;
            }

            .header {
                padding: 12px 20px;
            }

            .logo {
                font-size: 1.2rem;
            }
        }

        @media (max-width: 480px) {
            .welcome-title {
                font-size: 2rem;
            }

            .card-icon {
                width: 70px;
                height: 70px;
            }

            .card-icon i {
                font-size: 1.8rem;
            }

            .card-title {
                font-size: 1.2rem;
            }
        }

        /* Loading animation */
        .loading-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
            transition: opacity 0.5s ease;
        }

        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 3px solid rgba(255, 255, 255, 0.3);
            border-top: 3px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            to {
                transform: rotate(360deg);
            }
        }

        /* Accessibility improvements */
        .card:focus-within {
            outline: 2px solid rgba(255, 255, 255, 0.8);
            outline-offset: 2px;
        }

        @media (prefers-reduced-motion: reduce) {
            .card,
            .card-icon,
            .bg-animation::before {
                animation: none;
                transition: none;
            }
        }

        /* Additional polish */
        .card::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
        }

        .stats-badge {
            position: absolute;
            top: 15px;
            right: 15px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 5px 10px;
            font-size: 0.75rem;
            color: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
        }
    </style>
   
</head>
<body>
    <div class="bg-animation"></div>

    <div class="container">
        <div class="welcome-section">
            <h1 class="welcome-title">Employee Management System</h1>
            <p class="welcome-subtitle">Streamline your workforce management with our comprehensive solution</p>
        </div>

        <div class="card-grid">
            <div class="card">
                <a href="empadd.jsp">
                    <div class="card-icon">
                        <i class="fas fa-user-plus"></i>
                    </div>
                    <div class="card-title">Add Employee</div>
                    <div class="card-description">Register new employees and build your team</div>
                </a>
            </div>

            <div class="card">
                <a href="empupdate.jsp">
                    <div class="card-icon">
                        <i class="fas fa-user-edit"></i>
                    </div>
                    <div class="card-title">Update Employee</div>
                    <div class="card-description">Modify existing employee information and details</div>
                </a>
            </div>

            <div class="card">
                <a href="empdelete.jsp">
                    <div class="card-icon">
                        <i class="fas fa-user-minus"></i>
                    </div>
                    <div class="card-title">Delete Employee</div>
                    <div class="card-description">Remove employees from the system safely</div>
                </a>
            </div>

           <div class="card">
                <a href="report">
                    <div class="card-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="card-title">View All Employees</div>
                    <div class="card-description">Browse complete employee directory and profiles</div>
                </a>
            </div>

            <div class="card">
                <a href="report_form.jsp">
                    <div class="card-icon">
                        <i class="fas fa-chart-bar"></i>
                    </div>
                    <div class="card-title">Generate Reports</div>
                    <div class="card-description">Create detailed analytics and workforce reports</div>
                </a>
            </div>
        </div>
    </div>

    <script>
        function logout() {
            // Add smooth transition effect
            document.body.style.opacity = '0';
            document.body.style.transition = 'opacity 0.3s ease';
            
            setTimeout(() => {
                window.location.href = "index.jsp";
            }, 300);
        }

        // Add smooth scroll behavior
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });

        // Add loading animation
        window.addEventListener('load', () => {
            document.body.style.opacity = '1';
            document.body.style.transition = 'opacity 0.5s ease';
        });
    </script>
</body>
</html>