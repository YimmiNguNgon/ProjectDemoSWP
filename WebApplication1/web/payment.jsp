<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thanh toán khóa học</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .course-info {
            margin-bottom: 20px;
        }
        .course-info h2 {
            color: #333;
        }
        .course-info p {
            margin: 5px 0;
        }
        .form-group {
            margin-bottom: 10px;
        }
        button {
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        button:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thông tin khóa học</h2>
        <div class="course-info">
            <h2>Online Tutor</h2>
            <p><strong>Mô tả:</strong> Học tiếng Anh cơ bản</p>
            <p><strong>Cấp độ:</strong> Beginner</p>
            <p><strong>Đánh giá:</strong> 4.8/5</p>
            <p><strong>Giá tiền:</strong> 100,000 VNĐ</p>
        </div>

        <h3>Thanh toán</h3>
        <form action="payment" method="post">
            <div class="form-group">
                <input type="text" name="courseID" value="1" readonly hidden>
            </div>
            <div class="form-group">
                <input type="text" name="totalBill" value="100000" readonly hidden>
            </div>
            <button type="submit">Thanh toán ngay</button>
        </form>
    </div>
</body>
</html>
