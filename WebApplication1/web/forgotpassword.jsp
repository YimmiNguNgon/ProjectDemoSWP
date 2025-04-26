<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Khôi phục mật khẩu</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            max-width: 400px;
            width: 100%;
            padding: 20px;
        }
        .card {
            border: none;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }
        .btn-primary {
            border-radius: 25px;
        }
        .password-requirements {
            font-size: 0.8rem;
            color: #6c757d;
            margin-top: 5px;
        }
        .requirement {
            display: flex;
            align-items: center;
            margin-bottom: 3px;
        }
        .requirement i {
            margin-right: 5px;
            font-size: 0.7rem;
        }
        .valid {
            color: #28a745;
        }
        .invalid {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <div class="card p-4">
            <h2 class="text-center fw-bold mb-4">Khôi Phục Mật Khẩu</h2>

            <!-- Hiển thị thông báo lỗi hoặc thành công -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="alert alert-success">${message}</div>
            </c:if>

            <!-- Form gửi email khôi phục -->
            <c:choose>
                <c:when test="${empty token}">
                    <!--  Nhập email để nhận liên kết reset -->
                    <form action="forgotPassword" method="post">
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" name="email" placeholder="Nhập email của bạn" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Gửi liên kết khôi phục</button>
                        <div class="text-center mt-3">
                            <a href="login.jsp" class="text-decoration-none">Quay lại trang đăng nhập</a>
                        </div>
                    </form>
                </c:when>
                <c:otherwise>
                    <!-- Form thay đổi mật khẩu -->
                    <form action="resetPassword" method="post" id="resetForm">
                        <!-- Nhập mật khẩu mới (khi có token)-->
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="token" value="${token}">
                        <div class="mb-3">
                            <label class="form-label">Mật khẩu mới</label>
                            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="Mật khẩu mới" required>
<!--                            <div class="password-requirements">
                                <div class="requirement"><i id="length-icon" class="fas fa-circle invalid"></i> Ít nhất 8 ký tự</div>
                                <div class="requirement"><i id="uppercase-icon" class="fas fa-circle invalid"></i> Ít nhất 1 chữ hoa</div>
                                <div class="requirement"><i id="number-icon" class="fas fa-circle invalid"></i> Ít nhất 1 số</div>
                                <div class="requirement"><i id="special-icon" class="fas fa-circle invalid"></i> Ít nhất 1 ký tự đặc biệt</div>
                            </div>-->
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Xác nhận mật khẩu mới</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                            <div id="confirm-message" class="password-requirements"></div>
                        </div>
                        <button type="submit" class="btn btn-primary w-100" id="submit-btn" disabled>Cập nhật mật khẩu</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const newPassword = document.getElementById('newPassword');
            const confirmPassword = document.getElementById('confirmPassword');
            const submitBtn = document.getElementById('submit-btn');
            
            // Password validation elements
            const lengthIcon = document.getElementById('length-icon');
            const uppercaseIcon = document.getElementById('uppercase-icon');
            const numberIcon = document.getElementById('number-icon');
            const specialIcon = document.getElementById('special-icon');
            const confirmMessage = document.getElementById('confirm-message');
            
            // Password validation flags
            let isLengthValid = false;
            let isUppercaseValid = false;
            let isNumberValid = false;
            let isSpecialValid = false;
            let isConfirmValid = false;
            
            // Validate password on input
            newPassword.addEventListener('input', function() {
                const password = this.value;
                
                // Check length
                isLengthValid = password.length >= 8;
                updateIcon(lengthIcon, isLengthValid);
                
                // Check uppercase
                isUppercaseValid = /[A-Z]/.test(password);
                updateIcon(uppercaseIcon, isUppercaseValid);
                
                // Check number
                isNumberValid = /[0-9]/.test(password);
                updateIcon(numberIcon, isNumberValid);
                
                // Check special character
                isSpecialValid = /[!@#$%^&*(),.?":{}|<>]/.test(password);
                updateIcon(specialIcon, isSpecialValid);
                
                // Check if passwords match if confirm field has value
                if (confirmPassword.value) {
                    validatePasswordMatch();
                }
                
                updateSubmitButton();
            });
            
            // Validate password confirmation
            confirmPassword.addEventListener('input', validatePasswordMatch);
            
            function validatePasswordMatch() {
                const password = newPassword.value;
                const confirm = confirmPassword.value;
                
                if (password && confirm) {
                    if (password === confirm) {
                        confirmMessage.innerHTML = '<span class="valid">Mật khẩu khớp!</span>';
                        isConfirmValid = true;
                    } else {
                        confirmMessage.innerHTML = '<span class="invalid">Mật khẩu không khớp!</span>';
                        isConfirmValid = false;
                    }
                } else {
                    confirmMessage.innerHTML = '';
                    isConfirmValid = false;
                }
                
                updateSubmitButton();
            }
            
            function updateIcon(iconElement, isValid) {
                if (isValid) {
                    iconElement.classList.remove('fa-circle', 'invalid');
                    iconElement.classList.add('fa-check-circle', 'valid');
                } else {
                    iconElement.classList.remove('fa-check-circle', 'valid');
                    iconElement.classList.add('fa-circle', 'invalid');
                }
            }
            
            function updateSubmitButton() {
                if (isLengthValid && isUppercaseValid && isNumberValid && isSpecialValid && isConfirmValid) {
                    submitBtn.disabled = false;
                } else {
                    submitBtn.disabled = true;
                }
            }
            
            // Form submission validation
            document.getElementById('resetForm').addEventListener('submit', function(e) {
                if (submitBtn.disabled) {
                    e.preventDefault();
                    alert('Vui lòng đảm bảo mật khẩu đáp ứng tất cả yêu cầu và khớp nhau!');
                }
            });
        });
    </script>
</body>
</html>