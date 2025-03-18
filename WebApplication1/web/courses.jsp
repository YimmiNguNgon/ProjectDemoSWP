<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách khóa học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
    display: flex;
    min-height: 100vh;
    flex-direction: row;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

.sidebar {
    width: 250px;
    background-color: #343a40;
    color: white;
    padding: 20px;
    height: 100vh;
    position: fixed; /* Thanh sidebar cố định */
    top: 0;
    left: 0;
}

.sidebar h3 {
    margin-bottom: 30px;
    color: #fff;
}

.sidebar button {
    width: 100%;
    margin-bottom: 10px;
}

.main-content {
    margin-left: 270px; /* Đẩy nội dung chính ra khỏi sidebar */
    padding: 20px;
/* Đảm bảo nội dung không bị che khuất bởi header */
    flex-grow: 1;
}

.hero-section {
    background: #007bff;
    color: white;
    padding: 50px 0;
}

.feature-box {
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 20px;
    text-align: center;
    margin: 20px;
}

.feature-box h3 {
    font-size: 1.5rem;
    margin-bottom: 15px;
}

.feature-box p {
    font-size: 1rem;
}

.footer {
    background-color: #333;
    color: white;
    padding: 30px 0;
    text-align: center;
    position: relative;
    bottom: 0;
    width: 100%;
}
    </style>
</head>

<body>
    <!-- Thanh Sidebar -->
    <div class="sidebar">
        <h3>Cấp độ</h3>
        <button class="btn btn-primary" id="beginnerButton">Beginner</button>
        <button class="btn btn-primary" id="intermediateButton">Intermediate</button>
        <button class="btn btn-primary" id="advancedButton">Advanced</button>
        <button class="btn btn-primary" id="allCoursesButton">Tất cả khóa học</button> <!-- Hiển thị tất cả khóa học -->
    </div>

    <!-- Nội dung chính -->
    <div class="main-content">
        <%@ include file="headerStudent.jsp" %>
        <div class="container mt-4">
            <h2 class="text-center">Danh sách khóa học</h2>

            <!-- Thanh tìm kiếm và sắp xếp -->
            <div class="d-flex justify-content-end mb-3">
                <input id="searchInput" type="text" class="form-control w-50" placeholder="Tìm kiếm khóa học..." />
                <button id="sortNameButton" class="btn btn-secondary ms-2">Sắp xếp A-Z</button>
               
            </div>

            <!-- Danh sách khóa học -->
            <div class="row mt-3" id="coursesContainer">
                <c:choose>
                    <c:when test="${not empty coursesList}">
                        <c:forEach var="course" items="${coursesList}">
                            <div class="col-md-4 mb-4 course-card" data-category="${course.level}"> <!-- Thêm category cho mỗi khóa học -->
                                <div class="card shadow-sm">
                                    <div class="card-body">
                                        <h5 class="card-title course-name">${course.courseName}</h5>
                                        <p class="card-text">${course.description}</p>
                                        <p><strong>Trình độ:</strong> ${course.level}</p>
                                        <p><strong>Giá:</strong> ${course.price} VNĐ</p>
                                        <p><strong>Đánh giá:</strong> ${course.rating} ⭐</p>
                                        <p><strong>Số buổi học:</strong> ${course.totalSessions}</p>
                                        <p><strong>Trạng thái:</strong> ${course.courseStatus}</p>
                                        <a href="reservation?courseId=${course.courseID}" class="btn btn-primary">Đặt lịch</a>
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
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let isNameAscending = true;
        let isPriceAscending = true;

        // Lọc khóa học theo cấp độ
        document.getElementById("beginnerButton").addEventListener("click", function() {
            filterCoursesByLevel("Beginner"); // Lọc các khóa học Beginner
        });

        document.getElementById("intermediateButton").addEventListener("click", function() {
            filterCoursesByLevel("Intermediate"); // Lọc các khóa học Intermediate
        });

        document.getElementById("advancedButton").addEventListener("click", function() {
            filterCoursesByLevel("Advanced"); // Lọc các khóa học Advanced
        });

        document.getElementById("allCoursesButton").addEventListener("click", function() {
            const courses = document.querySelectorAll('.course-card');
            courses.forEach(course => {
                course.style.display = "block"; // Hiển thị tất cả khóa học
            });
        });

        // Lọc các khóa học theo cấp độ
        function filterCoursesByLevel(level) {
            const courses = document.querySelectorAll('.course-card');
            courses.forEach(course => {
                const courseLevel = course.getAttribute('data-category'); // Lấy cấp độ khóa học từ data-category
                if (courseLevel && courseLevel.includes(level)) {
                    course.style.display = "block"; // Hiển thị khóa học nếu thuộc cấp độ
                } else {
                    course.style.display = "none"; // Ẩn khóa học nếu không thuộc cấp độ
                }
            });
        }

        // Sắp xếp theo tên
        document.getElementById("sortNameButton").addEventListener("click", function() {
            const courses = document.querySelectorAll('.course-card');
            const coursesArray = Array.from(courses);

            let sortedCourses;

            if (isNameAscending) {
                sortedCourses = coursesArray.sort((a, b) => {
                    const nameA = a.querySelector('.course-name').textContent.toUpperCase();
                    const nameB = b.querySelector('.course-name').textContent.toUpperCase();
                    return nameA.localeCompare(nameB); // A->Z
                });
                this.textContent = "Sắp xếp Z-A theo tên"; // Cập nhật tên nút
            } else {
                sortedCourses = coursesArray.sort((a, b) => {
                    const nameA = a.querySelector('.course-name').textContent.toUpperCase();
                    const nameB = b.querySelector('.course-name').textContent.toUpperCase();
                    return nameB.localeCompare(nameA); // Z->A
                });
                this.textContent = "Sắp xếp A-Z theo tên"; // Cập nhật tên nút
            }

            const courseContainer = document.getElementById('coursesContainer');
            sortedCourses.forEach(course => courseContainer.appendChild(course));

            isNameAscending = !isNameAscending;
        });

        // Lọc khóa học khi người dùng nhập từ khóa
        document.getElementById("searchInput").addEventListener("input", function() {
            const searchQuery = this.value.toLowerCase();
            const courses = document.querySelectorAll('.course-card');

            courses.forEach(course => {
                const courseName = course.querySelector('.course-name').textContent.toLowerCase();
                const courseDescription = course.querySelector('.card-text').textContent.toLowerCase();

                if (courseName.includes(searchQuery) || courseDescription.includes(searchQuery)) {
                    course.style.display = "block";
                } else {
                    course.style.display = "none";
                }
            });
        });
    </script>
    
</body>

</html>
