<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chỉnh Sửa Thông Tin Sinh Viên</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" />

    <style>
        h2, h3 {
            text-align: center;
            color: #333;
        }

        .profile {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            margin: 30px auto;
        }

        .edit-btn {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            margin-top: 20px;
        }
        
        .user-info img {
        max-width: 30%; /* Đặt chiều rộng tối đa cho ảnh */
        height: auto; /* Giữ tỷ lệ ảnh */
        border-radius: 5%; /* Làm cho ảnh thành hình tròn */
    }
        .edit-btn:hover {
            background-color: #45a049;
        }

        .course-history table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .course-history th, .course-history td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .course-history th {
            background-color: #f4f4f4;
        }

        .course-history td {
            background-color: #fafafa;
        }

        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border-radius: 8px;
            width: 80%;
            max-width: 600px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .close-btn {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
        }

        .close-btn:hover,
        .close-btn:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <%@ include file="headerStudent.jsp" %>

    <!-- Start profile section -->
    <div class="container profile">
        <h2>Thông Tin Sinh Viên</h2>
        <div class="row">
            <!-- Left column for student information -->
            <div class="col-md-6">
                <div class="user-info">
                    <div class="user-image">
                        <img src="${user.imageUrl}" alt="User Image" class="img-fluid rounded-circle" />
                    </div>
                    <div class="user-details">
                        <div><strong>Họ và Tên:</strong> ${user.fullName}</div>
                        <div><strong>Email:</strong> ${user.email}</div>
                        <div><strong>Số điện thoại:</strong> ${user.phoneNumber}</div>
                        <div><strong>Giới tính:</strong> ${user.gender}</div>
                        <div><strong>Địa chỉ:</strong> ${user.address}</div>
                    </div>
                </div>

                <!-- Edit button -->
                <button class="edit-btn" onclick="openModal()">Chỉnh sửa</button>
            </div>

            <!-- Right column for course history -->
            <div class="col-md-6 course-history">
                <h3>Lịch Sử Đăng Ký Khóa Học</h3>

                <!-- Check if there are any courses -->
                <c:if test="${not empty students}">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Tên Khóa Học</th>
                                <th>Ngày Đăng Ký</th>
                                <th>Trạng Thái</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="student" items="${students}">
                                <tr>
                                    <td>${student.course.courseName}</td>
                                    <td>
                                        <fmt:formatDate value="${student.dateJoined}" pattern="dd/MM/yyyy" />
                                    </td>
                                    <td>${student.attended ? 'Đã tham gia' : 'Chưa tham gia'}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty students}">
                    <p>Chưa đăng ký khóa học nào.</p>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Modal Edit Profile -->
    <div id="editModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h3>Chỉnh Sửa Thông Tin Sinh Viên</h3>
            <form action="editStudentProfileServlet" method="post">
                <input type="hidden" name="userId" value="${user.id}" />
        
                <div class="form-group">
                    <label>Họ tên:</label>
                    <input type="text" name="fullName" value="${user.fullName}" required />
                </div>

                <div class="form-group">
                    <label>Email:</label>
                    <input type="email" name="email" value="${user.email}" required />
                </div>

                <div class="form-group">
                    <label>Số điện thoại:</label>
                    <input type="text" name="phoneNumber" value="${user.phoneNumber}" required />
                </div>

                <div class="form-group">
                    <label>Giới tính:</label>
                    <select name="gender">
                        <option value="Nam" ${user.gender == 'Nam' ? 'selected' : ''}>Male</option>
                        <option value="Nữ" ${user.gender == 'Nữ' ? 'selected' : ''}>Female</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <input type="text" name="address" value="${user.address}" required />
                </div>

                <div class="form-group">
                    <label>Ảnh URL:</label>
                    <input type="text" name="imageUrl" value="${user.imageUrl}" />
                </div>

                <button type="submit">Lưu Thay Đổi</button>
            </form>
        </div>
    </div>

    <jsp:include page="footer.jsp"/>

    <script>
        // Open modal
        function openModal() {
            document.getElementById("editModal").style.display = "block";
        }

        // Close modal
        function closeModal() {
            document.getElementById("editModal").style.display = "none";
        }

        // Close modal when clicking outside
        window.onclick = function(event) {
            var modal = document.getElementById("editModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>

    <!-- Bootstrap JS (Optional, for some features like dropdowns, modals) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
