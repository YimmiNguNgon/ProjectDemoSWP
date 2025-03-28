/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.PaymentDAO;
import model.Payment;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.PaymentInfoDTO;

@WebServlet(name = "ManagerPaymentServlet", urlPatterns = {"/ManagerPayment"})
public class ManagerPaymentServlet extends HttpServlet {

    private final PaymentDAO paymentDAO = new PaymentDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String studentName = request.getParameter("studentName");
        String status = request.getParameter("status");

        try {
            if ("search".equals(action)) {
                searchPayments(request, response, studentName, status);
            } else {
                listPayments(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi xử lý yêu cầu.");
            request.getRequestDispatcher("paymentmanager.jsp").forward(request, response);
        }
    }

    private void listPayments(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<PaymentInfoDTO> paymentList = paymentDAO.getAllPayments();
        request.setAttribute("payments", paymentList);
        request.getRequestDispatcher("paymentmanager.jsp").forward(request, response);
    }

    private void searchPayments(HttpServletRequest request, HttpServletResponse response, String studentName, String status)
            throws ServletException, IOException {
        List<PaymentInfoDTO> paymentList = paymentDAO.searchPayments(studentName, status);
        request.setAttribute("payments", paymentList);
        request.getRequestDispatcher("paymentmanager.jsp").forward(request, response);
    }
}
