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
                    <form action="resetPassword" method="post">
                        <input type="hidden" name="email" value="${email}">
                        <input type="hidden" name="token" value="${token}">
                        <div class="mb-3">
                            <label class="form-label">Mật khẩu mới</label>
                            <input type="password" class="form-control" name="newPassword" placeholder="Mật khẩu mới" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Xác nhận mật khẩu mới</label>
                            <input type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Cập nhật mật khẩu</button>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>