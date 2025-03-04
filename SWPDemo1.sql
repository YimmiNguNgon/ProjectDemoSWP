USE [master]
GO

CREATE DATABASE SWPDemo1
-- Tạo cơ sở dữ liệu

-- Bảng: Users
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    role_id INT NOT NULL,
    Name NVARCHAR(100) NOT NULL, -- Tên của người dùng
    Email NVARCHAR(100) UNIQUE NOT NULL, -- Email người dùng, đảm bảo duy nhất
    Password NVARCHAR(100) NOT NULL, -- Thêm trường Password
    Phone NVARCHAR(15),-- Số điện thoại (không bắt buộc)
	Gender NVARCHAR(10) CHECK (Gender IN ('Nam', 'Nữ')), -- Giới tính với giá trị cố định
    Address NVARCHAR(255)
);
ALTER TABLE Users
ADD Gender NVARCHAR(10) CHECK (Gender IN ('Nam', 'Nữ')), -- Giới tính với giá trị cố định
    Address NVARCHAR(255);

CREATE TABLE Role (
    role_id INT PRIMARY KEY IDENTITY(1,1),
    role_name NVARCHAR(20) NOT NULL UNIQUE
);
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT INTO [dbo].[Role] ([role_id], [role_name]) 
VALUES 
(1, N'Admin'),
(2, N'Staff'),
(3, N'Tutor'),
(4, N'Student');
SET IDENTITY_INSERT [dbo].[Role] OFF;


VALUES 
(1, N'Ha Duc Huy',  'admin@gmail.com',  '123456',  '0336143011'), -- Admin
(2, N'Trần Thị B',  'staff@gmail.com',  '1234566',  '0978123456'), -- Staff
(3, N'Lê Văn C',  'tutor@gmail.com',  '123456',  '0962345678'), -- Tutor
(4, N'Phạm Thị D',  'student@gmail.com',  '123456',  '0953456789'); -- Student

INSERT INTO Users (role_id, Name, Email, Password, Phone)
VALUES 
(3, N'Lê Văn F', 'tutor1@gmail.com', '123456', '0962345678'), -- Gia sư 1
(3, N'Phạm Thị D', 'tutor2@gmail.com', '123456', '0953456789'); -- Gia sư 2

INSERT INTO Users (role_id, Name, Email, Password, Phone)
VALUES
(4, N' Hà Đức N', 'student2@gmail.com', '123456', '0336143030'),
(4, N' Nguyễn Minh Đ', 'student3@gmail.com', '123456', '0336141111'),
(4, N' Nguyễn Vũ Tường V', 'student4@gmail.com', '123456', '0336142222');

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    CourseName NVARCHAR(100) NOT NULL, -- Tên khóa học
    Description NVARCHAR(MAX), -- Mô tả khóa học
    Level NVARCHAR(20) NOT NULL CHECK (Level IN ('Beginner', 'Intermediate', 'Advanced')), -- Cấp độ khóa học
    Price DECIMAL(10, 2) NOT NULL, -- Giá của khóa học
    Rating FLOAT, -- Đánh giá trung bình của khóa học
    Category NVARCHAR(50) NOT NULL -- Thêm trường Category
);
INSERT INTO Courses (CourseName, Description, Level, Price, Rating, Category)
VALUES 
(N'English for Beginners', N'Học tiếng Anh cơ bản', 'Beginner', 100000, 4.5, 'Language'),
(N'Math 101', N'Môn Toán cơ bản', 'Beginner', 150000, 4.2, 'Mathematics'),
(N'Biology 101', N'Môn Sinh cơ bản', 'Beginner', 150000, 4.2, 'Biology');
INSERT INTO Courses (CourseName, Description, Level, Price, Rating, Category)
VALUES 
-- Khóa học cấp độ Intermediate
(N'English Intermediate', N'Học tiếng Anh trình độ trung cấp', 'Intermediate', 120000, 4.6, 'Language'),
(N'Math Intermediate', N'Môn Toán trình độ trung cấp', 'Intermediate', 170000, 4.3, 'Mathematics'),
(N'Biology Intermediate', N'Môn Sinh trình độ trung cấp', 'Intermediate', 180000, 4.4, 'Biology'),

-- Khóa học cấp độ Advanced
(N'English Advanced', N'Học tiếng Anh trình độ cao cấp', 'Advanced', 140000, 4.8, 'Language'),
(N'Math Advanced', N'Môn Toán trình độ cao cấp', 'Advanced', 200000, 4.5, 'Mathematics'),
(N'Biology Advanced', N'Môn Sinh trình độ cao cấp', 'Advanced', 220000, 4.7, 'Biology');

-- Bảng: Tutors
CREATE TABLE Tutors (
    TutorID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    UserID INT NOT NULL, -- Khóa ngoại liên kết với bảng Users
    Education NVARCHAR(200), -- Trình độ học vấn của gia sư
    Experience NVARCHAR(100), -- Kinh nghiệm làm việc của gia sư
    HourlyRate DECIMAL(10, 2), -- Giá mỗi giờ dạy
    Verified BIT DEFAULT 0, -- Trạng thái xác minh gia sư (0: chưa xác minh, 1: đã xác minh)
    FOREIGN KEY (UserID) REFERENCES Users(UserID) -- Ràng buộc khóa ngoại liên kết với Users
);

