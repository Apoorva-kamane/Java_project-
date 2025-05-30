<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.model.Employee" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Employees </title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    /* Reset and basics */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Poppins', 'Inter', sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #333;
        min-height: 100vh;
        padding: 20px;
        opacity: 0;
        transition: opacity 0.5s ease;
    }

    body.loaded {
        opacity: 1;
    }

    .container {
        max-width: 1000px;
        margin: 0 auto;
        background: rgba(255, 255, 255, 0.95);
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
    }

    .page-title {
        text-align: center;
        margin-bottom: 30px;
    }

    .page-title h1 {
        font-weight: 700;
        font-size: 2.8rem;
        color: #4b2ca6;
        margin-bottom: 10px;
    }

    .page-title p {
        color: #555;
        font-weight: 500;
        font-size: 1.1rem;
    }

    /* Stats cards container */
    .stats-container {
        display: flex;
        justify-content: space-around;
        margin-bottom: 30px;
        flex-wrap: wrap;
        gap: 15px;
    }

    .stat-card {
        background: #764ba2;
        color: white;
        flex: 1 1 200px;
        min-width: 200px;
        border-radius: 12px;
        padding: 20px;
        box-shadow: 0 8px 25px rgba(118, 75, 162, 0.35);
        display: flex;
        align-items: center;
        gap: 15px;
        transition: background-color 0.3s ease;
        cursor: default;
    }

    .stat-card:hover {
        background: #5e3a96;
    }

    .stat-icon {
        font-size: 2.5rem;
        opacity: 0.85;
    }

    .stat-number {
        font-size: 2.2rem;
        font-weight: 700;
    }

    .stat-label {
        font-size: 1rem;
        font-weight: 600;
        opacity: 0.85;
    }

    /* Table container and header */
    .table-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.07);
        padding: 15px 20px 25px;
    }

    .table-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        flex-wrap: wrap;
        gap: 15px;
    }

    .table-title {
        font-size: 1.5rem;
        font-weight: 700;
        color: #764ba2;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .table-title i {
        font-size: 1.7rem;
    }

    /* Search box */
    .search-box {
        position: relative;
        max-width: 250px;
        width: 100%;
    }

    .search-input {
        width: 100%;
        padding: 8px 35px 8px 12px;
        border-radius: 25px;
        border: 1.5px solid #764ba2;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    .search-input:focus {
        outline: none;
        border-color: #5e3a96;
        box-shadow: 0 0 5px #764ba2a8;
    }

    .search-icon {
        position: absolute;
        right: 12px;
        top: 50%;
        transform: translateY(-50%);
        color: #764ba2;
        font-size: 1.2rem;
        pointer-events: none;
    }

    /* Table styling */
    .table-wrapper {
        overflow-x: auto;
        border-radius: 12px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        min-width: 600px;
    }

    thead {
        background-color: #764ba2;
        color: white;
    }

    thead th {
        padding: 15px 18px;
        font-weight: 600;
        font-size: 1rem;
        text-align: left;
        white-space: nowrap;
    }

    tbody tr {
        transition: background-color 0.3s ease, transform 0.2s ease;
        cursor: default;
    }

    tbody tr:nth-child(even) {
        background-color: #f7f4ff;
    }

    tbody tr:hover {
        background-color: #ede3ff;
        transform: scale(1.02);
        box-shadow: 0 6px 12px rgba(118, 75, 162, 0.15);
    }

    tbody td {
        padding: 12px 18px;
        font-size: 0.95rem;
        color: #4a3f7a;
        white-space: nowrap;
    }

    tbody td .salary {
        font-weight: 700;
        color: #d35400;
    }

    /* Gender badges */
    .gender-badge {
        padding: 6px 12px;
        border-radius: 20px;
        font-weight: 600;
        color: white;
        font-size: 0.85rem;
        user-select: none;
    }

    .gender-male {
        background-color: #3b82f6; /* Blue */
    }

    .gender-female {
        background-color: #ec4899; /* Pink */
    }

    /* No data section */
    .no-data {
        text-align: center;
        padding: 40px 20px;
        color: #8a8a8a;
    }

    .no-data-icon {
        font-size: 4rem;
        color: #b0a7d6;
        margin-bottom: 15px;
        animation: bounce 2s infinite ease-in-out;
    }

    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-15px); }
    }

    .no-data h3 {
        font-size: 1.5rem;
        margin-bottom: 10px;
        color: #6c63ff;
    }

    .no-data p {
        font-size: 1rem;
        color: #555;
    }

    /* Back link */
    .back-link {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin-top: 25px;
        text-decoration: none;
        font-weight: 600;
        color: #764ba2;
        border: 2px solid #764ba2;
        padding: 10px 28px;
        border-radius: 25px;
        transition: all 0.3s ease;
        cursor: pointer;
        user-select: none;
    }

    .back-link i {
        font-size: 1.2rem;
    }

    .back-link:hover {
        background-color: #764ba2;
        color: white;
        box-shadow: 0 8px 25px rgba(118, 75, 162, 0.3);
        transform: translateY(-3px);
    }

    /* Responsive adjustments */
    @media (max-width: 700px) {
        .stats-container {
            flex-direction: column;
            gap: 20px;
            align-items: center;
        }

        .stat-card {
            width: 100%;
            max-width: 320px;
        }

        .table-container {
            padding: 15px 10px 20px;
        }

        thead th, tbody td {
            padding: 12px 10px;
            font-size: 0.9rem;
        }
    }
