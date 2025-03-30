package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String token = request.getParameter("token");// Lấy token từ URL
        // Kiểm tra token có hợp lệ không
        String email = userDAO.getEmailByResetToken(token);
        if (email == null) {
            request.setAttribute("error", "Link không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }
        // Nếu hợp lệ, chuyển sang form nhập mật khẩu mới
        request.setAttribute("email", email);
        request.setAttribute("token", token);
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy các tham số từ form
        String token = request.getParameter("token");
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        // Kiểm tra lại token (phòng trường hợp token bị thay đổi)
        if (!userDAO.isValidResetToken(email, token)) {
            request.setAttribute("error", "Link không hợp lệ hoặc đã hết hạn.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }
        // Kiểm tra mật khẩu mới và xác nhận có khớp không
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu xác nhận không khớp.");
            request.setAttribute("email", email);
            request.setAttribute("token", token);
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }
        // Cập nhật mật khẩu mới và xóa token
        userDAO.updatePassword(email, newPassword);
        userDAO.clearResetToken(email);
         // Thông báo thành công và chuyển về trang login
        request.setAttribute("message", "Mật khẩu đã được cập nhật thành công. Vui lòng đăng nhập lại.");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}