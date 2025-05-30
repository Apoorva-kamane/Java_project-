Employee Salary Management System
A Java-based dynamic web application for managing employee records. This project supports CRUD operations and report generation using JSP, Servlets, JDBC, and MySQL. It is deployed on Apache Tomcat and developed as a Dynamic Web Project in Eclipse.

📌 Features
Add a new employee

Update existing employee information

Delete employee records using employee number

Display employee details using employee number

Reports:

Employees whose names start with a specific letter

Employees with N or more years of service

Employees earning more than a specified salary

🧮 Database Setup
Step 1: Create the Database
Open phpMyAdmin or MySQL command line from XAMPP.

Run the following SQL:

pgsql
Copy
Edit
CREATE DATABASE employee_db;

USE employee_db;

CREATE TABLE Employee (
  Empno INT PRIMARY KEY,
  EmpName VARCHAR(100),
  DoJ DATE,
  Gender VARCHAR(10),
  Bsalary DECIMAL(10,2)
);
🧑‍💻 How to Run the Project
Step 1: Clone the Repository
Download or clone this project to your computer:

bash
Copy
Edit
git clone https://github.com/yourusername/employee-salary-management.git
Or manually download the ZIP and extract it.

Step 2: Import into Eclipse
Open Eclipse IDE

Go to File > Import > Existing Projects into Workspace

Choose "Select root directory" and browse to the folder EmployeeWebApp

Finish importing

Step 3: Set Up MySQL Connection
Open EmployeeDAO.java in the src/com/dao folder

Update these values with your database credentials:

java
Copy
Edit
private final String jdbcURL = "jdbc:mysql://localhost:3306/employee_db";
private final String jdbcUsername = "root";
private final String jdbcPassword = "your_password";
Ensure MySQL is running via XAMPP

Step 4: Configure Apache Tomcat
Add Tomcat 10+ to Eclipse via Window > Preferences > Server > Runtime Environments

Right-click on the project > Run As > Run on Server

Visit:

arduino
Copy
Edit
http://localhost:8080/EmployeeWebApp/
📁 Project Structure
pgsql
Copy
Edit

EmployeeWebApp/

├── WebContent/    
│   ├── index.js   
│   ├── empadd.jsp  
│   ├── empupdate.jsp
│   ├── empdelete.jsp
│   ├── empdisplay.jsp
│   ├── reports.jsp
│   ├── report_form.jsp
│   └── report_result.jsp
├── src/
│   ├── com/
│   ├── dao/
│   │   └── EmployeeDAO.java
│   ├── model/
│   │   └── Employee.java
│   └── servlet/
│       ├── AddEmployeeServlet.java
│       ├── UpdateEmployeeServlet.java
│       ├── DeleteEmployeeServlet.java
│       ├── DisplayEmployeeServlet.java
│       ├── ReportServlet.java
│       └── ReportCriteriaServlet.java
└── WEB-INF/
    └── web.xml
    
🧪 Tools and Technologies

Java (JDK 11+)

JSP and Servlets

JDBC for database connectivity

Apache Tomcat 10+

MySQL with XAMPP

Eclipse IDE

HTML/CSS (basic)

🙌 Author
Developed by: Apoorva P
