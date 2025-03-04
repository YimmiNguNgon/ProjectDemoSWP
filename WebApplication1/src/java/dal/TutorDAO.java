/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Tutor;
import model.User;
import java.sql.Connection;
import model.Courses;
import model.Schedule;

/**
 *
 * @author Huy
 */
public class TutorDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;
    

    public Tutor getTutorByUserId(int userId) {
        String sql = "SELECT \n"
                + "    T.TutorID, \n"
                + "    U.UserID, \n"
                + "    U.Name AS FullName, \n"
                + "    U.Email, \n"
                + "    U.Phone, \n"
                + "    U.Gender, \n"
                + "    U.Address, \n"
                + "    T.Education, \n"
                + "    T.Experience, \n"
                + "    T.HourlyRate, \n"
                + "    T.Verified\n"
                + "FROM Tutors T\n"
                + "JOIN Users U ON T.UserID = U.UserID WHERE U.UserID=?;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Tutor(
                        rs.getInt("TutorID"),
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Gender"),
                        rs.getString("Address"),
                        rs.getString("Education"),
                        rs.getString("Experience"),
                        rs.getDouble("HourlyRate"),
                        rs.getBoolean("Verified")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Tutor getTutorById(int Id) {
        String sql = "SELECT \n"
                + "    T.TutorID, \n"
                + "    U.UserID, \n"
                + "    U.Name AS FullName, \n"
                + "    U.Email, \n"
                + "    U.Phone, \n"
                + "    U.Gender, \n"
                + "    U.Address, \n"
                + "    T.Education, \n"
                + "    T.Experience, \n"
                + "    T.HourlyRate, \n"
                + "    T.Verified\n"
                + "FROM Tutors T\n"
                + "JOIN Users U ON T.UserID = U.UserID WHERE U.TutorID=?;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, Id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new Tutor(
                        rs.getInt("TutorID"),
                        rs.getInt("UserID"),
                        rs.getString("FullName"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("Gender"),
                        rs.getString("Address"),
                        rs.getString("Education"),
                        rs.getString("Experience"),
                        rs.getDouble("HourlyRate"),
                        rs.getBoolean("Verified")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Schedule> getScheduleByTutor(int tutorID) {
        List<Schedule> schedules = new ArrayList<>();
        String sql = "SELECT " +
                 "    s.ScheduleID, " +
                 "    s.TutorID, " +
                 "    s.StudentID, " +
                 "    s.DayOfWeek, " +
                 "    s.StartTime, " +
                 "    s.EndTime, " +
                 "    c.CourseName, " +
                 "    u.Name AS HocSinh " +
                 "FROM Schedules s " +
                 "JOIN Students st ON s.StudentID = st.StudentID " +
                 "JOIN Users u ON st.UserID = u.UserID " +
                 "JOIN Courses c ON st.CourseID = c.CourseID " +
                 "WHERE s.TutorID = ? " + // Thêm điều kiện lọc TutorID
                 "ORDER BY s.DayOfWeek, s.StartTime;";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tutorID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Schedule schedule = new Schedule(
                        rs.getInt("ScheduleID"),
                        rs.getInt("TutorID"),
                        rs.getInt("StudentID"),
                        rs.getString("DayOfWeek"),
                        rs.getTime("StartTime"),
                        rs.getTime("EndTime"),
                        rs.getString("CourseName"), // Thêm môn học
                        rs.getString("HocSinh") // Thêm tên học sinh
                );
                schedules.add(schedule);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return schedules;
    }
    
    
    public boolean addSchedule(int tutorID, int studentID, String dayOfWeek, String startTime, String endTime) {
        String sql = "INSERT INTO Schedules (TutorID, StudentID, DayOfWeek, StartTime, EndTime) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tutorID);
            ps.setInt(2, studentID);
            ps.setString(3, dayOfWeek);
            ps.setString(4, startTime);
            ps.setString(5, endTime);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public List<Courses> getCoursesByTutorId(int tutorID) {
        List<Courses> courses = new ArrayList<>();
        String sql = "SELECT c.CourseID, c.CourseName, c.Description, c.Level, c.Price, c.Rating, c.Category " +
                     "FROM TutorCourses tc " +
                     "JOIN Courses c ON tc.CourseID = c.CourseID " +
                     "WHERE tc.TutorID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, tutorID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Courses course = new Courses(
                    rs.getInt("CourseID"),
                    rs.getString("CourseName"),
                    rs.getString("Description"),
                    rs.getString("Level"),
                    rs.getDouble("Price"),
                    rs.getFloat("Rating"),
                    rs.getString("Category")
                );
                courses.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courses;
    }
    
    public int addCourseForTutor(int tutorID, String courseName, String description, String level, double price, String cat) {
        String sql = "INSERT INTO Courses (CourseName, Description, Level, Price,Category) VALUES (?, ?, ?, ?, ?)";
        String linkSQL = "INSERT INTO TutorCourses (TutorID, CourseID) VALUES (?, ?)";
        int courseID = -1;

        try {
            PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
            ps.setString(1, courseName);
            ps.setString(2, description);
            ps.setString(3, level);
            ps.setDouble(4, price);
            ps.setString(5, cat);
            int affectedRows = ps.executeUpdate();

            if (affectedRows > 0) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    courseID = rs.getInt(1);

                    PreparedStatement psLink = connection.prepareStatement(linkSQL);
                    psLink.setInt(1, tutorID);
                    psLink.setInt(2, courseID);
                    psLink.executeUpdate();

                    psLink.close();
                }
                rs.close();
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return courseID;
    }
    
    public boolean editCourseForTutor(int courseID, String courseName, String description, String level, double price, String cat) {
        String sql = "UPDATE Courses SET CourseName = ?, Description = ?, Level = ?, Price = ?, Category = ? WHERE CourseID = ?";
        boolean success = false;

        try {
            // Cập nhật thông tin khóa học trong bảng Courses
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, courseName);
            ps.setString(2, description);
            ps.setString(3, level);
            ps.setDouble(4, price);
            ps.setString(5, cat);
            ps.setInt(6, courseID);  // Sử dụng courseID để xác định khóa học cần cập nhật

            int affectedRows = ps.executeUpdate();

            // Nếu có bản ghi bị ảnh hưởng, tức là đã cập nhật thành công
            if (affectedRows > 0) {
                success = true;
            }

            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public boolean updateTutorProfileByUserId(int userId, String fullName, String gender, String address, 
                                          String phoneNumber, String education, String experience, 
                                          double hourlyRate) {
        String updateUsersSQL = "UPDATE Users SET Name=?, Gender=?, Address=?, Phone=? WHERE UserID=?";
        String updateTutorsSQL = "UPDATE Tutors SET Education=?, Experience=?, HourlyRate=? WHERE UserID=?";
        boolean isUpdated = false;

        try {
            // Bắt đầu transaction
            connection.setAutoCommit(false);

            // Cập nhật bảng Users
            try (PreparedStatement stmtUsers = connection.prepareStatement(updateUsersSQL)) {
                stmtUsers.setString(1, fullName);
                stmtUsers.setString(2, gender);
                stmtUsers.setString(3, address);
                stmtUsers.setString(4, phoneNumber);
                stmtUsers.setInt(5, userId);
                stmtUsers.executeUpdate();
            }

            // Cập nhật bảng Tutors
            try (PreparedStatement stmtTutors = connection.prepareStatement(updateTutorsSQL)) {
                stmtTutors.setString(1, education);
                stmtTutors.setString(2, experience);
                stmtTutors.setDouble(3, hourlyRate);
                stmtTutors.setInt(4, userId);
                stmtTutors.executeUpdate();
            }

            // Commit nếu không có lỗi
            connection.commit();
            isUpdated = true;
        } catch (Exception e) {
            try {
                connection.rollback(); // Rollback nếu có lỗi
            } catch (Exception rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                connection.setAutoCommit(true); // Bật lại chế độ auto-commit
            } catch (Exception autoCommitEx) {
                autoCommitEx.printStackTrace();
            }
        }

        return isUpdated;
    }


    
//        public static void main(String[] args) {
//        TutorDAO u = new TutorDAO();
//       List<Tutor> tutor = u.getAllTutors();
//        System.out.println("---bat dau ");
//       for(Tutor c : tutor){
//           System.out.println("data: "+ c);
//       }
//        System.out.println("---ket thuc");
//    }

}
