<%@ page import="com.model.Employee" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display Employee |</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 2rem;
        background: #f0f4f8;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        min-height: 100vh;
    }

    .form-container {
        background: #ffffff;
        padding: 2rem 2.5rem;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
        width: 100%;
        max-width: 500px;
    }

    h2 {
        text-align: center;
        margin-bottom: 1.5rem;
        color: #2c3e50;
    }

    form {
        display: flex;
        flex-direction: column;
        gap: 1rem;
    }

    label {
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    input[type="text"] {
        padding: 0.6rem;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 1rem;
        transition: border-color 0.3s ease;
    }

    input[type="text"]:focus {
        outline: none;
        border-color: #3498db;
    }

    input[type="submit"] {
        background-color: #3498db;
        color: white;
        border: none;
        padding: 0.6rem;
        border-radius: 8px;
        font-size: 1rem;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    .message {
        background-color: #fce4ec;
        color: #c2185b;
        border-left: 5px solid #c2185b;
        padding: 0.75rem 1rem;
        margin-top: 1.5rem;
        border-radius: 8px;
    }

    table {
        margin-top: 1.5rem;
        width: 100%;
        border-collapse: collapse;
    }

    table td {
        padding: 0.75rem;
        border-bottom: 1px solid #eee;
    }

    table td strong {
        font-weight: 600;
        color: #2c3e50;
    }

    h3 {
        margin-top: 2rem;
        margin-bottom: 1rem;
        color: #34495e;
    }

    .back-link {
        display: inline-block;
        margin-top: 1.5rem;
        text-decoration: none;
        color: #3498db;
        font-weight: 600;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #21618c;
    }
</style>
   
</head>
<body>

    

    <div class="form-container">
        <h2>Display Employee</h2>
        <form method="post" action="displayEmployee">
            <label>Enter Employee Number (Empno):</label>
            <input type="text" name="empno" required />
            <input type="submit" value="Display" />
        </form>

        <%
            Employee emp = (Employee) request.getAttribute("employee");
            String message = (String) request.getAttribute("message");

            if (message != null) {
        %>
            <div class="message"><%= message %></div>
        <%
            }

            if (emp != null) {
        %>
            <h3>Employee Details:</h3>
            <table>
                <tr><td><strong>Emp No</strong></td><td><%= emp.getEmpno() %></td></tr>
                <tr><td><strong>Name</strong></td><td><%= emp.getEmpName() %></td></tr>
                <tr><td><strong>Date of Joining</strong></td><td><%= emp.getDoJ() %></td></tr>
                <tr><td><strong>Gender</strong></td><td><%= emp.getGender() %></td></tr>
                <tr><td><strong>Basic Salary</strong></td><td><%= emp.getBsalary() %></td></tr>
            </table>
        <%
            }
        %>
    </div>

    <a href="home.jsp" class="back-link">← Back to Home</a>

</body>
</html>
