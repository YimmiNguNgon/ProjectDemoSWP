<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <link rel="stylesheet" type="text/css" href="css/footer.css">
        
        <style>
            /* Reset CSS */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }

        /* Header */


        header nav ul {
            background: #0073e6;
            padding: 15px 0;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: center;
            list-style: none;
        }

        header nav ul li {
            margin: 0 15px;
        }

        header nav ul li a {
            color: #F2F5E4;
            text-decoration: none;
            font-size: 18px;
            font-weight: bold;
            transition: color 0.3s;
        }

        header nav ul li a:hover {
            color: #F2F5E4;
        }

        
        /* Footer */
        footer {
            background: #222;
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: 30px;
        }
        .hero {
    background: linear-gradient(to right, #0000, #0000); /* Gradient màu xanh dương */
    color: black; /* Màu chữ trắng */
    padding: 50px 0; /* Padding cho phần trên và dưới */
    text-align: center; /* Căn giữa chữ */
    margin-top: 30px; /* Khoảng cách giữa các phần */
}
.hero1 {
    background: linear-gradient(to right, #0000, #0000); /* Gradient màu xanh dương */
    color: white; /* Màu chữ trắng */
    padding: 50px 0; /* Padding cho phần trên và dưới */
    text-align: center; /* Căn giữa chữ */
    margin-top: 30px; /* Khoảng cách giữa các phần */

.hero h2 {
    font-size: 2rem; /* Kích thước chữ lớn */
    font-weight: bold; /* Làm đậm chữ */
    text-transform: uppercase; /* Chữ hoa */
    letter-spacing: 2px; /* Khoảng cách giữa các chữ */
}

.hero .container {
    max-width: 1200px; /* Đảm bảo phần chứa không quá rộng */
    margin: 0 auto; /* Căn giữa phần chứa */
}

/* Responsive Design cho Hero */

}
        @media (max-width: 768px) {
            header nav ul {
                flex-direction: column;
                text-align: center;
            }

            header nav ul li {
                margin-bottom: 10px;
            }
            .hero h2 {
        font-size: 1.5rem; /* Giảm kích thước chữ khi màn hình nhỏ */
        }

        </style>
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <header>
            <div class="container_header">
                <nav>
                    <ul>
                        <li><a href="hometutor.jsp">Trang Chủ</a></li>
                        <li><a href="ProfileTuTorServlet">Thông Tin Cá Nhân</a></li>
                        <li><a href="tutorcoursesservlet">Khóa Học</a></li>
                        <li><a href="ManageReservation">Đặt lịch</a></li>
                        <li><a href="scheduleservlet">Lịch Dạy</a></li>
                        

                    </ul>
                </nav>
            </div>
        </header>

        <section class="hero">
            <div class="container">
                <h2>Chào mừng đến với trang quản lý gia sư</h2>
                
            </div>
        </section>
        <section class="hero1">
            <div class="container">
                <h2>Chào mừng đến với trang quản lý gia sư</h2>
                
            </div>
        </section>

        <%@ include file="footer.jsp" %>
    </body>
</html>
