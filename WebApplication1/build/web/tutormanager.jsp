<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý gia sư</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="text-center">Quản lý Gia Sư</h2>
            <div class="d-flex justify-content-between mb-3">
                <a href="homeadmin.jsp" class="btn btn-primary">🏠 Quay lại Trang Chủ</a>

            </div>
<!--            <div class="d-flex justify-content-between mb-3">
                <button class="btn btn-success" data-toggle="modal" data-target="#addTutorModal">Thêm gia sư</button>
            </div>-->

            <table class="table table-bordered">
                <thead>
                    <tr>
                        
                        <th>ID</th>
                        <th>User ID</th>
                        <th>Education</th>
                        <th>Experience</th>
                        <th>Hourly Rate</th>
                        <th>Verified</th>
                        


                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    
                    


                        <c:forEach items="${tutorList}" var="tutor">
                            <tr>
                                <td>${tutor.tutorID}</td>
                                <td>${tutor.userID}</td>
                                <td>${tutor.education}</td>
                                <td>${tutor.experience}</td>
                                <td>${tutor.hourlyRate}</td>
                                <td>${tutor.verified ? "✔️" : "❌"}</td>
                                

                                <td>
                                    <c:if test="${!tutor.verified}">
                                        <form action="approveTutor" method="post" style="display:inline;">
                                            <input type="hidden" name="tutorID" value="${tutor.tutorID}">
                                            <button type="submit" class="btn btn-success btn-sm">Duyệt</button>
                                        </form>
                                    </c:if>
<!--                                    <a href="editTutor?id=${tutor.tutorID}" class="btn btn-warning btn-sm">Sửa</a>-->
                                    <a href="deleteTutor?id=${tutor.tutorID}" class="btn btn-danger btn-sm">Xóa</a>
                                </td>

                            </tr>
                        </c:forEach>
                    
                </tbody>
            </table>
        </div>

        <!-- Modal Thêm Gia Sư -->
        <div class="modal fade" id="addTutorModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Thêm Gia Sư</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <form action="addtutor" method="post">
                            <div class="form-group">
                                <label>User ID</label>
                                <input type="number" class="form-control" name="userID" required>
                            </div>
                            <div class="form-group">
                                <label>Trình độ học vấn</label>
                                <input type="text" class="form-control" name="education" required>
                            </div>
                            <div class="form-group">
                                <label>Kinh nghiệm</label>
                                <input type="text" class="form-control" name="experience" required>
                            </div>
                            <div class="form-group">
                                <label>Giá mỗi giờ</label>
                                <input type="number" class="form-control" name="hourlyRate" step="0.01" required>
                            </div>
                            <button type="submit" class="btn btn-success">Thêm</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
