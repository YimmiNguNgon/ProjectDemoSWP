<%-- 
    Document   : managercourse
    Created on : Mar 6, 2025, 2:43:51 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dal.AdminDAO, java.util.List, model.Course" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Quản lý khóa học</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Quản lý khóa học</h2>

            <!-- Bộ lọc và tìm kiếm -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <input type="text" class="form-control" id="searchCourse" placeholder="Tìm kiếm khóa học...">
                </div>
                <div class="col-md-4">
                    <select class="form-control" id="filterLevel" name="level">
                        <option value="">Tất cả cấp độ</option>
                        <option value="Beginner">Beginner</option>
                        <option value="Intermediate">Intermediate</option>
                        <option value="Advanced">Advanced</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <button class="btn btn-primary btn-block">Tìm kiếm</button>
                </div>
            </div>

            <!-- Bảng hiển thị danh sách khóa học -->
            <table class="table table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>ID</th>
                        <th>Course name</th>
                        <th>Description</th>
                        <th>Level</th>
                        <th>Price</th>
                        <th>Rating</th>
                        <th>Total Sessions</th>
                        <th>Status</th>
                        <th>Verify</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${courseList}" var="course">
                        <tr>
                            <td>${course.courseId}</td>
                            <td>${course.courseName}</td>
                            <td>${course.description}</td>
                            <td>${course.level}</td>
                            <td>${course.price} VNĐ</td>
                            <td>${course.rating}</td>
                            <td>${course.totalSessions} buổi</td>
                            <td>${course.courseStatus}</td>
                            <td>${course.verify}</td>
                            <td>
                                <a href="editCourse?courseId=${course.courseId}" class="btn btn-warning btn-sm">Sửa</a>
                                <a href="deleteCourse?courseId=${course.courseId}" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div class="container mt-4">
                <a href="homeadmin.jsp" class="btn btn-secondary mb-3">🏠 Trở về trang quản trị</a>
            </div>

            <!-- Nút thêm khóa học -->
            <button class="btn btn-success" data-toggle="modal" data-target="#addCourseModal">Thêm khóa học</button>

        </div>

        <!-- Modal thêm khóa học -->
        <div class="modal fade" id="addCourseModal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="addCourse" method="POST">
                        <div class="modal-header">
                            <h4 class="modal-title">Thêm khóa học</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <label>Tên khóa học</label>
                                <input type="text" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Danh mục</label>
                                <select name="categoryId" class="form-control">
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Giá</label>
                                <input type="number" name="price" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Thời lượng (giờ)</label>
                                <input type="number" name="duration" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                            <button type="submit" class="btn btn-success">Thêm</button>
                        </div>

                    </form>

                </div>
            </div>

        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

    </body>
</html>