INSERT INTO Tutors (UserID, Education, Experience, HourlyRate, Verified)
VALUES 
(3, N'Giáo viên Tiếng Anh, Cử nhân Đại học Sư phạm', N'5 năm giảng dạy Tiếng Anh', 250000, 1), -- Gia sư 1
(4, N'Giáo viên Toán học, Cử nhân Đại học Khoa học Tự nhiên', N'3 năm giảng dạy Toán', 200000, 0), -- Gia sư 2
(5, N'Giáo viên Sinh học, Cử nhân Đại học Khoa học Tự nhiên', N'8 năm giảng dạy Sinh ', 300000, 0)-- Gia sư 3
CREATE TABLE TutorCourses (
    TutorCourseID INT PRIMARY KEY IDENTITY(1,1), -- ID tự tăng
    TutorID INT NOT NULL, -- Khóa ngoại tham chiếu đến Tutors
    CourseID INT NOT NULL, -- Khóa ngoại tham chiếu đến Courses
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

DELETE FROM TutorCourses;

INSERT INTO TutorCourses (TutorID, CourseID)
VALUES 
INSERT INTO TutorCourses (TutorID, CourseID)
VALUES 
(1, 1), -- Lê Văn C dạy English for Beginners
(1, 4), -- Lê Văn C dạy English Intermediate
(1, 7); -- Lê Văn C dạy English Advanced

-- Bảng: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    UserID INT NOT NULL, -- Khóa ngoại liên kết với bảng Users
    CourseID INT NOT NULL, -- Thêm trường CourseID
    DateJoined DATETIME DEFAULT GETDATE(), -- Thời điểm tham gia, mặc định là thời gian hiện tại
    FOREIGN KEY (UserID) REFERENCES Users(UserID), -- Ràng buộc khóa ngoại liên kết với Users
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Thêm học sinh vào bảng Students
INSERT INTO Students (UserID, CourseID)
VALUES 
(4, 1),  -- Học sinh với UserID = 4 tham gia khóa học 1
(8, 2),
(9, 3),
(10,1);  -- Học sinh với UserID = 5 tham gia khóa học 2
SET IDENTITY_INSERT Students ON;  

INSERT INTO Students (StudentID, UserID, CourseID, DateJoined)
VALUES (1, 4, 1, GETDATE());  

SET IDENTITY_INSERT Students OFF;

-- Bảng: Schedules
CREATE TABLE Schedules (
    ScheduleID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    StudentID INT NOT NULL, -- Thêm trường StudentID
    DayOfWeek NVARCHAR(20) NOT NULL CHECK (DayOfWeek IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')), -- Ngày trong tuần
    StartTime TIME NOT NULL CHECK (StartTime >= '08:00:00'), -- Thời gian bắt đầu (ít nhất 8:00 sáng)
    EndTime TIME NOT NULL CHECK (EndTime <= '22:00:00'), -- Thời gian kết thúc (tối đa 10:00 tối)
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) -- Ràng buộc khóa ngoại liên kết với Students
);

INSERT INTO Schedules (TutorID, StudentID, DayOfWeek, StartTime, EndTime)
VALUES
(1, 2, 'Monday', '08:00:00', '10:00:00'),  
(2, 3, 'Tuesday', '09:00:00', '11:00:00'),
(3, 4, 'Wednesday', '10:00:00', '12:00:00'),
(1, 5, 'Friday', '14:00:00', '16:00:00');  -- Gia sư 1 dạy học sinh 2 vào Thứ Sáu từ 14:00 đến 16:00
-- Bảng: Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    CourseID INT NOT NULL, -- Khóa ngoại liên kết với bảng Courses
    Rating INT CHECK (Rating BETWEEN 1 AND 5), -- Đánh giá từ 1 đến 5 sao
    Comments NVARCHAR(MAX), -- Nhận xét từ học viên
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Ràng buộc khóa ngoại liên kết với Students
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Bảng: Bookings
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    CourseID INT NOT NULL, -- Khóa ngoại liên kết với bảng Courses
    ScheduleID INT NOT NULL, -- Thêm trường ScheduleID
    Date DATE NOT NULL, -- Ngày đặt lịch học
    StartTime TIME NOT NULL CHECK (StartTime >= '08:00:00'), -- Thời gian bắt đầu (ít nhất 8:00 sáng)
    EndTime TIME NOT NULL CHECK (EndTime <= '22:00:00'), -- Thời gian kết thúc (tối đa 10:00 tối)
    Status NVARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Confirmed', 'Cancelled')), -- Trạng thái đặt lịch
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Ràng buộc khóa ngoại liên kết với Students
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID), -- Ràng buộc khóa ngoại liên kết với Courses
    FOREIGN KEY (ScheduleID) REFERENCES Schedules(ScheduleID), -- Ràng buộc khóa ngoại liên kết với Schedules
    CONSTRAINT UC_Booking UNIQUE (StudentID, TutorID, Date, StartTime) -- Đảm bảo không có lịch học trùng lặp
);

