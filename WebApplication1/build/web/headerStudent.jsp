<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

/* Body Styles */
body {
    background-color: #f8f9fa;
}

/* Header Container */
.header-container {
    width: 100%;
    background: linear-gradient(to right, #007bff, #66b3ff); /* Gradient with blue colors */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Smooth shadow */
    padding: 1rem 0;
}

/* Header Styling */
.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 2rem;
    width: 100%; /* Full width */
    flex-wrap: nowrap; /* Prevent wrapping */
}

/* Logo Styling */
.logo {
    font-size: 1.8rem;
    font-weight: bold;
    color: white;
    text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease;
    text-decoration: none; /* Remove underline for logo */
    margin-right: 50px; /* Increase space between the logo and task menu */
    white-space: nowrap; /* Prevent wrapping of logo */
}

.logo:hover {
    transform: scale(1.1);
}

/* Authentication Controls */
.auth-controls {
    display: flex;
    align-items: center;
    gap: 1.2rem; /* Space between each element */
    font-size: 1rem;
    color: white;
}

/* Greeting text */
.greeting {
    font-size: 1.2rem;
    font-weight: bold;
    margin-right: 20px;  /* Adjusted the margin for closer alignment */
    white-space: nowrap; /* Prevent wrapping */
}

/* "Thông tin cá nhân" Link */
.auth-controls a {
    padding: 0.6rem 1.2rem;
    background-color: white;
    color: #007bff; /* Blue color */
    font-size: 1rem;
    border-radius: 20px;
    text-decoration: none;
    transition: background-color 0.3s, transform 0.3s ease;
}

/* Login Button */
.login-button {
    background-color: white;
    border: 2px solid white;
    color: #007bff; /* Blue color */
    padding: 0.6rem 1.2rem;
    font-size: 1rem;
    border-radius: 20px;
    cursor: pointer;
    transition: all 0.3s ease-in-out;
}

.login-button:hover {
    background-color: #007bff; /* Blue color on hover */
    color: white;
    transform: translateY(-3px);
}

/* Task Menu Section */
.task-menu {
    display: flex;
    gap: 1.2rem;
    flex-grow: 1; /* Allow task menu to take remaining space */
    justify-content: flex-end; /* Align the menu items to the right */
    white-space: nowrap; 
    margin-right: 15px;/* Prevent wrapping of links */
}

.task-menu a {
    display: inline-block;
    padding: 0.6rem 1.2rem;
    background-color: white;
    color: #007bff; /* Blue color */
    font-size: 1rem;
    border-radius: 20px;
    text-decoration: none;
    transition: background-color 0.3s, transform 0.3s ease;
    white-space: nowrap; /* Prevent text wrapping within each link */
}

.task-menu a:hover {
    background-color: #007bff; /* Blue color on hover */
    color: white;
    transform: scale(1.05);
}

    </style>
</head>
<body>
    <div class="header-container">
        <header class="header">
            <a href="menu.jsp">
                <h1 class="logo">EduOnline</h1>
            </a>

            <!-- Task Menu Section -->
            <div class="task-menu">
                <a href="courses">Khóa Học</a>
                <a href="TutorListForUsersServlet">Gia Sư</a>
                <a href="CourseLearnController">Khóa Học Của Tôi</a>
                <a href="detail.jsp">Giới thiệu</a>
                <a href="userInfo">Thông tin cá nhân</a>
            </div>

            <!-- Authentication Controls -->
            <div class="auth-controls">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span class="greeting">Xin chào, ${sessionScope.user.fullName}</span>
                        <form action="LogoutServlet" method="post">
                            <button class="login-button" type="submit">Đăng xuất</button>
                        </form>
                    </c:when>
                    <c:otherwise>
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
