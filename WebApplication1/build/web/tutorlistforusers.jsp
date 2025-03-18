<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- Import JSTL taglib -->
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="headerStudent.jsp" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tutor List</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/tutorlistforusers.css">
    <style>
        /* Cấu trúc chung cho các phần của trang */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
/*    padding-top: 50px;  Tạo khoảng cách cho header */
}

/* Thêm một số padding cho container */
.container {
    padding-top: 30px;
}

/* Tiêu đề trang */
h2.text-center {
    color: #333;
    margin-bottom: 30px;
    font-size: 36px;
    font-weight: bold;
}

/* Các card gia sư */
.card {
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    background-color: #fff;
}

.card-img-top {
    max-height: 200px;
    object-fit: cover;
    width: 60%;
}

/* Thân card */
.card-body {
    display: flex;
    flex-direction: column;  /* Căn theo chiều dọc */
    justify-content: space-between;  /* Căn đều giữa các mục */
}

.card-title {
    font-size: 24px;
    font-weight: bold;
    color: #333;
}

.card-text {
    font-size: 16px;
    color: #555;
    margin-bottom: 20px;
}

/* Nút "View Detail" */
.btn-primary {
    background-color: #007bff;
    border-color: #007bff;
    padding: 10px 20px;
    border-radius: 5px;
    text-transform: uppercase;
    font-weight: bold;
}

.btn-primary:hover {
    background-color: #0056b3;
    border-color: #0056b3;
}

/* Lưới để hiển thị card gia sư */
.row {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
}

/* Mỗi card có kích thước vừa phải */
.col-md-4 {
    flex: 1 1 calc(33% - 20px); /* 3 card trên một hàng */
    box-sizing: border-box;
}

/* Thêm vào file tutorlistforusers.css */
#searchBox {
    margin-bottom: 20px;
}

.btn-secondary {
    margin-left: 10px;
}

.card {
    flex: 1 1 300px; /* Chỉ định chiều rộng tối thiểu của card */
    max-width: 350px; /* Chiều rộng tối đa của card */
    box-sizing: border-box;
    padding: 10px;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease;
}

.card:hover {
    transform: scale(1.05); /* Tăng kích thước khi hover */
}

.card-img-top {
    width: 60%;
    height: 200px; /* Cố định chiều cao ảnh */
    object-fit: cover; /* Đảm bảo ảnh không bị méo */
    border-radius: 8px;
    margin-left: 55px;
}

.card-body {
    padding: 15px;
}

.card-title {
    font-size: 1.25rem;
    font-weight: bold;
    margin-bottom: 10px;
}

.card-text {
    font-size: 1rem;
    color: #555;
}

.btn {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}
.btn-primary {
    background-color: #007bff; /* Màu nền của nút */
    color: white; /* Màu chữ */
    border: none; /* Không có viền */
    border-radius: 5px; /* Bo tròn các góc */
    padding: 10px 20px; /* Khoảng cách xung quanh chữ */
    font-size: 16px; /* Kích thước chữ */
    transition: background-color 0.3s, transform 0.3s; /* Hiệu ứng chuyển màu nền và phóng to khi hover */
    text-align: center; /* Căn giữa chữ trong nút */
    cursor: pointer; /* Chỉ thị con trỏ khi hover */
}

/* Hiệu ứng khi hover lên nút */
.btn-primary:hover {
    background-color: #0056b3; /* Màu nền khi hover */
    transform: scale(1.1); /* Phóng to nút khi hover */
}

/* Thêm hiệu ứng focus khi nhấn vào nút */
.btn-primary:focus {
    outline: none; /* Không có viền khi focus */
    box-shadow: 0 0 0 3px rgba(0, 123, 255, 0.5); /* Hiệu ứng bóng khi focus */
}

/* Thêm padding cho các thẻ p trong card để tạo khoảng cách */
.card-body p {
    margin-bottom: 10px; /* Khoảng cách giữa các dòng thông tin */
}

/* Media Queries for responsive design */
@media (max-width: 768px) {
    .card {
        flex: 1 1 100%; /* Chiều rộng 100% cho các màn hình nhỏ */
        max-width: 100%;
    }

    .card-img-top {
        height: 180px; /* Giảm chiều cao ảnh trên màn hình nhỏ */
    }
}

@media (max-width: 480px) {
    .card {
        flex: 1 1 100%; /* Chiều rộng 100% cho các màn hình rất nhỏ */
        max-width: 100%;
    }

    .card-img-top {
        height: 150px; /* Giảm chiều cao ảnh trên màn hình rất nhỏ */
    }
}
    </style>
</head>

<body>
<div class="container mt-5">
    <h2 class="text-center">Danh Sách Gia Sư</h2>
    <div class="row">
        <!-- Lặp qua danh sách gia sư và tạo các card -->
        <c:forEach var="tutor" items="${tutorList}">
            <div class="col-md-4 mb-4">
                <div class="card">
                    <img src="${tutor.imageUrl != null ? tutor.imageUrl : 'https://via.placeholder.com/150'}" class="card-img-top" alt="Tutor Image">
                    <div class="card-body">
                        <h5 class="card-title">${tutor.fullName}</h5>
                        <p class="card-text">
                            <strong>Giới tính:</strong> ${tutor.gender}</p>
                            <strong>Địa chỉ:</strong> ${tutor.address}</p>
                            <strong>Email:</strong> ${tutor.fullName}</p>
                            <strong>Số điện thoại:</strong> ${tutor.phoneNumber}</p>
                            <strong>Trình độ học vấn:</strong> ${tutor.education} <br>
                            <strong>Kinh nghiệm:</strong> ${tutor.experience} <br>
                            
                        </p>
                        <a href="TutorDetailController?tutorId=${tutor.tutorId}" class="btn btn-primary">Xem Khoá Học</a>

                    </div>
                </div>
            </div>  
        </c:forEach>
        <!-- Hiển thị thông báo nếu không có gia sư -->
        <c:if test="${empty tutorList}">
            <div class="col-12">
                <p>No tutors available.</p>
            </div>
        </c:if>
    </div>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
