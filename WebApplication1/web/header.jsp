<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EduOnline Header</title>
    <style>
        /* General Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        body {
            background-color: #f8f9fa;
        }
        /* Header Container */
        .header-container {
            width: 100%;
            background: linear-gradient(to right, #ff66b2, #ff99cc); /* Gradient background */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Mượt mà hơn */
            padding: 1rem 0;
        }
        /* Header styling */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 2rem;
        }
        /* Logo styling */
        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }
        .logo:hover {
            transform: scale(1.1);
        }
        /* Navigation Styling */
        .nav {
            display: flex;
            gap: 1.5rem;
        }
        /* Navigation Buttons */
        .nav-button {
            background: none;
            border: 2px solid white;
            font-size: 1rem;
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }
        .nav-button:hover {
            background-color: white;
            color: #ff66b2;
            transform: translateY(-3px);
        }
        /* Authentication Controls */
        .auth-controls {
            display: flex;
            align-items: center;
            gap: 1.2rem;
            font-size: 1rem;
            color: white;
        }
        /* Login Button */
        .login-button {
            background-color: white;
            border: 2px solid white;
            color: #ff66b2;
            padding: 0.6rem 1.2rem;
            font-size: 1rem;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }
        .login-button:hover {
            background-color: #ff66b2;
            color: white;
            transform: translateY(-3px);
        }
    </style>
</head>
<body>
    <div class="header-container">
        <header class="header">
            <h1 class="logo">EduOnline 🧑‍🏫</h1>
            <nav class="nav">
                <form action="findTutor.jsp" method="get">
                    <button class="nav-button" type="submit">Tìm gia sư</button>
                </form>
                <form action="becomeTutor.jsp" method="get">
                    <button class="nav-button" type="submit">Tìm khóa học</button>
                </form>
            </nav>
            <div class="auth-controls">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <!-- Nếu đã đăng nhập, chỉ hiển thị nút Đăng xuất -->
                        <form action="LogoutServlet" method="post">
                            <button class="login-button" type="submit">Đăng xuất</button>
                        </form>
                    </c:when>
                    <c:otherwise>
                        <!-- Nếu chưa đăng nhập, chỉ hiển thị nút Đăng nhập -->
                        <form action="login.jsp" method="get">
                            <button class="login-button" type="submit">Đăng nhập</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </header>
    </div>

</body>
</html>