</style>
   
</head>
<body class="loading">
    <div class="bg-animation"></div>
    


    <div class="container">
        <div class="page-title">
            <h1>Employee Directory</h1>
            <p>Complete overview of your workforce and team members</p>
        </div>

        <%
        List<Employee> employees = (List<Employee>) request.getAttribute("employees");
        int totalEmployees = (employees != null) ? employees.size() : 0;
        double totalSalary = 0;
        int maleCount = 0, femaleCount = 0;
        
        if (employees != null) {
            for (Employee emp : employees) {
                totalSalary += emp.getBsalary();
                if ("Male".equals(emp.getGender())) maleCount++;
                else if ("Female".equals(emp.getGender())) femaleCount++;
            }
        }
        %>

        <div class="stats-container">
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-number"><%= totalEmployees %></div>
                <div class="stat-label">Total Employees</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-chart-line"></i>
                </div>
                <div class="stat-number">₹<%= String.format("%.0f", totalSalary/1000) %>K</div>
                <div class="stat-label">Total Salary</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon">
                    <i class="fas fa-balance-scale"></i>
                </div>
                <div class="stat-number"><%= maleCount %>/<%= femaleCount %></div>
                <div class="stat-label">Male/Female</div>
            </div>
        </div>

        <div class="table-container">
            <div class="table-header">
                <div class="table-title">
                    <i class="fas fa-table"></i>
                    Employee Report
                </div>
                <div class="search-box">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Search employees..." id="searchInput">
                </div>
            </div>

            <%
            if (employees != null && !employees.isEmpty()) {
            %>
            <div class="table-wrapper">
                <table id="employeeTable">
                    <thead>
                        <tr>
                            <th><i class="fas fa-id-badge"></i> Emp No</th>
                            <th><i class="fas fa-user"></i> Name</th>
                            <th><i class="fas fa-calendar-alt"></i> Date of Joining</th>
                            <th><i class="fas fa-venus-mars"></i> Gender</th>
                            <th><i class="fas fa-dollar-sign"></i> Basic Salary</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        for (Employee emp : employees) {
                        %>
                        <tr class="employee-row">
                            <td><span class="employee-id"><%= emp.getEmpno() %></span></td>
                            <td><span class="employee-name"><%= emp.getEmpName() %></span></td>
                            <td><%= emp.getDoJ() %></td>
                            <td>
                                <span class="gender-badge <%= emp.getGender().toLowerCase().equals("male") ? "gender-male" : "gender-female" %>">
                                    <%= emp.getGender() %>
                                </span>
                            </td>
                            <td><span class="salary">₹<%= String.format("%,.2f", emp.getBsalary()) %></span></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            <%
            } else {
            %>
            <div class="no-data">
                <div class="no-data-icon">
                    <i class="fas fa-users-slash"></i>
                </div>
                <h3>No Employees Found</h3>
                <p>Start by adding some employees to your system.</p>
            </div>
            <%
            }
            %>
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

        // Search functionality
        const searchInput = document.getElementById('searchInput');
        const employeeRows = document.querySelectorAll('.employee-row');

        if (searchInput && employeeRows.length > 0) {
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                
                employeeRows.forEach(row => {
                    const text = row.textContent.toLowerCase();
                    if (text.includes(searchTerm)) {
                        row.style.display = '';
                        row.style.animation = 'fadeIn 0.3s ease';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        }

        // Add smooth transitions for navigation
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

        // Add fade in animation for search results
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(10px); }
                to { opacity: 1; transform: translateY(0); }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>