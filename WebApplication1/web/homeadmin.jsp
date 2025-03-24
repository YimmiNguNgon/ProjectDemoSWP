<%-- 
    Document   : homeadmin.jsp
    Created on : Feb 27, 2025, 1:39:08 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="dal.AdminDAO" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark p-3">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <div class="auth-controls">
                <c:choose>
                    <c:when test="${not empty sessionScope.user}">
                        <span class="greeting">Xin chào, ${sessionScope.user.fullName}</span>
                        <form action="LogoutServlet" method="post">
                            <button class="login-button" type="submit">Đăng xuất</button>
                        </form>
                    </c:when>
                </c:choose>
            </div>
        </nav>

        <div class="container mt-4">
            <div class="row">
                <div class="col-md-3">
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action active">Dashboard</a>
                        <a href="manageruser" class="list-group-item list-group-item-action">Quản lý người dùng</a>
                        <a href="managertutor" class="list-group-item list-group-item-action">Quản lý gia sư</a>
                        <a href="managercourse" class="list-group-item list-group-item-action">Quản lý khóa học</a>
                        <a href="schedulemanager.jsp" class="list-group-item list-group-item-action">Quản lý lịch học</a>
                        <a href="ManagerPayment" class="list-group-item list-group-item-action">Quản lý thanh toán</a>
                        <a href="reportdashboard.jsp" class="list-group-item list-group-item-action">Báo cáo & Thống kê</a>
                        <a href="feedbacksupport.jsp" class="list-group-item list-group-item-action">Phản hồi và hỗ trợ</a>
                    </div>
                </div>

                <%
         AdminDAO dao = new AdminDAO();
        int totalStudents = dao.countStudents();
        int totalTutors = dao.countTutors();
        int totalCourse = dao.countCourse();
                %>
                <div class="col-md-9">
                    <h3>Thống kê tổng quan</h3>
                    <div class="row mt-3">
                        <div class="col-md-4">
                            <div class="card text-white bg-primary mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Student</h5>
                                    <p class="card-text"><%= totalStudents %></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-success mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Tutor</h5>
                                    <p class="card-text"><%= totalTutors %></p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-white bg-warning mb-3">
                                <div class="card-body">
                                    <h5 class="card-title">Course</h5>
                                    <p class="card-text"><%= totalCourse %></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>

