<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- Import JSTL taglib -->
<!DOCTYPE html>
<html lang="vi">

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
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        .container {
            padding-top: 40px;
            padding-bottom: 40px;
        }

        h2.text-center {
            color: #333;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 40px;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        /* Lưới hiển thị gia sư */
        .row {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            align-items: stretch; /* Căn chỉnh các card bằng nhau */
        }

        .col-md-4 {
            flex: 1 1 calc(33.333% - 30px);
            max-width: 360px;
            display: flex;
        }

        /* Card Gia Sư */
        .card {
            background: #fff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            padding: 20px;
            flex-grow: 1; /* Đảm bảo chiều cao đồng đều */
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.15);
        }

        .card-img-top {
            width: 165px;
            height: 210px;
            object-fit: cover;
            border-radius: 5%;
            margin-bottom: 15px;
            border: 1px solid #007bff;
        }

        .card-title {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
        }

        .card-text {
            font-size: 1rem;
            color: #555;
            margin-bottom: 15px;
            line-height: 1.5;
            flex-grow: 1; /* Đảm bảo phần nội dung luôn căng bằng nhau */
        }

        /* Nút "Xem Khoá Học" */
        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
            padding: 12px 24px;
            border-radius: 6px;
            font-weight: bold;
            transition: background-color 0.3s, transform 0.2s;
            margin-top: auto; /* Đẩy nút xuống dưới cùng của card */
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Tìm kiếm */
        /* Thanh tìm kiếm */
.search-container {
    margin-bottom: 30px;
    display: flex;
    justify-content: center; /* Căn giữa thanh tìm kiếm */
}

#searchInput {
    width: 50%; /* Chiều rộng của ô tìm kiếm */
    padding: 12px 20px; /* Thêm khoảng cách bên trong ô */
    border: 1px solid #007bff; /* Viền màu xanh dương */
    border-radius: 25px; /* Bo tròn các góc */
    font-size: 1rem; /* Kích thước chữ trong ô tìm kiếm */
    outline: none; /* Bỏ viền mặc định khi nhấp vào */
    transition: all 0.3s ease; /* Hiệu ứng chuyển tiếp khi hover */
}

#searchInput:focus {
    border-color: #0056b3; /* Thay đổi viền khi focus */
    box-shadow: 0 0 8px rgba(0, 86, 179, 0.5); /* Thêm hiệu ứng bóng mờ khi focus */
}

#searchInput::placeholder {
    color: #aaa; /* Màu chữ cho placeholder */
    font-style: italic; /* Chữ nghiêng cho placeholder */
}
    </style>
</head>

<body>
<div class="container mt-5">
    <h2 class="text-center">Danh Sách Gia Sư</h2>

    <!-- Thanh tìm kiếm -->
    <div class="search-container d-flex justify-content-center">
        <input type="text" id="searchInput" class="form-control w-50" placeholder="Tìm kiếm gia sư..." />
    </div>

    <div class="row">
        <!-- Lặp qua danh sách gia sư và tạo các card -->
        <c:forEach var="tutor" items="${tutorList}">
            <div class="col-md-4 mb-4 tutor-card">
                <div class="card">
                    <img src="${tutor.imageUrl != null ? tutor.imageUrl : 'https://via.placeholder.com/150'}" class="card-img-top" alt="Tutor Image">
                    <div class="card-body">
                        <h5 class="card-title">${tutor.fullName}</h5>
                        <p class="card-text">
                            <strong>Giới tính:</strong> ${tutor.gender}<br>
                            <strong>Địa chỉ:</strong> ${tutor.address}<br>
                            <strong>Email:</strong> ${tutor.email}<br>
                            <strong>Số điện thoại:</strong> ${tutor.phoneNumber}<br>
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

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Tìm kiếm gia sư theo tên
    document.getElementById("searchInput").addEventListener("input", function() {
        const searchQuery = this.value.toLowerCase();
        const tutors = document.querySelectorAll('.tutor-card');

        tutors.forEach(tutor => {
            const tutorName = tutor.querySelector('.card-title').textContent.toLowerCase();
            const tutorDescription = tutor.querySelector('.card-text').textContent.toLowerCase();

            if (tutorName.includes(searchQuery) || tutorDescription.includes(searchQuery)) {
                tutor.style.display = "block";
            } else {
                tutor.style.display = "none";
            }
        });
    });
</script>

</body>
</html>
