<%-- 
    Document   : menu
    Created on : Feb 12, 2025, 7:59:12 PM
    Author     : Huy
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduOnline - Học nhanh hơn với gia sư</title>
    <link rel="stylesheet" href="css/menu.css">
    <style>
        /* Carousel Section */
.carousel {
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    gap: 1rem; /* Khoảng cách giữa nút điều hướng và ảnh */
    width: 100%; /* Đảm bảo carousel chiếm hết chiều rộng */
    max-width: 1200px; /* Tạo chiều rộng tối đa cho carousel */
    margin: 0 auto; /* Căn giữa carousel */
}

.carousel-content {
    position: relative;
    width: 100%;
    height: 400px; /* Đặt chiều cao mặc định cho carousel */
    overflow: hidden;
    margin-top: 20px;
}

.tutor-image {
    width: 100%;
    height: 95%;
    object-fit: cover; /* Đảm bảo ảnh không bị méo và luôn đầy khung */
    border-radius: 0px; /* Bo góc ảnh để tạo sự mềm mại */
    transition: transform 0.3s ease-in-out; /* Thêm hiệu ứng chuyển động mượt mà */
}

/* Nút điều hướng (prev/next) */
.carousel-button {
    background: rgba(0, 0, 0, 0.2); /* Nền trong suốt (đặt độ mờ ở mức thấp) */
    color: white;
    font-size: 2rem;
    border: none;
    cursor: pointer;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
}

.carousel-button:hover {
    
    transform: scale(1); /* Phóng to nút khi hover */
}

/* Vị trí các nút điều hướng */
.carousel-button.prev {
    left: 10px; /* Nút quay lại nằm bên trái */
}

.carousel-button.next {
    right: 10px; /* Nút tiếp theo nằm bên phải */
}

    </style>
</head>
<body>
    <%@ include file="headerStudent.jsp" %>
    
    <div class="container">
        <!-- Hero Section -->
        <section class="carousel">
            <button class="carousel-button prev" onclick="prevTutor()">&lt;</button>
            <div class="carousel-content">
                <img id="tutor-image" src="https://wonderenglishcenter.edu.vn/upload/files/chung/slide-2.png" alt="Gia sư" class="tutor-image">
            </div>
            <button class="carousel-button next" onclick="nextTutor()">&gt;</button>
        </section>


        <!-- Stats Section -->
        <section class="stats">
            <div>
                <h3 class="stat-number">Được học với</h3>
                <p>Gia sư giàu kinh nghiệm</p>
            </div>
            <div>
                <h3 class="stat-number">Các gia sư</h3>
                <p>Đến từ Bắc vào Nam</p>
            </div>
        </section>

        <!-- Tutor Carousel Section -->
        

        <!-- Guarantee Section -->
        <section class="guarantee">
            <h2 class="guarantee-title">Những bài học bạn sẽ thích. Đảm bảo.</h2>
            <p class="guarantee-text">Hãy thử một gia sư khác miễn phí nếu bạn không hài lòng.</p>
        </section>

        <!-- Become Tutor Section -->
        
    </div>

    <script>
        // JavaScript để điều khiển slider gia sư
        let tutors = [
            {
                image: "https://img.pikbest.com/origin/10/00/82/82apIkbEsTuJM.png!w700wp"
            },
            {
                image: "https://anhmy.edu.vn/wp-content/uploads/2023/12/Banner-Facebook-Ngang-Dang-ky-thi-IELST-1.jpg"
            },
            {
                image: "https://wonderenglishcenter.edu.vn/upload/files/chung/slide-2.png"
            }
        ];
        
        let currentTutor = 0;

        function updateTutor() {
            document.getElementById("tutor-image").src = tutors[currentTutor].image;
            document.getElementById("tutor-quote").innerText = tutors[currentTutor].quote;
            document.getElementById("tutor-name").innerText = tutors[currentTutor].name;
            document.getElementById("tutor-subject").innerText = tutors[currentTutor].subject;
        }

        function prevTutor() {
            currentTutor = (currentTutor - 1 + tutors.length) % tutors.length;
            updateTutor();
        }

        function nextTutor() {
            currentTutor = (currentTutor + 1) % tutors.length;
            updateTutor();
        }
    </script>
    <%@ include file="footer.jsp" %>
</body>
</html>
