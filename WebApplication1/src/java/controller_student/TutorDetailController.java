/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller_student;

import dal.CourseDAO;
import dal.TutorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Courses;
import model.Tutor;

/**
 *
 * @author Huy
 */
public class TutorDetailController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet TutorDetailController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TutorDetailController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         // Lấy tutorId từ URL
        String tutorId = request.getParameter("tutorId");
        
        // Kiểm tra xem tutorId có hợp lệ không
        if (tutorId != null) {
            int id = Integer.parseInt(tutorId);
            
            // Lấy thông tin gia sư từ DAO
            TutorDAO tutorDAO = new TutorDAO();
            Tutor tutor = tutorDAO.getTutorById(id); // Lấy gia sư theo ID
            
            // Lấy danh sách khóa học của gia sư
            CourseDAO courseDAO = new CourseDAO();
            List<Courses> courseList = courseDAO.getCoursesByTutorId(id);
            
            // Đưa dữ liệu vào request
            request.setAttribute("tutor", tutor);
            request.setAttribute("courseList", courseList);
            
            // Chuyển hướng đến trang JSP để hiển thị thông tin
            request.getRequestDispatcher("tutordetail.jsp").forward(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Tutor ID is missing.");
        }
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
