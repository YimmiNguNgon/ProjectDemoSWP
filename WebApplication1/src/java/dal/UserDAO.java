/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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

public class UserDAO extends DBContext {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        // Cập nhật câu truy vấn để lấy thông tin từ bảng Users
        String sql = "SELECT * FROM Users WHERE Email = ? AND Password = ?";

        try {
            // Chuẩn bị câu truy vấn
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);  // Thiết lập email
            ps.setString(2, password);  // Thiết lập password

            // Thực thi câu truy vấn và nhận kết quả
            rs = ps.executeQuery();

            // Nếu có kết quả trả về, khởi tạo đối tượng User
            if (rs.next()) {
                user = new User(
                        rs.getInt("UserID"), // Lấy UserID từ cột đầu tiên
                        rs.getInt("role_id"), // Lấy role_id từ cột thứ hai
                        rs.getString("Email"), // Lấy email
                        rs.getString("Name"), // Lấy tên đầy đủ
                        rs.getString("Password"), // Lấy password
                        rs.getString("Phone"), // Lấy phone
                        rs.getString("Gender"), // Lấy gender
                        rs.getString("Address"), // Lấy address
                        rs.getString("image_url") // Lấy image_url nếu có
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; // Trả về đối tượng User hoặc null nếu không tìm thấy
    }

    public User getUserByEmail(String email) {
        User user = null;
        String sql = "SELECT * FROM Users WHERE Email = ?"; // Chỉ tìm user theo email

        try {
            // Chuẩn bị câu truy vấn
            ps = connection.prepareStatement(sql);
            ps.setString(1, email);

            // Thực thi câu truy vấn và nhận kết quả
            rs = ps.executeQuery();

            // Nếu có kết quả trả về, khởi tạo đối tượng User
            if (rs.next()) {
                user = new User(
                        rs.getInt("UserID"),
                        rs.getInt("role_id"),
                        rs.getString("Email"),
                        rs.getString("Name"),
                        rs.getString("Password"), // Đây là mật khẩu đã mã hóa
                        rs.getString("Phone"),
                        rs.getString("Gender"),
                        rs.getString("Address"),
                        rs.getString("image_url")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; // Trả về đối tượng User hoặc null nếu không tìm thấy
    }

    public int getTutorIDByUserID(int userID) {
        String sql = "SELECT TutorID FROM Tutors WHERE UserID = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
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
                            [Phone], [Gender], [Address], [image_url]
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
                String imageUrl = rs.getString("image_url"); // Lấy image_url

                // Khởi tạo đối tượng User với đầy đủ thông tin
                return new User(userId, role, email, fullName, password, phone, gender, address, imageUrl); // Thêm imageUrl
            }
        } catch (SQLException ex) {
            System.out.println("Lỗi khi lấy thông tin User: " + ex);
        }
        return null;
    }

    public boolean editUser(User user) {
        String sql = """
                 UPDATE [dbo].[Users]
                 SET [Name] = ?, [Email] = ?, [Phone] = ?, 
                     [Gender] = CASE WHEN ? IN (N'Nam', N'Nữ') THEN ? ELSE [Gender] END,
                     [Address] = ?, [image_url] = ?
                 WHERE [UserID] = ?
                 """;
        try ( PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, user.getFullName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPhoneNumber());
            st.setString(4, user.getGender());
            st.setString(5, user.getGender());
            st.setString(6, user.getAddress());
            st.setString(7, user.getImageUrl());
            st.setInt(8, user.getId());

            int rowsUpdated = st.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException ex) {
            System.out.println("Error updating user information: " + ex);
            return false;
        }
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
                           ,[Gender]
                           ,[Address]
                           ,[image_url]
                       FROM [dbo].[Users]
                       where UserID = ?"""; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, uid);//set id vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            while (rs.next()) {
                return new Account(
                        rs.getInt(1), // UserID
                        rs.getInt(2), // role_id
                        rs.getString(3), // Name
                        rs.getString(4), // Email
                        rs.getString(5), // Password
                        rs.getString(6), // Phone
                        rs.getString(7), // Gender
                        rs.getString(8), // Address
                        rs.getString(9) // image_url
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
//                list.add(new Account(rs.getInt(1),
//                        rs.getInt(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getString(5),
//                        rs.getString(6),
//                        rs.getString(7),
//                        rs.getString(8),
//                        rs.getString(9)));
                int userId = rs.getInt(1);
                int roleId = rs.getInt(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String phone = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                String image = rs.getString(9);

                list.add(new Account(userId, roleId, name, email, password, phone, gender, address, image));
            }

        } catch (SQLException e) {
            e.printStackTrace();
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
    public void insertAccount(String role, String name, String email, String pass, String phone, String gender, String address, String image) {
        String sql = """
                     INSERT INTO [dbo].[Users]
                                ([role_id]
                                ,[Name]
                                ,[Email]
                                ,[Password]
                                ,[Phone]
                                ,[Gender]
                                ,[Address]
                                ,[image_url])
                          VALUES (?, ?, ?, ?, ?,?,?,?)""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            pre.setString(6, gender);//set cid vao dau ? thu nhat
            pre.setString(7, address);//set cid vao dau ? thu nhat
            pre.setString(8, image);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //edit account
    public void editAccount(String role, String name, String email, String pass, String phone, String gender, String address, String image,
            String uid) {
        String sql = """
                     UPDATE [dbo].[Users]
                        SET [role_id] = ?
                           ,[Name] = ?
                           ,[Email] = ?
                           ,[Password] = ?
                           ,[Phone] = ?
                           ,[Gender] = ?
                           ,[Address] = ?
                           ,[image_url] = ?
                      WHERE  UserID = ?""";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van

            pre.setString(1, role);//set cid vao dau ? thu nhat
            pre.setString(2, name);//set cid vao dau ? thu nhat
            pre.setString(3, email);//set cid vao dau ? thu nhat
            pre.setString(4, pass);//set cid vao dau ? thu nhat
            pre.setString(5, phone);//set cid vao dau ? thu nhat
            pre.setString(6, gender);//set cid vao dau ? thu nhat
            pre.setString(7, address);//set cid vao dau ? thu nhat
            pre.setString(8, image);//set cid vao dau ? thu nhat
            pre.setString(9, uid);//set cid vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public List<Account> getAccountByRole(int role) {
        List<Account> list = new ArrayList<>();
        String sql = "SELECT * FROM Users WHERE role_id = ?"; //thuc thi cau truy van
        try {
            PreparedStatement pre = connection.prepareStatement(sql);//goi cau truy van
            pre.setInt(1, role);//set id vao dau ? thu nhat
            ResultSet rs = pre.executeQuery();//thuc thi cau truy van 
            while (rs.next()) {
//                list.add(new Account(
//                        rs.getInt("userId"),
//                        rs.getInt("roleId"),
//                        rs.getString("name"),
//                        rs.getString("email"),
//                        rs.getString("password"),
//                        rs.getString("phone"),
//                        rs.getString("gender"),
//                        rs.getString("address"),
//                        rs.getString("image_url")
//                ));
                int userId = rs.getInt(1);
                int roleId = rs.getInt(2);
                String name = rs.getString(3);
                String email = rs.getString(4);
                String password = rs.getString(5);
                String phone = rs.getString(6);
                String gender = rs.getString(7);
                String address = rs.getString(8);
                String image = rs.getString(9);

                list.add(new Account(userId, roleId, name, email, password, phone, gender, address, image));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public User getAccountByUsername(String username) {

        try {
            String sql = "SELECT * FROM Users WHERE Name = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("UserID"), // Lấy UserID từ cột đầu tiên
                        rs.getInt("role_id"), // Lấy role_id từ cột thứ hai
                        rs.getString("Email"), // Lấy email
                        rs.getString("Name"), // Lấy tên đầy đủ
                        rs.getString("Password"), // Lấy password
                        rs.getString("Phone"), // Lấy phone
                        rs.getString("Gender"), // Lấy gender
                        rs.getString("Address"), // Lấy address
                        rs.getString("image_url")); // Lấy image_url nếu có;
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
        return null;
    }

    // Trong lớp UserDAO
    public void insertStudent(String name, String email, String pass, String phone) {
        String sql = "INSERT INTO Users (role_id, Name, Email, Password, Phone) VALUES (?,?,?, ?,?)";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, 4); // Sinh viên có role_id = 4
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, pass);
            ps.setString(5, phone);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public User insertTutor(String name, String email, String pass, String phone, String gender, int role) {
        String sql = "INSERT INTO Users (role_id, Name, Email, Password, Phone, Gender, Address, image_url) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try ( PreparedStatement ps = connection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setInt(1, role);
            ps.setString(2, name);
            ps.setString(3, email);
            ps.setString(4, pass);
            ps.setString(5, phone);
            ps.setString(6, gender);
            ps.setString(7, "");  // Address mặc định rỗng
            ps.setString(8, "");  // image_url mặc định rỗng

            int affectedRows = ps.executeUpdate();
            System.out.println("DEBUG: affectedRows = " + affectedRows);

            if (affectedRows == 0) {
                throw new SQLException("Không có bản ghi nào được chèn vào bảng Users.");
            }

            // Lấy ID vừa tạo từ database
            try ( ResultSet generatedKeys = ps.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int userId = generatedKeys.getInt(1);
                    System.out.println("DEBUG: ID được tạo: " + userId);
                    return new User(userId, role, name, email, pass, phone, gender);
                } else {
                    throw new SQLException("Không lấy được ID từ generatedKeys.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

// Phương thức kiểm tra email đã tồn tại hay chưa
    private boolean isEmailExists(String email) {
        String query = "SELECT COUNT(*) FROM Users WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true; // Email đã tồn tại
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

// Phương thức mã hóa mật khẩu (dùng SHA-256 hoặc một thư viện mã hóa mạnh mẽ hơn như bcrypt)
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString(); // Trả về mật khẩu đã mã hóa
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return password; // Nếu có lỗi thì trả về mật khẩu ban đầu
        }
    }

    public static void updatePassword(Connection connection, String email, String newPassword) {
        String query = "UPDATE users SET password = ? WHERE email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, newPassword);  // Chỉ cần sử dụng mật khẩu mới trực tiếp
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lưu token khôi phục mật khẩu
    public void saveResetToken(String email, String token) {
        String sql = "UPDATE Users SET reset_token = ? WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Lấy email dựa trên token
    public String getEmailByResetToken(String token) {
        String sql = "SELECT Email FROM Users WHERE reset_token = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, token);
            try ( ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("Email");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Kiểm tra token có hợp lệ không
    public boolean isValidResetToken(String email, String token) {
        String sql = "SELECT * FROM Users WHERE Email = ? AND reset_token = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.setString(2, token);
            try ( ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Cập nhật mật khẩu
    public void updatePassword(String email, String newPassword) {
        String sql = "UPDATE Users SET Password = ? WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, newPassword);
            ps.setString(2, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Xóa token sau khi sử dụng
    public void clearResetToken(String email) {
        String sql = "UPDATE Users SET reset_token = NULL WHERE Email = ?";
        try ( PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setString(1, email);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Phương thức hỗ trợ để trích xuất thông tin User từ ResultSet
    private User extractUser(ResultSet rs) throws SQLException {
        return new User(
                rs.getInt("UserID"),
                rs.getInt("role_id"),
                rs.getString("Email"),
                rs.getString("Name"),
                rs.getString("Password"),
                rs.getString("Phone"),
                rs.getString("Gender"),
                rs.getString("Address"),
                rs.getString("image_url")
        );
    }
}
