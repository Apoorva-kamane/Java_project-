<%@ page import="java.util.*, com.model.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Filtered Report </title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    /* Basic reset */
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

    .container {
        max-width: 900px;
        margin: 0 auto;
        background: rgba(255, 255, 255, 0.85);
        padding: 30px 40px;
        border-radius: 15px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.1);
    }

    .page-title {
        text-align: center;
        margin-bottom: 30px;
    }

    .page-title h2 {
        font-weight: 700;
        color: #4b2ca6;
        font-size: 2.4rem;
        margin-bottom: 8px;
    }

    .page-title p {
        color: #555;
        font-weight: 500;
        font-size: 1rem;
    }

    .table-container {
        overflow-x: auto;
    }

    .employee-count {
        font-size: 1.1rem;
        font-weight: 600;
        color: #764ba2;
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .employee-count i {
        color: #967adc;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        box-shadow: 0 4px 15px rgba(118, 75, 162, 0.2);
        border-radius: 12px;
        overflow: hidden;
    }

    thead {
        background: #764ba2;
        color: white;
        text-align: left;
    }

    thead th {
        padding: 15px 20px;
        font-weight: 600;
        font-size: 1rem;
    }

    tbody tr {
        background: white;
        transition: transform 0.2s ease;
        cursor: default;
    }

    tbody tr:nth-child(even) {
        background: #f8f6ff;
    }

    tbody td {
        padding: 12px 20px;
        font-size: 0.95rem;
        color: #444;
        border-bottom: 1px solid #eee;
    }

    tbody td:first-child {
        font-weight: 600;
        color: #6a2c91;
    }

    tbody td:nth-child(5) {
        font-weight: 700;
        color: #d35400;
    }

    /* No records styling */
    .no-records {
        text-align: center;
        padding: 40px 20px;
        color: #8a8a8a;
    }

    .no-records-icon {
        font-size: 4rem;
        color: #b0a7d6;
        margin-bottom: 15px;
        animation: bounce 2s infinite ease-in-out;
    }

    @keyframes bounce {
        0%, 100% { transform: translateY(0); }
        50% { transform: translateY(-15px); }
    }

    .no-records h3 {
        font-size: 1.5rem;
        margin-bottom: 10px;
        color: #6c63ff;
    }

    .no-records p {
        font-size: 1rem;
        color: #555;
    }

    .action-section {
        margin-top: 30px;
        text-align: center;
    }

    .back-link {
        text-decoration: none;
        font-weight: 600;
        color: #764ba2;
        border: 2px solid #764ba2;
        padding: 10px 25px;
        border-radius: 25px;
        transition: all 0.3s ease;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .back-link i {
        font-size: 1.2rem;
    }

    .back-link:hover {
        background: #764ba2;
        color: white;
        box-shadow: 0 8px 25px rgba(118, 75, 162, 0.3);
        transform: translateY(-3px);
    }

    /* Scrollbar for table overflow */
    .table-container::-webkit-scrollbar {
        height: 8px;
    }

    .table-container::-webkit-scrollbar-thumb {
        background: #764ba2;
        border-radius: 8px;
    }

    .table-container::-webkit-scrollbar-track {
        background: #e0dff9;
        border-radius: 8px;
    }

    /* Responsive */
    @media (max-width: 600px) {
        .container {
            padding: 20px 15px;
        }

        thead th, tbody td {
            padding: 12px 10px;
            font-size: 0.9rem;
        }

        .page-title h2 {
            font-size: 1.8rem;
        }
    }
</style>
    
</head>
<body>
    <div class="bg-animation"></div>


    <div class="container">
        <div class="page-title">
            <h2>Filtered Employee Report</h2>
            <p>Detailed view of filtered employee records</p>
        </div>

        <%
        List<Employee> employees = (List<Employee>) request.getAttribute("filteredEmployees");
        if (employees == null || employees.isEmpty()) {
        %>
        <div class="table-container">
            <div class="no-records">
                <div class="no-records-icon">
                    <i class="fas fa-search"></i>
                </div>
                <h3>No Matching Records Found</h3>
                <p>Try adjusting your filter criteria to find employees</p>
            </div>
        </div>
        <%
        } else {
        %>
        <div class="table-container">
            <div class="employee-count">
                <i class="fas fa-users"></i> <%= employees.size() %> Employee(s) Found
            </div>
            
            <table>
                <thead>
                    <tr>
                        <th><i class="fas fa-id-badge"></i> Emp No</th>
                        <th><i class="fas fa-user"></i> Name</th>
                        <th><i class="fas fa-calendar-alt"></i> Date of Joining</th>
                        <th><i class="fas fa-venus-mars"></i> Gender</th>
                        <th><i class="fas fa-rupee-sign"></i> Basic Salary</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (Employee emp : employees) {
                    %>
                    <tr>
                        <td><%= emp.getEmpno() %></td>
                        <td><%= emp.getEmpName() %></td>
                        <td><%= emp.getDoJ() %></td>
                        <td><%= emp.getGender() %></td>
                        <td>₹<%= String.format("%,.2f", emp.getBsalary()) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <%
        }
        %>

        <div class="action-section">
            <a href="report_form.jsp" class="back-link">
                <i class="fas fa-arrow-left"></i> Back to Report Filters
            </a>
        </div>
    </div>

    <script>
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

        // Add table row hover effects
        const tableRows = document.querySelectorAll('tbody tr');
        tableRows.forEach(row => {
            row.addEventListener('mouseenter', function() {
                this.style.transform = 'scale(1.01)';
                this.style.transition = 'transform 0.2s ease';
            });
            
            row.addEventListener('mouseleave', function() {
                this.style.transform = 'scale(1)';
            });
        });
    </script>
</body>
</html>