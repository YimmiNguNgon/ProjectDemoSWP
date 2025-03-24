<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Quản lý thanh toán</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            .container {
                max-width: 1000px;
                margin-top: 40px;
            }

            .badge-processing {
                background-color: #f39c12;
            } /* Màu cam */
            .badge-completed {
                background-color: #28a745;
            }  /* Màu xanh lá */
            .badge-failed {
                background-color: #dc3545;
            } /* Màu đỏ */

            .table-hover tbody tr:hover {
                background-color: #f8f9fa;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2 class="mb-4 text-center text-primary">📋 Quản lý thanh toán</h2>

            <!-- Nút Quay lại -->
            <div class="mb-3">
                <a href="homeadmin.jsp" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> 🔙 Quay lại</a>
            </div>

            <!-- Hiển thị thông báo -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">${errorMessage}</div>
            </c:if>
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success">${successMessage}</div>
            </c:if>

            <!-- Bộ lọc tìm kiếm -->
            <div class="card p-3 mb-4">
                <form action="ManagerPayment" method="get" class="row g-3">
                    <input type="hidden" name="action" value="search">

                    <div class="col-md-5">
                        <input type="text" name="studentName" class="form-control" placeholder="🔍 Nhập tên học viên..." value="${param.studentName}">
                    </div>

                    <div class="col-md-4">
                        <select name="status" class="form-select">
                            <option value="">📌 Tất cả trạng thái</option>
                            <option value="Processing" ${param.status == 'Processing' ? 'selected' : ''}>⏳ Đang xử lý</option>
                            <option value="Completed" ${param.status == 'Completed' ? 'selected' : ''}>✅ Đã thanh toán</option>
                            <option value="Failed" ${param.status == 'Failed' ? 'selected' : ''}>❌ Thất bại</option>
                        </select>
                    </div>

                    <div class="col-md-3 d-grid">
                        <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Tìm kiếm</button>
                    </div>
                </form>
            </div>

            <!-- Bảng danh sách thanh toán -->
            <div class="table-responsive">
                <table class="table table-hover table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>🎓 Học viên</th>
                            <th>📚 Khóa học</th>
                            <th>💰 Số tiền</th>
                            <th>📅 Ngày thanh toán</th>
                            <th>📌 Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${payments}" var="payment">
                            <tr>
                                <td>${payment.paymentId}</td>
                                <td>${payment.studentName}</td>
                                <td>${payment.courseName}</td>
                                <td><strong>${payment.amount} VNĐ</strong></td>
                                <td>${payment.date}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${payment.status == 'Processing'}">
                                            <span class="badge badge-processing text-white">⏳ Đang xử lý</span>
                                        </c:when>
                                        <c:when test="${payment.status == 'Completed'}">
                                            <span class="badge badge-completed text-white">✅ Đã thanh toán</span>
                                        </c:when>
                                        <c:when test="${payment.status == 'Failed'}">
                                            <span class="badge badge-failed text-white">❌ Thất bại</span>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
