<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/hometutor.css">
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    <header>
        <div class="container">
            <nav>
                <ul>
                    <li><a href="hometutor.jsp">Trang Chủ</a></li>
                    <li><a href="ProfileTuTorServlet">Thông Tin Cá Nhân</a></li>
                    <li><a href="tutorcoursesservlet">Khóa Học</a></li>
                    <li><a href="scheduleservlet">Lịch Dạy</a></li>
                    <li><a href="contact.jsp">Liên Hệ</a></li>
                  
                </ul>
            </nav>
        </div>
    </header>

    <section class="hero">
        <div class="container">
            <h2>Chào mừng đến với trang quản lý gia sư</h2>
        </div>
    </section>


    <%@ include file="footer.jsp" %>
</body>
</html>
