/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller_student;

import dal.CourseDAO;
import dal.CourseRequestDAO;
import dal.PaymentDAO;
import dal.ScheduleDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Payment;
import model.PaymentInfo;

/**
 *
 * @author ADMIN-PC
 */
@WebServlet(name = "CheckPayment", urlPatterns = {"/CheckPayment"})

public class CheckPayment extends HttpServlet {

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
            out.println("<title>Servlet CheckPayment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CheckPayment at " + request.getContextPath() + "</h1>");
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
        CourseRequestDAO courseRequestDao = new CourseRequestDAO();
        ScheduleDAO scheduleDAO = new ScheduleDAO();
        PaymentDAO paymentDao = new PaymentDAO();
        HttpSession session = request.getSession();

        String responseCode = request.getParameter("vnp_ResponseCode");
        String amountParameter = request.getParameter("vnp_Amount"); // Chuỗi số tiền từ VNPAY
        PaymentInfo paymentInfo = (PaymentInfo) session.getAttribute("paymentInfo");

        // Kiểm tra nếu không có thông tin thanh toán
        if (paymentInfo == null) {
            request.setAttribute("errorMessage", "Lỗi: Không có thông tin thanh toán!");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
            return;
        }

        try {
            // ✅ Chuyển amount từ String -> int với xử lý lỗi
            int amount = 0;
            if (amountParameter != null && !amountParameter.isEmpty()) {
                try {
                    amount = Integer.parseInt(amountParameter) / 100; // VNPAY trả về số nhân 100, cần chia lại
                } catch (NumberFormatException e) {
                    System.out.println("Lỗi parse amount: " + e.getMessage());
                    request.setAttribute("errorMessage", "Số tiền thanh toán không hợp lệ!");
                    request.getRequestDispatcher("reservation.jsp").forward(request, response);
                    return;
                }
            }

            // ✅ Khởi tạo đối tượng Payment để lưu trạng thái thanh toán
            Payment payment = new Payment();
            payment.setCourseID(paymentInfo.getCourseId());
            payment.setTutorID(paymentInfo.getTutorId());
            payment.setAmount(amount);

            if ("00".equals(responseCode)) { // 00 = Thành công
                int studentId = courseRequestDao.addStudent(paymentInfo.getUserId(), paymentInfo.getCourseId());

                if (studentId > 0) {
                    payment.setStudentID(studentId);

                    boolean isAdded = courseRequestDao.addCourseRequest(
                            paymentInfo.getUserId(),
                            paymentInfo.getTutorId(),
                            paymentInfo.getCourseId()
                    );

                    if (isAdded) {
                        scheduleDAO.createSchedule(
                                paymentInfo.getTutorId(),
                                studentId,
                                paymentInfo.getDayOfWeek(),
                                paymentInfo.getStartTime(),
                                paymentInfo.getEndTime()
                        );

                        payment.setStatus("Completed");
                        request.setAttribute("successMessage", "Thanh toán và đặt lịch thành công!");
                    } else {
                        payment.setStatus("Failed");
                        request.setAttribute("errorMessage", "Đặt lịch thất bại, thử lại ngay!");
                    }
                } else {
                    payment.setStatus("Failed");
                    request.setAttribute("errorMessage", "Đặt lịch thất bại, thử lại ngay!");
                }
            } else if ("24".equals(responseCode)) { // 24 = Hủy giao dịch
                payment.setStatus("Failed");
                request.setAttribute("errorMessage", "Giao dịch bị hủy!");
            } else {
                payment.setStatus("Failed");
                request.setAttribute("errorMessage", "Thanh toán thất bại!");
            }

            // ✅ Lưu trạng thái thanh toán vào database
            paymentDao.insertPayment(payment);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Lỗi hệ thống: " + e.getMessage());
        } finally {
            session.removeAttribute("paymentInfo");
            request.getRequestDispatcher("reservation.jsp").forward(request, response);
        }
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
        processRequest(request, response);
    }

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
