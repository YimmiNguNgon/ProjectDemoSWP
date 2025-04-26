<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | EduOnline</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/login.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <style>
            /* General Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}
body {
    background-color: #f8f9fa;
}

/* Header Container */
.header-container {
    width: 100%;
    background: linear-gradient(to right, #4a6fa5, #6b8cae); /* Gradient xanh dương */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 1rem 0;
}

/* Form Styles - New Color Scheme */
#loginForm {
    max-width: 400px;
    margin: 0 auto;
    background-color: #ffffff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(74, 111, 165, 0.15); /* Shadow màu xanh nhạt */
    border: 1px solid #e1e8ed;
}

/* Input Fields */
.form-control {
    border-radius: 8px;
    padding: 12px 15px;
    font-size: 1rem;
    border: 1px solid #d1d9e6;
    margin-bottom: 20px;
    transition: all 0.3s ease;
}

.form-control:focus {
    border-color: #4a6fa5;
    box-shadow: 0 0 0 3px rgba(74, 111, 165, 0.2);
}

/* Labels */
#loginForm label {
    font-size: 1rem;
    font-weight: 600;
    color: #4a6fa5; /* Màu xanh đậm */
    margin-bottom: 8px;
    display: block;
}

/* Buttons */
.btn-login {
    background-color: #4a6fa5;
    color: white;
    padding: 14px;
    font-size: 1.1rem;
    font-weight: 600;
    border-radius: 8px;
    width: 100%;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 10px;
}

.btn-login:hover {
    background-color: #3a5a8f;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(74, 111, 165, 0.3);
}

/* Links */
.text-start a, 
.text-center p a {
    color: #4a6fa5;
    text-decoration: none;
    transition: color 0.2s ease;
}

.text-start a:hover, 
.text-center p a:hover {
    color: #3a5a8f;
    text-decoration: underline;
}

/* Password Toggle */
.password-toggle i {
    color: #4a6fa5;
}

/* Separator */
.separator hr {
    border-color: #e1e8ed;
}

.text-or {
    color: #6b8cae;
}

/* Social Buttons */
.social-login .btn {
    border-color: #e1e8ed;
    color: #4a6fa5;
}

.social-login .btn:hover {
    background-color: #f5f8fa;
    border-color: #d1d9e6;
}

/* Remember Me Checkbox */
.form-check-input:checked {
    background-color: #4a6fa5;
    border-color: #4a6fa5;
}

/* Error Messages */
.alert {
    background-color: #fff3f3;
    border-color: #ffd6d6;
    color: #d32f2f;
}

/* Header Elements */
.logo {
    color: white;
}

.auth-controls {
    color: white;
}

.login-button {
    background-color: white;
    color: #4a6fa5;
    border: 2px solid white;
}

.login-button:hover {
    background-color: rgba(255, 255, 255, 0.9);
    color: #3a5a8f;
}
            a {
                text-decoration: none;
            }
            
            #loginForm {
    max-width: 400px;
    margin: 0 auto;
    background-color: #fff;
    padding: 30px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

#loginForm .mb-3 {
    margin-bottom: 15px;
}

#loginForm label {
    font-size: 1rem;
    font-weight: 600;
    color: #333;
}

#loginForm .form-control {
    border-radius: 5px;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ccc;
}

#loginForm .form-control:focus {
    border-color: #007bff; /* Blue border when focused */
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5); /* Light blue shadow */
}

#loginForm .input-group {
    position: relative;
}

.password-toggle {
    position: absolute;
    right: 10px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}

.password-toggle i {
    font-size: 1.2rem;
    color: #007bff;
}

/* Forgot Password and Remember Me Links */
#loginForm .d-flex {
    margin-top: 10px;
}

#loginForm .text-start a {
    color: #007bff;
    text-decoration: none;
}

#loginForm .text-start a:hover {
    text-decoration: underline;
}

/* Remember Me checkbox */
#loginForm .form-check-label {
    font-size: 0.9rem;
    color: #333;
}

/* Submit Button */
#loginForm button {
    padding: 12px;
    font-size: 1.1rem;
    font-weight: 600;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

#loginForm button:hover {
    background-color: #0056b3; /* Darker blue on hover */
}

/* Error Message */
#loginForm .alert {
    margin-top: 15px;
    text-align: center;
    font-size: 1rem;
}

