package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;
import java.io.IOException;
import java.util.Properties;
import java.util.UUID;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/forgotPassword")
public class ForgotPasswordServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //nhận email từ form 
        String email = request.getParameter("email");
        
        // kiểm tra email có tồn tại
        User user = userDAO.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("error", "Email does not exist in the system.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }
        
        
        //tạo token reset
        String token = UUID.randomUUID().toString();
        userDAO.saveResetToken(email, token); 
        //tạo liên kết reset
        String resetLink = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
        
                + request.getContextPath() + "/resetPassword?token=" + token;
        // gửi email chứa liên kết reset
        sendResetEmail(email, resetLink);

        
        request.setAttribute("message", "A password reset link has been sent to your email.");
        request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
    }

    private void sendResetEmail(String toEmail, String resetLink) {
        final String fromEmail = "huyhdhe187019@fpt.edu.vn"; 
        final String password = "lbmnsbvdlkajnyga"; 

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Password Reset");
            message.setText("Click the link below to reset your password: " + resetLink);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}