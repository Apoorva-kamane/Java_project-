<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Employee</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
    body {
        font-family: 'Poppins', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(to right, #fceabb, #f8b500);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        transition: opacity 0.5s ease;
    }

    .form-card {
        background: #fff;
        border-radius: 20px;
        padding: 2rem;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        max-width: 400px;
        width: 100%;
        margin-bottom: 1rem;
        text-align: center;
    }

    .form-title {
        font-size: 1.8rem;
        font-weight: 600;
        color: #333;
        margin-bottom: 1.5rem;
    }

    .form-group {
        margin-bottom: 1.5rem;
        text-align: left;
    }

    .form-group label {
        font-weight: 500;
        color: #555;
        display: block;
        margin-bottom: 0.5rem;
    }

    .input-group {
        position: relative;
    }

    .input-group input {
        width: 100%;
        padding: 0.75rem 1rem;
        padding-left: 2.5rem;
        border-radius: 10px;
        border: 1px solid #ccc;
        transition: all 0.3s ease;
        font-size: 1rem;
    }

    .input-icon {
        position: absolute;
        left: 10px;
        top: 50%;
        transform: translateY(-50%);
        color: #aaa;
    }

    .delete-btn {
        background-color: #ff6b6b;
        border: none;
        color: #fff;
        padding: 0.75rem 1.5rem;
        font-size: 1rem;
        border-radius: 10px;
        cursor: pointer;
        transition: background-color 0.3s ease;
        margin-top: 1rem;
    }

    .delete-btn:hover {
        background-color: #e85050;
    }

    .back-link {
        display: inline-block;
        margin-top: 1rem;
        color: #444;
        text-decoration: none;
        font-weight: 500;
        transition: color 0.3s ease;
    }

    .back-link:hover {
        color: #000;
    }

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0,0,0,0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 10% auto;
        padding: 2rem;
        border-radius: 20px;
        max-width: 400px;
        text-align: center;
        position: relative;
    }

    .modal-icon i {
        font-size: 3rem;
        color: #f39c12;
        margin-bottom: 1rem;
    }

    .modal-title {
        font-size: 1.5rem;
        font-weight: 600;
        margin-bottom: 0.5rem;
    }

    .modal-text {
        color: #444;
        margin-bottom: 1.5rem;
    }

    .modal-buttons {
        display: flex;
        justify-content: space-around;
    }

    .btn-confirm,
    .btn-cancel {
        padding: 0.6rem 1.2rem;
        border: none;
        border-radius: 10px;
        font-weight: 500;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .btn-confirm {
        background-color: #e74c3c;
        color: white;
    }

    .btn-confirm:hover {
        background-color: #c0392b;
    }

    .btn-cancel {
        background-color: #95a5a6;
        color: white;
    }

    .btn-cancel:hover {
        background-color: #7f8c8d;
    }
</style>
    
</head>
<body>
    <div class="bg-animation"></div>


       

        <!-- Form Card -->
        <div class="form-card">
            <h2 class="form-title">
                <i class="fas fa-user-minus" style="color: #ff6b6b; margin-right: 0.5rem;"></i>
                Delete Employee
            </h2>
            
            <form id="deleteForm" action="deleteEmployee" method="post">
                <div class="form-group">
                    <label for="empno">
                        <i class="fas fa-id-badge" style="margin-right: 0.5rem; color: #ff6b6b;"></i>
                        Employee Number to Delete
                    </label>
                    <div class="input-group">
                        <input type="number" id="empno" name="empno" required placeholder="Enter employee number" min="1">
                        <i class="fas fa-hashtag input-icon"></i>
                    </div>
                </div>

                <button type="button" class="delete-btn" onclick="showConfirmation()">
                    <i class="fas fa-trash-alt" style="margin-right: 0.5rem;"></i>
                    Delete Employee
                </button>
            </form>
        </div>

        <a href="home.jsp" class="back-link">
            <i class="fas fa-arrow-left"></i>
            Back to Home
        </a>
    

    <!-- Confirmation Modal -->
    <div id="confirmModal" class="modal">
        <div class="modal-content">
            <div class="modal-icon">
                <i class="fas fa-exclamation-circle"></i>
            </div>
            <h3 class="modal-title">Confirm Deletion</h3>
            <p class="modal-text">
                Are you sure you want to delete employee #<span id="empNoDisplay"></span>?<br>
                <strong>This action cannot be undone!</strong>
            </p>
            <div class="modal-buttons">
                <button class="btn-confirm" onclick="confirmDelete()">
                    <i class="fas fa-check"></i> Yes, Delete
                </button>
                <button class="btn-cancel" onclick="closeModal()">
                    <i class="fas fa-times"></i> Cancel
                </button>
            </div>
        </div>
    </div>

    <script>
        function showConfirmation() {
            const empno = document.getElementById('empno').value;
            
            if (!empno || empno <= 0) {
                alert('Please enter a valid employee number');
                document.getElementById('empno').focus();
                return;
            }

            document.getElementById('empNoDisplay').textContent = empno;
            document.getElementById('confirmModal').style.display = 'block';
            document.body.style.overflow = 'hidden';
        }

        function closeModal() {
            document.getElementById('confirmModal').style.display = 'none';
            document.body.style.overflow = 'auto';
        }

        function confirmDelete() {
            const deleteBtn = document.querySelector('.btn-confirm');
            deleteBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Deleting...';
            deleteBtn.disabled = true;
            
            // Submit the form
            document.getElementById('deleteForm').submit();
        }

        // Close modal when clicking outside
        document.getElementById('confirmModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });

        // Close modal with Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeModal();
            }
        });

        // Input validation and formatting
        document.getElementById('empno').addEventListener('input', function(e) {
            // Remove any non-numeric characters
            this.value = this.value.replace(/[^0-9]/g, '');
            
            // Limit to reasonable employee number length
            if (this.value.length > 10) {
                this.value = this.value.slice(0, 10);
            }
        });

        // Add smooth transitions for form inputs
        document.querySelectorAll('input').forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'scale(1.02)';
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'scale(1)';
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