-- Bảng: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    CourseID INT NOT NULL, -- Thêm trường CourseID
    Amount DECIMAL(10, 2) NOT NULL, -- Số tiền thanh toán
    Date DATETIME DEFAULT GETDATE(), -- Thời điểm thanh toán
    Status NVARCHAR(20) DEFAULT 'Processing' CHECK (Status IN ('Processing', 'Completed', 'Failed')), -- Trạng thái thanh toán
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Ràng buộc khóa ngoại liên kết với Students
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Bảng: Complaints
CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    UserID INT NOT NULL, -- Khóa ngoại liên kết với bảng Users
    Issue NVARCHAR(MAX) NOT NULL, -- Nội dung khiếu nại
    DateFiled DATETIME DEFAULT GETDATE(), -- Ngày gửi khiếu nại
    Status NVARCHAR(20) DEFAULT 'Pending' CHECK (Status IN ('Pending', 'Resolved', 'Closed')), -- Trạng thái xử lý khiếu nại
    FOREIGN KEY (UserID) REFERENCES Users(UserID) -- Ràng buộc khóa ngoại liên kết với Users
);

-- Bảng: AdminReports
CREATE TABLE AdminReports (
    ReportID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    UserID INT NOT NULL, -- Sửa AdminID thành UserID
    TargetUserID INT NOT NULL, -- Người nhận thông báo (Student hoặc Tutor)
    Message NVARCHAR(MAX) NOT NULL, -- Nội dung thông báo
    DateSent DATETIME DEFAULT GETDATE(), -- Ngày gửi thông báo
    Status NVARCHAR(20) DEFAULT 'Unread' CHECK (Status IN ('Unread', 'Read')), -- Trạng thái đọc thông báo
    FOREIGN KEY (UserID) REFERENCES Users(UserID), -- Khóa ngoại liên kết với Users
    FOREIGN KEY (TargetUserID) REFERENCES Users(UserID) -- Khóa ngoại liên kết với người nhận
);

-- Bảng: ChatSupport
CREATE TABLE ChatSupport (
    ChatID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    UserID INT NOT NULL, -- Khóa ngoại liên kết với bảng Users
    Message NVARCHAR(MAX) NOT NULL, -- Nội dung tin nhắn
    Date DATETIME DEFAULT GETDATE(), -- Thời điểm gửi tin nhắn
    Resolved BIT DEFAULT 0, -- Trạng thái xử lý tin nhắn (0: chưa xử lý, 1: đã xử lý)
    FOREIGN KEY (UserID) REFERENCES Users(UserID) -- Ràng buộc khóa ngoại liên kết với Users
);

-- Bảng: Attendance
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    CourseID INT NOT NULL, -- Khóa ngoại liên kết với bảng Courses
    Date DATE NOT NULL, -- Ngày điểm danh
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('Present', 'Absent')), -- Trạng thái điểm danh
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Ràng buộc khóa ngoại liên kết với Students
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Bảng: Earnings
CREATE TABLE Earnings (
    EarningID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    PaymentID INT NOT NULL, -- Liên kết với bảng Payments
    CourseID INT NOT NULL, -- Thêm trường CourseID
    Amount DECIMAL(10, 2) NOT NULL, -- Số tiền kiếm được
    Date DATETIME DEFAULT GETDATE(), -- Thời điểm ghi nhận thu nhập
    Status NVARCHAR(20) DEFAULT 'Processing' CHECK (Status IN ('Processing', 'Completed')), -- Trạng thái thu nhập
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (PaymentID) REFERENCES Payments(PaymentID), -- Ràng buộc khóa ngoại liên kết với Payments
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Bảng: StudentProgress
CREATE TABLE StudentProgress (
    ProgressID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    CourseID INT NOT NULL, -- Khóa ngoại liên kết với bảng Courses
    Topic NVARCHAR(200) NOT NULL, -- Chủ đề đã học
    DateCompleted DATE, -- Ngày hoàn thành
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID), -- Ràng buộc khóa ngoại liên kết với Students
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID) -- Ràng buộc khóa ngoại liên kết với Courses
);

-- Bảng: TutorEvaluations
CREATE TABLE TutorEvaluations (
    EvaluationID INT PRIMARY KEY IDENTITY(1,1), -- Khóa chính, tự động tăng giá trị
    TutorID INT NOT NULL, -- Khóa ngoại liên kết với bảng Tutors
    StudentID INT NOT NULL, -- Khóa ngoại liên kết với bảng Students
    Criteria NVARCHAR(100) NOT NULL, -- Tiêu chí đánh giá
    Score INT CHECK (Score BETWEEN 1 AND 5), -- Điểm đánh giá (1 đến 5)
    Date DATETIME DEFAULT GETDATE(), -- Thời điểm đánh giá
    FOREIGN KEY (TutorID) REFERENCES Tutors(TutorID), -- Ràng buộc khóa ngoại liên kết với Tutors
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) -- Ràng buộc khóa ngoại liên kết với Students
);
