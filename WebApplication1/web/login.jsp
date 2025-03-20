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
                background: linear-gradient(to right, #ff66b2, #ff99cc); /* Gradient background */
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Mượt mà hơn */
                padding: 1rem 0;
            }
            /* Header styling */
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1200px;
                margin: 0 auto;
                padding: 0 2rem;
            }
            /* Logo styling */
            .logo {
                font-size: 1.8rem;
                font-weight: bold;
                color: white;
                text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
                transition: transform 0.3s ease;
                text-decoration: none; /* Bỏ gạch chân cho logo */
            }
            .logo:hover {
                transform: scale(1.1);
            }
            /* Authentication Controls */
            .auth-controls {
                display: flex;
                align-items: center;
                gap: 1.2rem;
                font-size: 1rem;
                color: white;
            }
            .auth-controls span {
                font-size: 1.2rem;
                font-weight: bold;
            }
            /* Login Button */
            .login-button {
                background-color: white;
                border: 2px solid white;
                color: #ff66b2;
                padding: 0.6rem 1.2rem;
                font-size: 1rem;
                border-radius: 20px;
                cursor: pointer;
                transition: all 0.3s ease-in-out;
            }
            .login-button:hover {
                background-color: #ff66b2;
                color: white;
                transform: translateY(-3px);
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
                    <label>Password</label>
                    <div class="input-group">
                        <input type="password" class="form-control" name="password" id="loginPassword" placeholder="Your password" required>
                        <div class="input-group-text password-toggle" onclick="togglePassword('loginPassword')">
                            <i class="fas fa-eye"></i>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                    <a href="forgotpassword.jsp" class="text-decoration-none">Forgot your password?</a>
                </div>
                <div class="form-check my-3 text-start">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Log in</button>
                <c:if test="${not empty error}">
                    <div class="alert alert-danger mt-3">${error}</div>
                </c:if>
            </form>
        </div>
    </div>

    <!-- Sign Up Form -->
    <div class="form-container sign-up-container">
        <div class="form">
            <h2 class="text-center fw-bold">Sign Up</h2>
            
            <p class="text-center">
                Already have an account? <a href="#" onclick="toggleSignUp()">Log in</a>
            </p>
            <p class="text-center">
                <a href="signupstudent.jsp" class="text-center-student">Sign up as a student</a>
                <a href="signuptutor.jsp" class="text-center-student">Sign up as a tutor</a>
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
                <h2 id="overlayTitle">Hello, Friend!</h2>
                <p id="overlayText">Enter your details and start your journey with us.</p>
                <button class="btn btn-outline-light" onclick="toggleSignUp()">Sign Up</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    function toggleSignUp() {
        document.getElementById("loginContainer").classList.toggle("right-panel-active");
        if (document.getElementById("loginContainer").classList.contains("right-panel-active")) {
            document.getElementById("overlayTitle").innerText = "Welcome Back!";
            document.getElementById("overlayText").innerText = "If you already have an account, log in now.";
        } else {
            document.getElementById("overlayTitle").innerText = "Hello, Friend!";
            document.getElementById("overlayText").innerText = "Enter your details and start your journey with us.";
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
