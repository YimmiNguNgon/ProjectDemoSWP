/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import model.Earning;
import model.Payment;
import model.PaymentInfoDTO;

/**
 *
 * @author admin
 */
public class PaymentDAO extends DBContext {

    public int insertPayment(Payment payment) {
        String sql = "INSERT INTO [dbo].[Payments]\n"
                + "           ([StudentID]\n"
                + "           ,[TutorID]\n"
                + "           ,[CourseID]\n"
                + "           ,[Amount]\n"
                + "           ,[Status])\n"
                + "     VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, payment.getStudentID());
            st.setInt(2, payment.getTutorID());
            st.setInt(3, payment.getCourseID());
            st.setDouble(4, payment.getAmount());
            st.setString(5, payment.getStatus());
            int affectedRows = st.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating payment failed, no rows affected.");
            }

            try ( ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating payment failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            return -1;
        }
    }

    public int insertEarning(Earning earning) {
        String sql = "INSERT INTO [dbo].[Earnings]\n"
                + "           ([TutorID]\n"
                + "           ,[PaymentID]\n"
                + "           ,[CourseID]\n"
                + "           ,[Amount]\n"
                + "           ,[Status])\n"
                + "     VALUES(?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, earning.getTutorID());
            st.setInt(2, earning.getPaymentID());
            st.setInt(3, earning.getCourseID());
            st.setDouble(4, earning.getAmount());
            st.setString(5, earning.getStatus());
            int affectedRows = st.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating payment failed, no rows affected.");
            }

            try ( ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating payment failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            return -1;
        }
    }

    public boolean updatePaymentStatus(Payment payment) {
        String sql = "UPDATE [dbo].[Payments]\n"
                + "   SET [Status] = ?\n"
                + " WHERE PaymentID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, payment.getStatus());
            st.setInt(2, payment.getPaymentID());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public boolean updateEarningStatus(Earning earning) {
        String sql = "UPDATE [dbo].[Earnings]\n"
                + "   SET [Status] = ?\n"
                + " WHERE PaymentID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, earning.getStatus());
            st.setInt(2, earning.getPaymentID());
            return st.executeUpdate() > 0;
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return false;
    }

    public List<PaymentInfoDTO> getAllPayments() {
        List<PaymentInfoDTO> payments = new ArrayList<>();
        String sql = "SELECT p.PaymentID, u.Name AS StudentName, c.CourseName, p.Amount, p.Status, p.Date "
                + "FROM Payments p "
                + "JOIN Students s ON p.StudentID = s.StudentID "
                + "JOIN Users u ON s.UserID = u.UserID "
                + "JOIN Courses c ON p.CourseID = c.CourseID "
                + "ORDER BY p.Date DESC";

        try ( PreparedStatement st = connection.prepareStatement(sql);  ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                PaymentInfoDTO payment = new PaymentInfoDTO(
                        rs.getInt("PaymentID"),
                        rs.getString("StudentName"),
                        rs.getString("CourseName"),
                        rs.getDouble("Amount"),
                        rs.getString("Status"),
                        rs.getTimestamp("Date").toLocalDateTime()
                );
                payments.add(payment);
            }
        } catch (SQLException e) {
            System.out.println("Lỗi khi lấy danh sách thanh toán: " + e.getMessage());
        }
        return payments;
    }

    public List<PaymentInfoDTO> searchPayments(String studentName, String status) {
        List<PaymentInfoDTO> payments = new ArrayList<>();
        String sql = "SELECT p.PaymentID, u.Name AS StudentName, c.CourseName, p.Amount, p.Status, p.Date "
                + "FROM Payments p "
                + "JOIN Students s ON p.StudentID = s.StudentID "
                + "JOIN Users u ON s.UserID = u.UserID "
                + "JOIN Courses c ON p.CourseID = c.CourseID "
                + "WHERE 1 = 1";

        // Xây dựng điều kiện tìm kiếm động
        List<Object> parameters = new ArrayList<>();
        if (studentName != null && !studentName.trim().isEmpty()) {
            sql += " AND u.Name LIKE ?";
            parameters.add("%" + studentName + "%");
        }
        if (status != null && !status.trim().isEmpty()) {
            sql += " AND p.Status = ?";
            parameters.add(status);
        }

        sql += " ORDER BY p.Date DESC";

        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            for (int i = 0; i < parameters.size(); i++) {
                ps.setObject(i + 1, parameters.get(i));
            }

            try ( ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    payments.add(new PaymentInfoDTO(
                            rs.getInt("PaymentID"),
                            rs.getString("StudentName"),
                            rs.getString("CourseName"),
                            rs.getDouble("Amount"),
                            rs.getString("Status"),
                            rs.getTimestamp("Date").toLocalDateTime()
                    ));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return payments;
    }

}
