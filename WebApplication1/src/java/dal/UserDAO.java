/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import model.Role;
import model.User;

/**
 *
 * @author hello
 */
public class UserDAO extends DBContext{

    PreparedStatement ps = null;
    ResultSet rs = null;

        public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        try {
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                user = new User(rs.getInt(1),  // Assuming the first column is ID
                                rs.getInt(2),  // Second column (could be user type)
                                rs.getString(3),  // Email
                                rs.getString(4),  // Password
                                rs.getString(5),  // Full Name
                                rs.getString(6),
                                rs.getString(7),
                                rs.getString(8)); // Any other relevant field (like phone, etc)
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
        
        
        
        public int getTutorIDByUserID(int userID) {
            String sql = "SELECT TutorID FROM Tutors WHERE UserID = ?";
            try (PreparedStatement ps = connection.prepareStatement(sql)) {
                ps.setInt(1, userID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    return rs.getInt("TutorID");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return -1; // Trả về -1 nếu không tìm thấy
        }
        
        public boolean isDuplicatedEmail(String email) {
        String sql = """
                     SELECT 1
                       FROM [dbo].[Users]
                       WHERE Email = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    //lay het du lieu trong bang roke
    public List<Role> getAllRole() {
        List<Role> list = new ArrayList<>();
        String sql = """
                     SELECT [role_id]
                     ,[role_name]
                     FROM [dbo].[Role]"""; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van
            while (rs.next()) {
                list.add(new Role(rs.getInt(1),
                        rs.getString(2))); //add du lieu vao list
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Role getRole(int roleID) {
        String sql = """
                     SELECT [role_id]
                           ,[role_name]
                       FROM [dbo].[Role]
                       WHERE [role_id] = ?""";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("role_id"), rs.getString("role_name"));
                return role;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User getUser(String email, String password) {
    String sql = """
                 SELECT [UserID], [role_id], [Name], [Email], [Password], 
                        [Phone], [Gender], [Address]
                 FROM [dbo].[Users]
                 WHERE [Email] = ? AND [Password] = ? """;
    try {
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, email);
        st.setString(2, password);
        ResultSet rs = st.executeQuery();

        if (rs.next()) {
            // Lấy dữ liệu từ ResultSet
            int userId = rs.getInt("UserID");
            int role = rs.getInt("role_id"); 
            String fullName = rs.getString("Name");
            String phone = rs.getString("Phone");  // Đổi từ int -> String
            String gender = rs.getString("Gender");
            String address = rs.getString("Address");

            // Khởi tạo đối tượng User với đầy đủ thông tin
            return new User(userId, role, email, fullName, password, phone, gender, address);
        }
    } catch (SQLException ex) {
        System.out.println("Lỗi khi lấy thông tin User: " + ex);
    }
    return null;
}

    //account
    public Account getAccountByUId(String uid) {
        String sql = """
                     SELECT [UserID]
                           ,[role_id]
                           ,[Name]
                           ,[Email]
                           ,[Password]
                           ,[Phone]
                       FROM [dbo].[Users]
                     where UserID = ?"""; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, uid);//set id vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getALLAccount() {
        List<Account> list = new ArrayList<>();
        String sql = """
                     SELECT *
                       FROM [dbo].[Users]""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6)));
            }

        } catch (SQLException e) {
        }
        return list;
    }

    //delete account
    public void deleteAccount(String uid) {
        String sql = """
                     DELETE FROM [dbo].[Users]
                           WHERE UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, uid);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            pre.executeUpdate();//do cau lenh nay k tra ve bang result nen khong can rs.get gi ca
        } catch (SQLException e) {
        }
    }

    //insert account
    public void insertAccount(String role, String name, String email, String pass, String phone) {
        String sql = """
                     INSERT INTO Users (role_id, Name, Email, Password, Phone)
                     VALUES 
                     (?,?,?,?,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van

            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
        }

    }

    //edit account
    public void editAccount(String role, String name, String email, String pass, String phone, String uid) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [role_id] = ?
                           ,[Name] = ?
                           ,[Email] = ?
                           ,[Password] = ?
                           ,[Phone] = ?
                      WHERE UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van

            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            pre.setString(6, uid);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
        }

    }
//        public static void main(String[] args) {
//
//            UserDAO user = new UserDAO();
//            System.out.println(user.getUserByEmailAndPassword("admin@gmail.com", "123456"));
//    }
        

 
}
