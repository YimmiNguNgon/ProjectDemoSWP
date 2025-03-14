<%-- 
    Document   : courseTutor
    Created on : Mar 14, 2025, 10:21:37 PM
    Author     : Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="text-center">Danh sách khóa học</h2>
            <div class="row">
                <c:choose>
                    <c:when test="${not empty coursesList}">
                        <c:forEach var="course" items="${coursesList}">
                            <div class="col-md-4 mb-4">
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title">${course.courseName}</h5>
                                        <p class="card-text">${course.description}</p>
                                        <p><strong>Trình độ:</strong> ${course.level}</p>
                                        <p><strong>Giá:</strong> ${course.price} VNĐ</p>
                                        <p><strong>Đánh giá:</strong> ${course.rating} ⭐</p>
                                        <p><strong>Số buổi học:</strong> ${course.totalSessions}</p> <!-- ✅ Thêm totalSessions -->
                                        <p><strong>Trạng thái:</strong> ${course.courseStatus}</p> <!-- ✅ Thêm courseStatus -->
                                        <a href="reservation?courseId=${course.courseID}" class="btn btn-primary">Đăng kí dạy</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center">Không có khóa học nào.</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </body>
</html>
