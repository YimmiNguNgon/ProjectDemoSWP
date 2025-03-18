<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Tutor" %>
<%@ page import="model.Courses" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutor Detail</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/tutordetail.css">
    <style>
        /* Cấu hình chung cho các card chứa khóa học */
.card {
    border: 1px solid #ddd; /* Viền nhẹ cho các card */
    border-radius: 10px; /* Bo tròn góc cho các card */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Đổ bóng cho các card */
    transition: transform 0.3s ease, box-shadow 0.3s ease; /* Hiệu ứng khi hover */
}

/* Hiệu ứng khi hover vào card */
.card:hover {
    transform: scale(1); /* Phóng to card một chút */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* Tăng độ bóng khi hover */
}

/* Phần card-body, nơi chứa nội dung */
.card-body {
    padding: 20px; /* Padding cho các card-body */
    background-color: #fff; /* Nền trắng cho card */
}

/* Tiêu đề của card (tên khóa học) */
.card-title {
    font-size: 1.25rem; /* Kích thước chữ cho tiêu đề */
    font-weight: bold; /* Làm đậm tiêu đề */
    color: #333; /* Màu chữ đậm */
    margin-bottom: 15px; /* Khoảng cách dưới tiêu đề */
}

/* Phần mô tả khóa học */
.card-text {
    font-size: 14px; /* Kích thước chữ cho phần mô tả */
    color: #555; /* Màu chữ nhẹ */
    line-height: 1.6; /* Giãn dòng cho dễ đọc */
}
h3.mt-5 {
    margin-left: 20px;
    margin-top: 20px;/* Lùi vào 20px từ bên trái */
}

/* Định dạng cho các nhãn thông tin khóa học (Level, Price, etc.) */
.card-text strong {
    color: #007bff; /* Màu sắc cho các nhãn */
    font-weight: bold; /* Làm đậm nhãn */
}

/* Tạo khoảng cách giữa các phần tử thông tin khóa học */
.card-text br {
    margin-bottom: 10px; /* Khoảng cách giữa các dòng thông tin */
}

/* Các card trên màn hình nhỏ */
@media (max-width: 768px) {
    .col-md-4 {
        flex: 1 1 100%; /* Các card sẽ chiếm hết chiều rộng trên màn hình nhỏ */
        margin-bottom: 20px; /* Khoảng cách dưới mỗi card */
    }
}

    </style>
</head>
<body>

<%@ include file="headerStudent.jsp" %>

<!-- Lấy thông tin gia sư từ request -->
<c:set var="tutor" value="${requestScope.tutor}" />
<c:set var="courseList" value="${requestScope.courseList}" />

<div class="container mt-5">
    <h3 class="mt-5">Khóa học của Gia Sư ${tutor.fullName}</h3>

    <div class="row">
        <!-- Duyệt qua danh sách các khóa học -->
        <c:forEach var="course" items="${courseList}">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">${course.courseName}</h5>
                        <p class="card-text">
                            <strong>Cấp bậc:</strong> ${course.level} <br>
                            <strong>Giá khóa học:</strong> ${course.price} VND <br>
                            <strong>Số buổi:</strong> ${course.totalSessions} <br>
                            <strong>Tên khóa học</strong> ${course.description} <br>
                        </p>
                        <!-- Nút đăng ký khóa học -->
                        <a href="reservation?tutorId=${tutor.tutorId}&courseId=${course.courseID}" class="btn btn-primary">Đăng ký khóa học</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="footer.jsp" %>

</body>
</html>
