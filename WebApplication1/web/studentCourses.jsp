<%-- 
    Document   : menu
    Created on : Feb 12, 2025, 7:59:12 PM
    Author     : Huy
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Courses</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <style>
            /* General reset */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            /* Header and Footer Styles */
            header, footer {
                width: 100%;
                /* Adjust based on your theme */
                color: white;
                padding: 10px 0;
            }

            /* Ensure the footer is at the bottom of the page */
            footer {
                position: absolute;
                bottom: 0;
                left: 0;
                width: 100%;
            }

            /* Body content area */
            body {
                margin-top: 0; /* Remove any space from the top */
                margin-bottom: 0; /* Remove any space from the bottom */
                padding: 0;
                font-family: Arial, sans-serif;
            }

            /* Table Styles */
            .table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
                background-color: #fff;
            }

            /* Table header and body */
            .table th, .table td {
                padding: 12px 15px;
                text-align: left;
                border: 1px solid #ddd;
            }

            /* Table Header */
            .table th {
                background-color: #007bff;
                color: white;
                font-weight: bold;
                text-align: center;
            }

            /* Table Body */
            .table td {
                background-color: #f8f9fa;
                font-size: 1rem;
                color: #333;
            }

            /* Badge Styles for Course Status */
            .badge {
                padding: 5px 10px;
                font-size: 0.9rem;
                border-radius: 15px;
                color: white;
                display: inline-block;
                text-align: center;
            }

            .badge-success {
                background-color: #28a745;
            }

            .badge-warning {
                background-color: #ffc107;
            }

            /* Button Styles */
            .btn {
                padding: 8px 16px;
                font-size: 1rem;
                border-radius: 5px;
                border: none;
                color: white;
                text-decoration: none;
                display: inline-block;
                text-align: center;
            }

            .btn-primary {
                background-color: #007bff;
            }

            .btn-primary:hover {
                background-color: #0056b3;
                transform: scale(1.05);
            }

            /* Responsive adjustments */
            @media (max-width: 768px) {
                .table th, .table td {
                    padding: 10px;
                    font-size: 0.9rem;
                }

                .table {
                    font-size: 0.9rem;
                }
            }
        </style>
    </head>
    <body>
        <!--<div>
            Hiển thị danh sách khóa học mà sinh viên đang theo học kèm trạng thái tiến trình 
            (Đang diễn ra / Hoàn thành) và nút để xem danh sách điểm danh.
        </div>-->
        <%@ include file="headerStudent.jsp" %>
        <div class="container">
            <h2 class="mt-5">Tiến trình khóa học</h2>

            <c:if test="${not empty courses}">
                <table class="table table-bordered mt-3">
                    <thead>
                        <tr>
                            <th>Tên khóa học</th>
                            <th>Giới thiệu</th>
                            <th>Cấp độ</th>
                            <th>Giá</th>
                            <th>Trạng thái</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                    <!-- Duyệt qua từng Course từ danh sách. -->
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td>${course.courseName}</td>
                                <td>${course.description}</td>
                                <td>${course.level}</td>
                                <td>${course.price}</td>

                                <td>
                                    <c:choose>
                                        <c:when test="${course.courseStatus == 'Hoàn thành'}">
                                            <span class="badge badge-success">Hoàn Thành</span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-warning">Đang diễn ra</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <!-- Nút “Điểm Danh” dẫn tới servlet StudentAttendedSessionsController với studentId. -->
                                    <a class="btn btn-primary" href="StudentAttendedSessionsController?studentId=${course.studentId}">Điểm Danh</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>

            <c:if test="${empty courses}">
                <p>You have not enrolled in any courses yet.</p>
            </c:if>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <%@ include file="footer.jsp" %>
    </body>
</html>
