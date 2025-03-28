/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller_student;

import dal.StudentDAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Student;
import model.Student1;

/**
 *
 * @author Huy
 */
public class HistoryEnroll extends HttpServlet {
   
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
            out.println("<title>Servlet HistoryEnroll</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HistoryEnroll at " + request.getContextPath () + "</h1>");
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
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Initialize the DAL class directly in the doGet method
    StudentDAO studentDAL = new StudentDAO();
    
    // Get userID parameter from the request
    String userIdParam = request.getParameter("userID");
    
    if (userIdParam == null || userIdParam.isEmpty()) {
        // Handle case when userID is not provided or invalid
        response.sendRedirect("errorPage.jsp"); // Redirect to an error page or show an error message
        return;
    }

    try {
        int userId = Integer.parseInt(userIdParam); // Parse userID
        // Call the DAL to fetch the student's registration history
        List<Student1> students = studentDAL.getStudentHistory(userId);
        
        // Set the list of students as an attribute for JSP
        request.setAttribute("students", students);
        
        // Forward the request to the JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("/historyenroll.jsp");
        dispatcher.forward(request, response);
    } catch (NumberFormatException e) {
        // Handle invalid userID format (not a valid integer)
        response.sendRedirect("errorPage.jsp"); // Redirect to an error page or show an error message
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
