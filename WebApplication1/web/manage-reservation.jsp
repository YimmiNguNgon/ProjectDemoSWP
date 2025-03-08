<%-- 
    Document   : manage-reservation
    Created on : Mar 6, 2025, 10:44:06 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Danh sách yêu cầu khóa học</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/hometutor.css">
    </head>
    <body>
        <div class="container">
                <nav>
                    <ul>
                        <li><a href="hometutor.jsp">Trang Chủ</a></li>
                        <li><a href="ProfileTuTorServlet">Thông Tin Cá Nhân</a></li>
                        <li><a href="tutorcoursesservlet">Khóa Học</a></li>
                        <li><a href="ManageReservation">Đặt lịch</a></li>
                        <li><a href="scheduleservlet">Lịch Dạy</a></li>
                        <li><a href="contact.jsp">Liên Hệ</a></li>

                    </ul>
                </nav>
            </div>
        <div class="container mt-4">
            <h2 class="mb-3">Danh sách yêu cầu khóa học</h2>
            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>ID Yêu cầu</th>
                        <th>ID Học viên</th>
                        <th>Tên Học viên</th>
                        <th>Khóa học</th>
                        <th>Ngày yêu cầu</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="request" items="${courseRequests}">
                        <tr>
                            <td>${request.requestId}</td>
                            <td>${request.studentId}</td>
                            <td>${request.user.fullName}</td>
                            <td>${request.course.courseName}</td>
                            <td>${request.requestDate}</td>
                            <td>${request.status}</td>
                            <td>
                                <c:if test="${request.status == 'Pending'}">
                                    <form method="post" action="ManageReservation" style="display: inline;">
                                        <input type="hidden" name="requestId" value="${request.requestId}">
                                        <button type="submit" name="action" value="accept" class="btn btn-success btn-sm">Chấp nhận</button>
                                    </form>
                                    <form method="post" action="ManageReservation" style="display: inline;">
                                        <input type="hidden" name="requestId" value="${request.requestId}">
                                        <button type="submit" name="action" value="reject" class="btn btn-danger btn-sm">Từ chối</button>
                                    </form>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </body>
</html>
