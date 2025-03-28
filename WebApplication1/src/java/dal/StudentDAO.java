/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package dal;

import context.DBContext;
import java.util.*;
import java.lang.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Course;
import model.Student;
import model.Student1;

public class StudentDAO extends DBContext {

    public int getStudentIdByUserId(int userId) {
        String sql = "SELECT StudentID FROM Students WHERE UserID = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("StudentID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // Trả về -1 nếu không tìm thấy
    }
    public String getStudentPayment(int id) {
          String sql = " SELECT email,name from Students S\n"
                  + "  join Users U on U.UserID = S.UserID\n"
                  + "  join Payments P on P.StudentID = S.StudentID\n"
                  + "  where P.PaymentID = ?";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
    
    public List<Student1> getStudentHistory(int userId) {
         List<Student1> students = new ArrayList<>();
    String sql = "SELECT s.StudentID, s.UserID, s.CourseID, s.DateJoined, c.CourseName, c.Description "
               + "FROM Students s "
               + "INNER JOIN Courses c ON s.CourseID = c.CourseID "
               + "WHERE s.UserID = ? "
               + "ORDER BY s.DateJoined DESC";
    
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, userId);  // Thiết lập tham số cho người dùng đã đăng nhập
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Student1 student = new Student1();
            student.setStudentID(rs.getInt("StudentID"));
            student.setUserID(rs.getInt("UserID"));
            student.setCourseID(rs.getInt("CourseID"));
            student.setDateJoined(rs.getDate("DateJoined"));
            
            // Tạo đối tượng Course và điền thông tin
            Course course = new Course();
            course.setCourseName(rs.getString("CourseName"));
            course.setDescription(rs.getString("Description"));
            
            // Thiết lập đối tượng Course cho Student1
            student.setCourse(course);
            
            students.add(student);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return students;
    }
    
    
}