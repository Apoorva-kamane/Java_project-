<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Report |</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #667eea, #764ba2);
        color: #333;
        min-height: 100vh;
        opacity: 0;
    }

    .container {
        max-width: 800px;
        margin: 3rem auto;
        background: #fff;
        padding: 2rem 2.5rem;
        border-radius: 16px;
        box-shadow: 0 12px 25px rgba(0, 0, 0, 0.1);
    }

    .page-title {
        text-align: center;
        margin-bottom: 2rem;
    }

    .page-title h2 {
        font-size: 2rem;
        color: #444;
        margin-bottom: 0.5rem;
    }

    .page-title p {
        color: #777;
        font-size: 1rem;
    }

    .info-cards {
        display: flex;
        justify-content: space-between;
        margin-bottom: 2rem;
        gap: 1rem;
        flex-wrap: wrap;
    }

    .info-card {
        background: #f5f5f5;
        padding: 1rem;
        border-radius: 10px;
        flex: 1;
        min-width: 200px;
        text-align: center;
        transition: background 0.3s;
    }

    .info-card:hover {
        background: #ebebeb;
    }

    .info-card i {
        font-size: 1.8rem;
        margin-bottom: 0.5rem;
        color: #667eea;
    }

    .info-card h4 {
        margin: 0.5rem 0;
        color: #333;
    }

    .form-container {
        margin-top: 2rem;
    }

    .form-icon {
        text-align: center;
        font-size: 2rem;
        margin-bottom: 1rem;
        color: #667eea;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    .form-row {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
    }

    .form-group {
        flex: 1;
        display: flex;
        flex-direction: column;
    }

    label {
        margin-bottom: 0.4rem;
        font-weight: 500;
    }

    input, select {
        padding: 0.6rem 0.75rem;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input:focus, select:focus {
        outline: none;
        border-color: #667eea;
    }

    .checkbox-group {
        display: flex;
        align-items: center;
        gap: 0.75rem;
        margin-top: 1rem;
    }

    .checkbox-wrapper input {
        width: 18px;
        height: 18px;
    }

    .checkbox-label {
        font-weight: 500;
        color: #333;
    }

    .btn-group {
        display: flex;
        justify-content: space-between;
        margin-top: 1.5rem;
    }

    .submit-btn, .reset-btn {
        flex: 1;
        padding: 0.75rem;
        font-size: 1rem;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background 0.3s ease;
        color: #fff;
        margin: 0 0.5rem;
    }

    .submit-btn {
        background: #667eea;
    }

    .submit-btn:hover {
        background: #5a67d8;
    }

    .reset-btn {
        background: #ff6b6b;
    }

    .reset-btn:hover {
        background: #e64949;
    }

    .back-link-section {
        text-align: center;
        margin-top: 2rem;
    }

    .back-link {
        display: inline-block;
        text-decoration: none;
        color: #fff;
        background: rgba(255,255,255,0.2);
        padding: 0.6rem 1.2rem;
        border-radius: 8px;
        transition: background 0.3s ease;
    }

    .back-link:hover {
        background: rgba(255,255,255,0.3);
    }

    @media (max-width: 768px) {
        .info-cards {
            flex-direction: column;
        }

        .form-row {
            flex-direction: column;
        }

        .btn-group {
            flex-direction: column;
        }

        .submit-btn, .reset-btn {
            margin: 0.5rem 0;
        }
    }
</style>
    
</head>
<body>
    <div class="bg-animation"></div>
    
    <div class="header">

       
    </div>

    <div class="container">
        <div class="page-title">
            <h2>Generate Employee Report</h2>
            <p>Create customized reports with advanced filtering options</p>
        </div>

        <div class="info-cards">
            <div class="info-card">
                <i class="fas fa-filter"></i>
                <h4>Smart Filtering</h4>
                <p>Use multiple criteria to find specific employees</p>
            </div>
            <div class="info-card">
                <i class="fas fa-chart-line"></i>
                <h4>Detailed Reports</h4>
                <p>Generate comprehensive employee analytics</p>
            </div>
            <div class="info-card">
                <i class="fas fa-download"></i>
                <h4>Export Ready</h4>
                <p>Reports ready for printing and sharing</p>
            </div>
        </div>

        <div class="form-container">
            <div class="form-icon">
                <i class="fas fa-chart-bar"></i>
            </div>

            <form action="reportFilter" method="post" id="reportForm">
                <div class="form-row">
                    <div class="form-group">
                        <label for="startsWith">
                            <i class="fas fa-font"></i> Start Name With:
                        </label>
                        <input type="text" id="startsWith" name="startsWith" maxlength="1" 
                               placeholder="e.g., A" style="text-transform: uppercase;" />
                    </div>

                    <div class="form-group">
                        <label for="minYears">
                            <i class="fas fa-calendar-alt"></i> Years of Service (≥):
                        </label>
                        <input type="number" id="minYears" name="minYears" min="0" 
                               placeholder="e.g., 5" />
                    </div>
                </div>

                <div class="form-group">
                    <label for="minSalary">
                        <i class="fas fa-rupee-sign"></i> Minimum Salary (>):
                    </label>
                    <input type="number" id="minSalary" name="minSalary" min="0" step="0.01" 
                           placeholder="e.g., 30000" />
                </div>

                <div class="checkbox-group">
                    <div class="checkbox-wrapper">
                        <input type="checkbox" id="showAll" name="showAll" value="true" />
                    </div>
                    <label for="showAll" class="checkbox-label">
                        <i class="fas fa-users"></i> Show All Employees (Ignore all filters)
                    </label>
                </div>

                <div class="btn-group">
                    <button type="submit" class="submit-btn">
                        <i class="fas fa-chart-line"></i> Generate Report
                    </button>
                    <button type="reset" class="reset-btn">
                        <i class="fas fa-undo"></i> Reset Filters
                    </button>
                </div>
            </form>
        </div>

        <div class="back-link-section">
            <a href="home.jsp" class="back-link">
                <i class="fas fa-home"></i> Back to Home
            </a>
        </div>
    </div>

    <script>
        // Form validation and enhancements
        const form = document.getElementById('reportForm');
        const showAllCheckbox = document.getElementById('showAll');
        const formInputs = document.querySelectorAll('input[type="text"], input[type="number"]');

        // Handle show all checkbox
        showAllCheckbox.addEventListener('change', function() {
            formInputs.forEach(input => {
                if (this.checked) {
                    input.disabled = true;
                    input.style.opacity = '0.5';
                } else {
                    input.disabled = false;
                    input.style.opacity = '1';
                }
            });
        });

        // Auto-uppercase for name starts with
        document.getElementById('startsWith').addEventListener('input', function() {
            this.value = this.value.toUpperCase();
        });

        // Form submission validation
        form.addEventListener('submit', function(e) {
            if (!showAllCheckbox.checked) {
                const hasFilters = Array.from(formInputs).some(input => input.value.trim() !== '');
                if (!hasFilters) {
                    e.preventDefault();
                    alert('Please apply at least one filter or select "Show All Employees"');
                    return;
                }
            }
            
            // Add loading state
            const submitBtn = document.querySelector('.submit-btn');
            submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Generating...';
            submitBtn.disabled = true;
        });

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

        // Format salary input with commas
        document.getElementById('minSalary').addEventListener('input', function() {
            let value = this.value.replace(/,/g, '');
            if (value && !isNaN(value)) {
                this.value = Number(value).toLocaleString('en-IN');
            }
        });

        // Remove commas before form submission
        form.addEventListener('submit', function() {
            const salaryInput = document.getElementById('minSalary');
            salaryInput.value = salaryInput.value.replace(/,/g, '');
        });
    </script>
</body>
</html>