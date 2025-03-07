package dal;

import context.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Courses;

public class CourseDAO extends DBContext {

    public List<Course> getCoursesByUserId(int userId) {
        List<Course> courseList = new ArrayList<>();
        String sql = "SELECT c.CourseID, c.CourseName "
                + "FROM Courses c "
                + "JOIN Students s ON c.CourseID = s.CourseID "
                + "JOIN Users u ON s.UserID = u.UserID "
                + "WHERE u.UserID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            System.out.println("Lấy danh sách khóa học cho UserID: " + userId);
            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("CourseID"),
                        rs.getString("CourseName")
                );
                courseList.add(course);
//                System.out.println("Khóa học lấy được: " + course.getCourseName());
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseList;
    }
    
    public boolean deleteCourse(int courseID) {
        String deleteTutorCoursesSql = "DELETE FROM TutorCourses WHERE CourseID = ?";
        String deleteCourseSql = "DELETE FROM Courses WHERE CourseID = ?";

        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;

        try {
            // Xóa các bản ghi trong bảng TutorCourses liên quan đến CourseID
            stmt1 = connection.prepareStatement(deleteTutorCoursesSql); // Sử dụng connection đã có sẵn
            stmt1.setInt(1, courseID);
            int rowsAffected1 = stmt1.executeUpdate(); // Thực thi câu lệnh xóa trong TutorCourses

            // Xóa khóa học chính trong bảng Courses
            stmt2 = connection.prepareStatement(deleteCourseSql); // Sử dụng connection đã có sẵn
            stmt2.setInt(1, courseID);
            int rowsAffected2 = stmt2.executeUpdate(); // Thực thi câu lệnh xóa trong Courses

            // Kiểm tra số dòng bị ảnh hưởng
            if (rowsAffected1 > 0 && rowsAffected2 > 0) {
                return true; // Xóa thành công
            } else {
                return false; // Không có dòng nào bị xóa
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Nếu có lỗi xảy ra
        } finally {
            // Đảm bảo đóng các tài nguyên (PreparedStatement)
            try {
                if (stmt1 != null) stmt1.close();
                if (stmt2 != null) stmt2.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
    public List<Courses> getAllCourses() {
        List<Courses> coursesList = new ArrayList<>();
        String sql = "SELECT * FROM Courses";
        try (PreparedStatement stmt = connection.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                coursesList.add(new Courses(
                        rs.getInt("CourseID"),
                        rs.getString("CourseName"),
                        rs.getString("Description"),
                        rs.getString("Level"),
                        rs.getDouble("Price"),
                        rs.getFloat("Rating"),
                        rs.getString("Category")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return coursesList;
    }
    public static void main(String[] args) {
        CourseDAO courseDAO = new CourseDAO();
        List<Course> courses = courseDAO.getCoursesByUserId(4); // Thử với UserID = 4

        System.out.println("Danh sách khóa học:");
        for (Course course : courses) {
            System.out.println(course);
        }
    }

}
