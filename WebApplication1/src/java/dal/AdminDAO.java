/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.CourseAd;
import model.Tutor;
import model.Tutor1;
import model.Tutor2;

/**
 *
 * @author Admin
 */
public class AdminDAO extends DBContext {

    // Lấy số lượng học viên
    public int countStudents() {
        String sql = """
                     SELECT COUNT (*) 
                       FROM [dbo].[Users]
                       where [role_id] = 4"""; // Giả sử role_id = 4 là student
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    // Lấy số lượng giáo viên
    public int countTutors() {
        String sql = """
                     SELECT COUNT (*) 
                       FROM [dbo].[Users]
                       where [role_id] = 3"""; // Giả sử role_id = 3 là tutor
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    //lay so luong khoa hoc
    public int countCourse() {
        String sql = "select COUNT(*) From Courses";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0; // Trả về 0 nếu có lỗi
    }

    //lấy dữ liệu bảng tutor
    public List<Tutor1> getAllTutors() {
        List<Tutor1> list = new ArrayList<>();
        String sql = """
                     SELECT [TutorID]
                           ,[UserID]
                           ,[Education]
                           ,[Experience]
                           ,[HourlyRate]
                           ,[Verified]
                       FROM [dbo].[Tutors]"""; // Thực thi câu truy vấn
        try {
            PreparedStatement pre = connection.prepareStatement(sql); // Gọi câu truy vấn
            ResultSet rs = pre.executeQuery(); // Thực thi câu truy vấn
            while (rs.next()) {
                list.add(new Tutor1(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getDouble(5),
                        rs.getBoolean(6))); // Add dữ liệu vào list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    //
//    public List<Tutor2> getAllTutors2() {
//        List<Tutor2> list = new ArrayList<>();
//        String sql = """
//                     SELECT [TutorID]
//                           ,[UserID]
//                           ,[Education]
//                           ,[Experience]
//                           ,[HourlyRate]
//                           ,[Verified]
//                       FROM [dbo].[Tutors]"""; // Thực thi câu truy vấn
//        try {
//            PreparedStatement pre = connection.prepareStatement(sql); // Gọi câu truy vấn
//            ResultSet rs = pre.executeQuery(); // Thực thi câu truy vấn
//            while (rs.next()) {
//                list.add(new Tutor2(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getDouble(5),
//                        rs.getBoolean(6))); // Add dữ liệu vào list
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
    

    //insert tutor
    public void insertTutor(int userID, String education, String experience, double hourlyRate) {
        String sql = """
                 INSERT INTO [dbo].[Tutors]
                            ([UserID], [Education], [Experience], [HourlyRate], [Verified])
                      VALUES (?, ?, ?, ?, 0)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, userID);
            pre.setString(2, education);
            pre.setString(3, experience);
            pre.setDouble(4, hourlyRate);
            pre.executeUpdate(); // Thực thi truy vấn (INSERT không cần ResultSet)
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //duyệt tutor 
    public void approveTutor(int tutorID) {
        String sql = "UPDATE Tutors SET Verified = 1 WHERE TutorID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, tutorID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //xóa tutor
    public void deleteTutor(int tutorID) {
        String sql = "DELETE FROM Tutors WHERE TutorID = ?";
        try {
            PreparedStatement pstmt = connection.prepareStatement(sql);
            pstmt.setInt(1, tutorID);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //lấy dữ liệu bảng course
    public List<CourseAd> getAllCourses() {
        List<CourseAd> courses = new ArrayList<>();
        String sql = """
             SELECT CourseID, CourseName, Description, Level, Price, Rating, TotalSessions, CourseStatus
             FROM Courses""";

        if (connection == null) {
            System.err.println("Database connection is null!");
            return courses; // Trả về danh sách rỗng nếu không có kết nối
        }

        try (PreparedStatement pre = connection.prepareStatement(sql); ResultSet rs = pre.executeQuery()) {

            while (rs.next()) {
                CourseAd course = new CourseAd(
                        rs.getInt("CourseID"),
                        rs.getString("CourseName"),
                        rs.getString("Description"),
                        rs.getString("Level"),
                        rs.getDouble("Price"),
                        rs.getFloat("Rating"),
                        rs.getInt("TotalSessions"),
                        rs.getString("CourseStatus")
                );
                courses.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return courses;
    }

    //lấy dữ liệu bảng payment
    public static void main(String[] args) {
        AdminDAO dao = new AdminDAO();
//        System.out.println("so luong student: " + dao.countStudents());
//        System.out.println("so luong tutor: " + dao.countTutors());
//        System.out.println("so luong course: " + dao.countCourse());
        System.out.println("thong tin tutor: " + dao.getAllTutors());
        System.out.println("thong tin course: " + dao.getAllCourses());
    }
}
