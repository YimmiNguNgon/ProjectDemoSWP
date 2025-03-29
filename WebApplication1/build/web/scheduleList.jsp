<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản lý lịch dạy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        .table-header {
            background-color: #007bff;
            color: white;
        }
        .action-btns .btn {
            margin-right: 5px;
        }
        h2 {
            color: #007bff;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">LỊCH DẠY CỦA GIA SƯ</h2>
        <a href="homeadmin.jsp" class="btn btn-primary">🏠 Quay lại Trang Chủ</a>
        <!-- Dropdown lọc theo ngày -->
        <div class="row mb-3">
            <div class="col-md-4">
                <select id="dayFilter" class="form-select">
                    <option value="">Tất cả các ngày</option>
                    <option value="Monday">Thứ Hai</option>
                    <option value="Tuesday">Thứ Ba</option>
                    <option value="Wednesday">Thứ Tư</option>
                    <option value="Thursday">Thứ Năm</option>
                    <option value="Friday">Thứ Sáu</option>
                    <option value="Saturday">Thứ Bảy</option>
                    <option value="Sunday">Chủ Nhật</option>
                </select>
            </div>
        </div>
        
        <table class="table table-bordered table-hover">
            <thead class="table-header">
                <tr>
                    <th>Ngày</th>
                    <th>Giờ</th>
                    <th>Hành động</th>
                    
                </tr>
            </thead>
            <tbody>
                <c:forEach var="schedule" items="${schedules}">
                    <tr class="schedule-row" data-day="${schedule.dayOfWeek}">
                        <td>${schedule.dayOfWeek}</td>
                        <td>${schedule.startTime} - ${schedule.endTime}</td>
                        
                        <td class="action-btns">
                            <a href="editSchedule?id=${schedule.scheduleID}" class="btn btn-sm btn-warning">Sửa</a>
                            <a href="deleteSchedule?id=${schedule.scheduleID}" 
                               class="btn btn-sm btn-danger"
                               onclick="return confirm('Bạn chắc chắn muốn xóa lịch này?')">Xóa</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <a href="addSchedule.jsp" class="btn btn-primary">Thêm lịch dạy mới</a>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Lọc theo ngày
        document.getElementById("dayFilter").addEventListener("change", function() {
            const filterValue = this.value.toLowerCase();
            const rows = document.querySelectorAll(".schedule-row");
            
            rows.forEach(row => {
                const day = row.getAttribute("data-day").toLowerCase();
                if (filterValue === "" || day === filterValue.toLowerCase()) {
                    row.style.display = "";
                } else {
                    row.style.display = "none";
                }
            });
        });
    </script>
</body>
</html>