<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- Thêm JSTL -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch Dạy Của Gia Sư</title>
    <link rel="stylesheet" href="css/schedule.css">
</head>
<body>
    <header>
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
    </header>

    <section class="schedule">
        <div class="container">
            <h2>Lịch Dạy</h2>
            <table>
                <tr>
                    <th>Ngày</th>
                    <th>Giờ</th>
                    <th>Môn Dạy</th>
                    <th>Học Sinh</th>
                    <th>Chỉnh Sửa</th>
                </tr>
                <!-- Hiển thị lịch dạy từ session -->
                <c:if test="${not empty sessionScope.schedules}">
                <c:forEach var="schedule" items="${sessionScope.schedules}">
                    <tr>
                        <td>${schedule.dayOfWeek}</td>
                        <td>${schedule.startTime} - ${schedule.endTime}</td>
                        <td>${schedule.courseName}</td> <!-- Hiển thị môn học -->
                        <td>${schedule.hocSinh}</td> <!-- Hiển thị tên học sinh -->
                        <td><a href="editSchedule.jsp?scheduleID=${schedule.scheduleID}">Chỉnh Sửa</a></td>
                    </tr>
                </c:forEach>
            </c:if>
            </table>

            <a href="addschedule.jsp"><button class="add-class-btn">Thêm Lịch Dạy Mới</button></a>
        </div>
    </section>
    <jsp:include page="footer.jsp"/>
    
</body>
</html>
