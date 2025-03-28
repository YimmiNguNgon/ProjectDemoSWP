/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_student;

import dal.StudentDAO;
import dal.UserDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Student1;
import model.User;

/**
 *
 * @author Huy
 */
public class UserInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
         StudentDAO studentDAL = new StudentDAO();
        User user = (User) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("login?type=authentization");
            return;
        }

        if (user != null) {
            request.setAttribute("user", user);
            int userId = Integer.parseInt(user.getId() + ""); 
            List<Student1> students = studentDAL.getStudentHistory(userId);

            // Set the list of students as an attribute for JSP
            request.setAttribute("students", students);
            // Chuyển hướng tới trang userInfo.jsp để hiển thị thông tin người dùng
            RequestDispatcher dispatcher = request.getRequestDispatcher("/profileUser.jsp");
            dispatcher.forward(request, response);
        } else {
            // Nếu không tìm thấy người dùng, chuyển hướng đến trang login
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Do not need to handle POST request for editing anymore, just forward to GET
        doGet(request, response);
    }
}
