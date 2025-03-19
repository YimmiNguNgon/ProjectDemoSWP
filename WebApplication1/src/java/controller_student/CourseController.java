/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller_student;

import dal.CourseDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Courses;

@WebServlet(name="CourseController", urlPatterns={"/courses"})
public class CourseController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Lấy giá trị của tham số 'level' từ URL
            String level = request.getParameter("level");

            // Tạo đối tượng CourseDAO để truy vấn dữ liệu khóa học
            CourseDAO coursesDAO = new CourseDAO();
            List<Courses> coursesList;

            // Nếu có tham số level, lọc khóa học theo trình độ
            if (level != null && !level.isEmpty()) {
                coursesList = coursesDAO.getCoursesByLevel(level);
            } else {
                // Nếu không có tham số level, lấy tất cả khóa học
                coursesList = coursesDAO.getAllCourses();
            }

            // Đưa danh sách khóa học vào request để truyền cho JSP
            request.setAttribute("coursesList", coursesList);

            // Chuyển tiếp đến trang JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("courses.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
