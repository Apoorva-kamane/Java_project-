<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    /* Google Fonts - Inter & Poppins already linked in HTML */

* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
    font-family: 'Poppins', sans-serif;
}

body {
    background: linear-gradient(120deg, #667eea, #764ba2);
    min-height: 100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 2rem;
    color: #333;
}

.container {
    max-width: 500px;
    width: 100%;
    background: #ffffff;
    padding: 2.5rem 2rem;
    border-radius: 15px;
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
    animation: fadeIn 0.6s ease-in-out;
}

.form-title {
    font-size: 1.8rem;
    font-weight: 600;
    color: #333;
    margin-bottom: 1.5rem;
    text-align: center;
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    font-weight: 500;
    display: block;
    margin-bottom: 0.5rem;
}

.input-group {
    position: relative;
}

.input-group input {
    width: 100%;
    padding: 0.75rem 2.5rem 0.75rem 1rem;
    border: 1px solid #ccc;
    border-radius: 8px;
    outline: none;
    transition: border-color 0.3s;
}

.input-group input:focus {
    border-color: #667eea;
}

.input-icon {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    color: #888;
}

select {
    width: 100%;
    padding: 0.75rem 1rem;
    border: 1px solid #ccc;
    border-radius: 8px;
    outline: none;
    appearance: none;
    background-color: white;
    cursor: pointer;
    transition: border-color 0.3s;
}

select:focus {
    border-color: #667eea;
}

.submit-btn {
    width: 100%;
    padding: 0.75rem;
    background-color: #667eea;
    border: none;
    color: white;
    font-weight: 600;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.submit-btn:hover {
    background-color: #5a67d8;
}

.back-link {
    display: inline-block;
    margin-top: 1rem;
    text-decoration: none;
    color: #667eea;
    font-weight: 500;
    text-align: center;
    width: 100%;
}

.back-link i {
    margin-right: 5px;
}

/* Animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(15px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
    
    </style>
     
   
</head>
<body class="loading">
    <div class="bg-animation"></div>
    
  
    <div class="container">
        <div class="form-card">
            <h2 class="form-title">
                <i class="fas fa-user-plus" style="color: #667eea; margin-right: 0.5rem;"></i>
                Add New Employee
            </h2>
            
            <form action="addEmployee" method="post" id="employeeForm">
                <div class="form-group">
                    <label for="empno">
                        <i class="fas fa-id-badge" style="margin-right: 0.5rem; color: #667eea;"></i>
                        Employee Number
                    </label>
                    <div class="input-group">
                        <input type="number" id="empno" name="empno" required placeholder="Enter employee number">
                        <i class="fas fa-hashtag input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="empName">
                        <i class="fas fa-user" style="margin-right: 0.5rem; color: #667eea;"></i>
                        Employee Name
                    </label>
                    <div class="input-group">
                        <input type="text" id="empName" name="empName" required placeholder="Enter full name">
                        <i class="fas fa-signature input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="doj">
                        <i class="fas fa-calendar-alt" style="margin-right: 0.5rem; color: #667eea;"></i>
                        Date of Joining
                    </label>
                    <div class="input-group">
                        <input type="date" id="doj" name="doj" required>
                        <i class="fas fa-calendar-check input-icon"></i>
                    </div>
                </div>

                <div class="form-group">
                    <label for="gender">
                        <i class="fas fa-venus-mars" style="margin-right: 0.5rem; color: #667eea;"></i>
                        Gender
                    </label>
                    <select id="gender" name="gender" required>
                        <option value="" disabled selected>Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="bsalary">
                        <i class="fas fa-dollar-sign" style="margin-right: 0.5rem; color: #667eea;"></i>
                        Basic Salary
                    </label>
                    <div class="input-group">
                        <input type="number"  id="bsalary" name="bsalary" required placeholder="Enter basic salary">
                        <i class="fas fa-money-bill-wave input-icon"></i>
                    </div>
                </div>

                <button type="submit" class="submit-btn">
                    <i class="fas fa-plus-circle" style="margin-right: 0.5rem;"></i>
                    Add Employee
                </button>
            </form>
        </div>

        <a href="home.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Back to Home
        </a>
    </div>

</body>
</html>