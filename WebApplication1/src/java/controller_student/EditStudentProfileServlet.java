/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller_student;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Huy
 */

public class EditStudentProfileServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form chỉnh sửa
        int userId = Integer.parseInt(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String imageUrl = request.getParameter("imageUrl");

        // Lấy mật khẩu từ form (nếu có thay đổi)
        String password = request.getParameter("password"); // Nếu không thay đổi mật khẩu, có thể để trống hoặc giữ nguyên

        // Giả sử role không thay đổi
        int role = 0;  // Bạn có thể để giá trị mặc định hoặc lấy từ session nếu cần

        // Tạo đối tượng User mới từ dữ liệu form
        User user = new User(userId, role, email, fullName, password, phoneNumber, gender, address, imageUrl);

        // Gọi phương thức DAL để cập nhật thông tin người dùng
        boolean isUpdated = new UserDAO().editUser(user);
        HttpSession session = request.getSession();
        session.setAttribute("user", user);
        if (isUpdated) {
            // Nếu cập nhật thành công, chuyển hướng đến trang thông tin người dùng
            response.sendRedirect("userInfo"); // Gửi email để xác định người dùng
        } else {
            // Nếu không thành công, hiển thị thông báo lỗi và chuyển đến trang profileUser.jsp
            request.setAttribute("errorMessage", "Failed to update user information.");
            request.getRequestDispatcher("profileUser.jsp").forward(request, response); // Chuyển hướng tới profileUser.jsp
        }
    }
}
