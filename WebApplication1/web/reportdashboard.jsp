<%-- 
    Document   : reportdashboard
    Created on : Mar 6, 2025, 3:50:47 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Báo cáo & Thống kê</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Báo cáo & Thống kê</h2>

            <!-- Thống kê tổng quan -->
            <div class="row text-center">
                <div class="col-md-4">
                    <div class="card bg-primary text-white p-3">
                        <h4>Học viên</h4>
                        <h2>${totalStudents}</h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-success text-white p-3">
                        <h4>Khóa học</h4>
                        <h2>${totalCourses}</h2>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-white p-3">
                        <h4>Gia sư</h4>
                        <h2>${totalTutors}</h2>
                    </div>
                </div>
            </div>

            <!-- Biểu đồ doanh thu -->
            <div class="mt-5">
                <h4>Doanh thu theo tháng</h4>
                <canvas id="revenueChart"></canvas>
            </div>

            <!-- Thống kê số lượng học viên theo khóa học -->
            <div class="mt-5">
                <h4>Học viên theo khóa học</h4>
                <table class="table table-bordered">
                    <thead class="thead-dark">
                        <tr>
                            <th>Khóa học</th>
                            <th>Số học viên</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${courseStatistics}" var="course">
                        <tr>
                            <td>${course.name}</td>
                            <td>${course.studentCount}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <script>
            var revenueData = {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                        label: 'Doanh thu (VNĐ)',
                        data: ${monthlyRevenue},
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 2
                    }]
            };

            var ctx = document.getElementById('revenueChart').getContext('2d');
            new Chart(ctx, {
                type: 'line',
                data: revenueData
            });
        </script>
    </body>
</html>

