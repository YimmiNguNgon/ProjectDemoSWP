/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.TutorDAO;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Huy
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("fullname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String role = request.getParameter("role");
        String gender = request.getParameter("gender");

        if ("Male".equalsIgnoreCase(gender)) {
            gender = "Nam";
        } else if ("Female".equalsIgnoreCase(gender)) {
            gender = "Nữ";
        } else {
            gender = "Nam"; // Giá trị mặc định nếu không hợp lệ
        }

        UserDAO userDAO = new UserDAO();
        TutorDAO tutorDAO = new TutorDAO();

        boolean registrationSuccess = false;

        if ("student".equals(role)) {
            userDAO.insertStudent(name, email, password, phone);
            registrationSuccess = true;
        } else if ("tutor".equals(role)) {
            User user = userDAO.insertTutor(name, email, password, phone, gender, 3);
            User newU = userDAO.getUserByEmail(email);
            System.out.println("Tạo c: " + newU);

            if (user != null) {
                System.out.println("Tạo user thành công: " + newU);
                boolean added = tutorDAO.addTutor(newU.getId(), "", "", 0, false);
                if (added) {
                    System.out.println("Thêm tutor thành công.");
                    registrationSuccess = true;
                } else {
                    System.out.println("Thêm tutor thất bại.");
                }
            } else {
                System.out.println("Tạo user thất bại.");
            }

        }

        if (registrationSuccess) {
            response.sendRedirect("./login?status=success");
        } else {
            request.setAttribute("error", "Đăng ký không thành công. Vui lòng thử lại.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }// Quay lại trang đăng ký nếu thất bại

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
