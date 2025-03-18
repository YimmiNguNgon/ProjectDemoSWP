<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giới thiệu - Eduonline</title>
    <!-- Thêm Bootstrap để tạo giao diện đẹp -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
        }

        .hero-section {
            background: #17a2b8; /* Màu xanh lá cây */
            color: white;
            padding: 50px 0;
        }

        .hero-section h1 {
            font-size: 3rem;
        }

        .feature-box {
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
            text-align: center;
            margin: 20px;
        }

        .feature-box h3 {
            font-size: 1.5rem;
            margin-bottom: 15px;
        }

        .feature-box p {
            font-size: 1rem;
        }

        .container {
            margin-top: 50px;
        }

        .footer {
            background-color: #333;
            color: white;
            padding: 30px 0;
            text-align: center;
        }

        .footer a {
            color: #fff;
            text-decoration: none;
        }

        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>

    <!-- Header Section: Include your header -->
    <%@ include file="headerStudent.jsp" %>

    <!-- Hero Section -->
    <section class="hero-section text-center">
        <div class="container">
            <h1>Chào mừng đến với EduOnline!</h1>
            <p>Eduonline là nền tảng trung gian kết nối gia sư và học sinh, giúp bạn dễ dàng đăng ký học hoặc tạo khóa học</p>
        </div>
    </section>

    <!-- Features Section -->
    <section class="container">
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Đăng ký khóa học</h3>
                    <p>Học sinh có thể dễ dàng tìm kiếm và đăng ký khóa học từ các gia sư uy tín, với nhiều môn học đa dạng.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Tạo khóa học</h3>
                    <p>Gia sư có thể tự tạo khóa học của riêng mình, quản lý lịch học và nhận đánh giá từ học sinh.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Học trực tuyến</h3>
                    <p>Cả gia sư và học sinh có thể học và giảng dạy trực tuyến qua nền tảng, tiết kiệm thời gian và chi phí di chuyển.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to Action Section -->
    <section class="text-center mt-5">
        <div class="container">
            <h2>Gia sư và học sinh, bắt đầu học ngay hôm nay!</h2>
            <p>Tham gia Eduonline để trải nghiệm cách học và giảng dạy dễ dàng hơn bao giờ hết. Đăng ký và tạo khóa học ngay!</p>
            <a href="signup.jsp" class="btn btn-primary">Đăng ký ngay</a>
        </div>
    </section>

    <!-- Footer Section -->
    <%@ include file="footer.jsp" %>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>