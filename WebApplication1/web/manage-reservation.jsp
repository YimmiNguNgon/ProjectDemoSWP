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
        
        <style>
            /* Reset CSS */
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }

            body {
                background-color: #f5f5f5;
                color: #333;
                line-height: 1.6;
            }

            .container{
                width: 90%;
                max-width: 1200px;
                margin: 0 auto;
            }

            /* Header */
            header nav ul {
                background: #0073e6;
                padding: 15px 0;
                box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
                display: flex;
                justify-content: center;
                list-style: none;
            }

            header nav ul li {
                margin: 0 15px;
            }

            header nav ul li a {
                color: #F2F5E4;
                text-decoration: none;
                font-size: 18px;
                font-weight: bold;
                transition: color 0.3s;
            }

            header nav ul li a:hover {
                color: #F2F5E4;
            }

            /* Footer */
            footer {
                background: #222;
                color: white;
                text-align: center;
                padding: 15px 0;
                margin-top: 30px;
            }
        </style>
    </head>
    <body>
            <!--<div>
            Hiển thị danh sách yêu cầu tham gia khóa học mà học viên gửi tới giảng viên (tutor).
        </div>-->
        <header>
            <div class="container_header">
                <nav>
                    <ul>
                        <li><a href="hometutor.jsp">Trang Chủ</a></li>
                        <li><a href="ProfileTuTorServlet">Thông Tin Cá Nhân</a></li>
                        <li><a href="tutorcoursesservlet">Khóa Học</a></li>
                        <li><a href="ManageReservation">Đặt lịch</a></li>
                        <li><a href="scheduleservlet">Lịch Dạy</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <div class="container mt-4">
            <h2 class="mb-3">Danh sách yêu cầu khóa học</h2>

            <!-- Dropdown để lọc theo trạng thái -->
            <select id="statusFilter" class="form-select mb-3" aria-label="Lọc theo trạng thái">
                <option value="">Tất cả</option>
                <option value="Pending">Chờ duyệt</option>
                <option value="Accepted">Đã chấp nhận</option>
                <option value="Rejected">Đã từ chối</option>
            </select>

            <table class="table table-bordered">
                <thead class="table-dark">
                    <tr>
                        <th>Email học viên</th>
                        <th>Khóa học</th>
                        <th>Ngày yêu cầu</th>
                        <th>Trạng thái</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="courseRequestTableBody">
                    <c:forEach var="request" items="${courseRequests}">
                        <tr class="course-request" data-status="${request.status}">
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

        <script>
            // Function to filter table rows based on the selected status
            document.getElementById("statusFilter").addEventListener("change", function() {
                let filterValue = this.value.toLowerCase();
                let rows = document.querySelectorAll("#courseRequestTableBody .course-request");

                rows.forEach(function(row) {
                    let status = row.getAttribute("data-status").toLowerCase();
                    if (filterValue === "" || status === filterValue) {
                        row.style.display = "";
                    } else {
                        row.style.display = "none";
                    }
                });
            });
        </script>
    </body>
</html>