.form {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

h2.text-center {
    font-size: 2rem;
    color: #333;
    margin-bottom: 20px;
}

.social-login {
    margin-bottom: 20px;
}

.social-login .btn {
    padding: 12px 20px;
    font-size: 1rem;
    font-weight: 600;
    border-radius: 5px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-color: #ffffff;
    border: 1px solid #ddd;
    transition: all 0.3s ease;
}

.social-login .btn:hover {
    background-color: #f1f1f1;
}

.social-login .btn i {
    margin-right: 10px;
    font-size: 1.2rem;
}

/* Separator between "or" */
.separator {
    display: flex;
    align-items: center;
    margin: 20px 0;
}

.separator hr {
    flex-grow: 1;
    border: 1px solid #ddd;
}

.text-or {
    color: #888;
    font-weight: bold;
}

/* Links for Student and Tutor Sign Up */
.text-center p a {
    color: #007bff;
    text-decoration: none;
    margin: 5px;
}

.text-center p a:hover {
    text-decoration: underline;
}

/* Input fields */
.form-control {
    border-radius: 5px;
    padding: 10px;
    font-size: 1rem;
    border: 1px solid #ddd;
    margin-bottom: 15px;
}

.form-control:focus {
    border-color: #007bff;
    box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

/* Password Toggle */
.password-toggle {
    cursor: pointer;
}

.password-toggle i {
    font-size: 1.2rem;
    color: #007bff;
}

/* Submit Button */
.btn-login {
    background-color: #007bff;
    color: white;
    padding: 12px;
    font-size: 1.1rem;
    font-weight: 600;
    border-radius: 5px;
    width: 100%;
    border: none;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-login:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}
        </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="login-container" id="loginContainer">
    <!-- Sign In Form -->
    <div class="form-container sign-in-container">
        <div class="form">
            <h2 class="text-center fw-bold">Đăng Nhập</h2>
<!--            <p class="text-center">
                <a href="signupstudent.jsp" class="text-center-student">Sign up as a student</a>
                <a href="signuptutor.jsp" class="text-center-student">Sign up as a tutor</a>
            </p>-->
<!--            <div class="social-login">
                <button class="btn btn-outline-dark w-100 d-flex align-items-center justify-content-center">
                    <i class="fab fa-google me-2"></i> Continue with Google
                </button>
            </div>
            <div class="separator d-flex align-items-center my-3">
                <hr class="flex-grow-1">
                <span class="mx-2 text-or">or</span>
                <hr class="flex-grow-1">
            </div>-->
            <form action="login" method="post" id="loginForm">
                <div class="mb-3 text-start">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Your email" required>
                </div>
                <div class="mb-3 text-start">
                    <label>Mật khẩu</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="password" id="loginPassword" placeholder="Your password" required>
                        <div class="input-group-text password-toggle" onclick="togglePassword('loginPassword')">
                            <i class="fas fa-eye"></i>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <a href="forgotpassword.jsp" class="text-decoration-none">Quên mật khẩu ?</a>
                </div>
                <div class="form-check my-3 text-start">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Ghi nhớ tôi</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng Nhập</button>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">${error}</div>
                </c:if>
            </form>
        </div>
    </div>

    <!-- Sign Up Form -->
    <div class="form-container sign-up-container">
        <div class="form">
            <h2 class="text-center fw-bold">Đăng Nhập</h2>
            
            <p class="text-center">
                Bạn đã có tài khoản ? <a href="#" onclick="toggleSignUp()">Đăng nhập</a>
            </p>
            <p class="text-center">
                <a href="signupstudent.jsp" class="text-center-student">Đăng kí Học Sinh</a>
                <a href="signuptutor.jsp" class="text-center-student">Đăng kí Gia Sư</a>
            </p>
            <form action="registerServlet" method="post">
<!--                <div class="mb-3 text-start">
                    <label>Full Name</label>
                    <input type="text" class="form-control" name="fullname" placeholder="Your full name" required>
                </div>
                <div class="mb-3 text-start">
                    <label>Email</label>
                    <input type="email" class="form-control" name="email" placeholder="Your email" required>
                </div>

                <div class="mb-3 text-start">
                    <label>Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="password" placeholder="Your password" required>
                        <div class="input-group-text password-toggle">
                            <i class="fas fa-eye"></i>
                        </div>
                    </div>
                </div>-->

<!--                <div class="d-flex justify-content-between align-items-center">
                    <a href="#" class="forgot-password">Forgot your password?</a>
                </div>-->

<!--                <button type="submit" class="btn-login">Sign Up</button>-->
            </form>
        </div>
    </div>

    <!-- Overlay Panel -->
    <div class="overlay-container" id="overlayContainer">
        <div class="overlay">
            <div class="text-wrapper">
                <h2 id="overlayTitle">Xin chàooooo !</h2>
                <p id="overlayText">Nhập thông tin của bạn và bắt đầu hành trình cùng EduOnline</p>
                <button class="btn btn-outline-light" onclick="toggleSignUp()">Đăng Kí</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function toggleSignUp() {
        document.getElementById("loginContainer").classList.toggle("right-panel-active");
        if (document.getElementById("loginContainer").classList.contains("right-panel-active")) {
            document.getElementById("overlayTitle").innerText = "Chào mừng bạn đã quay trở lại!";
            
        } else {
            document.getElementById("overlayTitle").innerText = "Xin chàooooo !";
            document.getElementById("overlayText").innerText = "Nhập thông tin của bạn và bắt đầu hành trình cùng EduOnline";
        }
    }

    function togglePassword(fieldId) {
        let input = document.getElementById(fieldId);
        let icon = input.nextElementSibling.querySelector("i");
        if (input.type === "password") {
            input.type = "text";
            icon.classList.replace("fa-eye", "fa-eye-slash");
        } else {
            input.type = "password";
            icon.classList.replace("fa-eye-slash", "fa-eye");
        }
    }
</script>
<script src="resources/script/jquery-3.7.1.min.js"></script>

</body>
</html>
