<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Employee </title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        transition: opacity 0.3s ease;
    }

    body.loading {
        opacity: 0;
    }

    body.loaded {
        opacity: 1;
    }

    .container {
        width: 100%;
        max-width: 600px;
        padding: 2rem;
    }

    .form-container {
        background: #fff;
        padding: 2rem 2.5rem;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
    }

    .form-title {
        text-align: center;
        margin-bottom: 1.5rem;
        font-size: 1.75rem;
        color: #333;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1.2rem;
    }

    .form-group {
        display: flex;
        flex-direction: column;
    }

    .form-row {
        display: flex;
        justify-content: space-between;
        gap: 1rem;
    }

    label {
        font-weight: 500;
        margin-bottom: 0.4rem;
        color: #444;
    }

    input, select {
        padding: 0.65rem;
        font-size: 1rem;
        border: 1px solid #ccc;
        border-radius: 8px;
        transition: border-color 0.3s ease;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #667eea;
    }

    .submit-btn {
        background-color: #667eea;
        color: #fff;
        border: none;
        padding: 0.75rem;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .submit-btn:hover {
        background-color: #5a67d8;
    }

    .back-link {
        display: inline-block;
        margin-top: 1.5rem;
        text-decoration: none;
        color: #fff;
        background: rgba(255,255,255,0.15);
        padding: 0.5rem 1rem;
        border-radius: 8px;
        transition: background 0.3s ease;
    }

    .back-link:hover {
        background: rgba(255,255,255,0.25);
    }

    .fas {
        margin-right: 0.5rem;
    }

    @media (max-width: 600px) {
        .form-row {
            flex-direction: column;
        }
    }
</style>
    
</head>
<body class="loading">
    <div class="bg-animation"></div>
    
  
    <div class="container">
        
        <div class="form-container">
            <h2 class="form-title">
                <i class="fas fa-user-edit" style="color: #667eea; margin-right: 0.5rem;"></i>
                Update Employee
            </h2>
            
            <form action="updateEmployee" method="post">
                <div class="form-group">
                    <label for="empno">
                        <i class="fas fa-id-badge"></i> Employee Number (to update):
                    </label>
                    <input type="number" name="empno" id="empno" required placeholder="Enter employee number">
                </div>

                <div class="form-group">
                    <label for="empName">
                        <i class="fas fa-user"></i> Employee Name:
                    </label>
                    <input type="text" name="empName" id="empName" required placeholder="Enter full name">
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label for="doj">
                            <i class="fas fa-calendar-alt"></i> Date of Joining:
                        </label>
                        <input type="date" name="doj" id="doj" required>
                    </div>

                    <div class="form-group">
                        <label for="gender">
                            <i class="fas fa-venus-mars"></i> Gender:
                        </label>
                        <select name="gender" id="gender" required>
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label for="bsalary">
                        <i class="fas fa-dollar-sign"></i> Basic Salary:
                    </label>
                    <input type="number" step="0.01" name="bsalary" id="bsalary" required placeholder="Enter basic salary">
                </div>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-save"></i> Update Employee
                </button>
             
            </form>
        </div>
            <a href="home.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Back to Home
        </a>
    </div>

    <script>
        // Add loading animation
        window.addEventListener('load', () => {
            document.body.classList.remove('loading');
            document.body.classList.add('loaded');
        });

        // Add form validation feedback
        const inputs = document.querySelectorAll('input, select');
        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.checkValidity()) {
                    this.style.borderColor = '#43e97b';
                } else {
                    this.style.borderColor = '#ff6b6b';
                }
            });
        });

        // Enhanced form submission with loading state
        const form = document.querySelector('form');
        const submitBtn = document.querySelector('.submit-btn');
        
        form.addEventListener('submit', function(e) {
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Updating...';
            submitBtn.disabled = true;
        });

        // Add smooth transitions
        document.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function(e) {
                if (this.getAttribute('href').endsWith('.jsp')) {
                    e.preventDefault();
                    document.body.style.opacity = '0';
                    setTimeout(() => {
                        window.location.href = this.getAttribute('href');
                    }, 300);
                }
            });
        });
    </script>
</body>
</html>