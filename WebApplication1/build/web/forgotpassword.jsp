<%-- 
    Document   : forgotpassword
    Created on : Mar 27, 2025, 12:11:04 PM
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
    /* Định dạng chung cho trang */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f7fa;
        margin: 0;
        padding: 0;
    }

    .form-container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        padding: 20px;
    }

    .form {
        background-color: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 400px;
    }

    .form h2 {
        margin-bottom: 20px;
        font-size: 24px;
        color: #333;
    }

    .mb-3 {
        margin-bottom: 15px;
    }

    .mb-3 label {
        font-size: 14px;
        color: #555;
        display: block;
        margin-bottom: 5px;
    }

    .form-control {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    .form-control:focus {
        border-color: #007bff;
        outline: none;
    }

    .btn {
        background-color: #007bff;
        color: white;
        border: none;
        padding: 12px;
        font-size: 16px;
        width: 100%;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .btn:hover {
        background-color: #0056b3;
    }

    .d-flex {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .text-decoration-none {
        color: #007bff;
        text-decoration: none;
        font-size: 14px;
    }

    .text-decoration-none:hover {
        text-decoration: underline;
    }

    /* Form thay đổi mật khẩu */
    #changePasswordForm {
        margin-top: 20px;
        display: none;
    }

    #changePasswordForm input {
        margin-bottom: 15px;
    }
</style>
    </head>
    <body>
        <div class="form-container sign-in-container">
    <div class="form">
        <h2 class="text-center fw-bold">Khôi Phục Mật Khẩu</h2>
        <form action="resetPassword" method="post" id="forgotPasswordForm">
            <div class="mb-3 text-start">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Nhập email của bạn" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Gửi liên kết khôi phục</button>
            <div class="d-flex justify-content-between align-items-center my-3">
                <a href="login.jsp" class="text-decoration-none">Quay lại trang đăng nhập</a>
            </div>
        </form>

        <!-- Sau khi người dùng nhập đúng email, hiển thị form thay đổi mật khẩu -->
        <div id="changePasswordForm" style="display: none;">
            <h2 class="text-center fw-bold">Thay Đổi Mật Khẩu</h2>
            <form action="updatePassword" method="post" id="resetPasswordForm">
                <input type="hidden" name="email" value="${email}" /> <!-- Lưu email trong form -->
                <div class="mb-3 text-start">
                    <label>Mật khẩu mới</label>
                    <input type="password" class="form-control" name="newPassword" placeholder="Mật khẩu mới" required>
                </div>
                <div class="mb-3 text-start">
                    <label>Xác nhận mật khẩu mới</label>
                    <input type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">Cập nhật mật khẩu</button>
            </form>
        </div>
    </div>
</div>

<script>
    // JavaScript để hiển thị form thay đổi mật khẩu sau khi người dùng nhập email
    document.getElementById("forgotPasswordForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Ngừng form submit mặc định
        
        var email = document.querySelector("input[name=email]").value;
        
        // Kiểm tra email hợp lệ và hiện thị form thay đổi mật khẩu
        if (email) {
            // Nếu email hợp lệ, hiển thị form thay đổi mật khẩu
            document.getElementById("changePasswordForm").style.display = "block";
        }
    });
</script>
    </body>
</html>
