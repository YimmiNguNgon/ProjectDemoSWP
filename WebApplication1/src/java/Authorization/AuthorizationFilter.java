//package Authorization;
//
//import jakarta.servlet.Filter;
//import jakarta.servlet.FilterChain;
//import jakarta.servlet.FilterConfig;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.ServletRequest;
//import jakarta.servlet.ServletResponse;
//import jakarta.servlet.annotation.WebFilter;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import model.User;
//
//import java.io.IOException;
//
//@WebFilter("/*")
//public class AuthorizationFilter implements Filter {
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession(false);
//
//        String uri = httpRequest.getRequestURI();
//        String contextPath = httpRequest.getContextPath();
//
//        // Danh sách các đường dẫn không cần kiểm tra đăng nhập
//        if (uri.startsWith(contextPath + "/css/")
//                || uri.startsWith(contextPath + "/js/")
//                || uri.startsWith(contextPath + "/images/")
//                || uri.equals(contextPath + "/access-denied.jsp")
//                || uri.equals(contextPath + "/forgotpassword.jsp")
//                || uri.equals(contextPath + "/login.jsp")
//                || uri.equals(contextPath + "/forgotPassword")
//                || uri.equals(contextPath + "/resetPassword")
//                || uri.equals(contextPath + "/login")
//                || uri.equals(contextPath + "/logout")
//                || uri.equals(contextPath + "/signuptutor.jsp")
//                || uri.equals(contextPath + "/signupstudent.jsp")
//                || uri.equals(contextPath + "/menu.jsp")
//                || uri.equals(contextPath + "/courses")
//                || uri.equals(contextPath + "/detail.jsp")
//                || uri.equals(contextPath + "/TutorListForUsersServlet")) {
//            chain.doFilter(request, response);
//            return;
//        }
//
//         //Phần còn lại giữ nguyên
//        if (session == null || session.getAttribute("user") == null) {
//            httpResponse.sendRedirect(contextPath + "/login.jsp");
//            
//            return;
//        }
//
//        User user = (User) session.getAttribute("user");
//        int role = user.getRole();
//
//        boolean isAllowed = false;
//
//        switch (role) {
//            case 1:
//                isAllowed = isAdminAllowed(uri, contextPath);
//                break;
//            case 2:
//                isAllowed = isStaffAllowed(uri, contextPath);
//                break;
//            case 3:
//                isAllowed = isTutorAllowed(uri, contextPath);
//                break;
//            case 4:
//                isAllowed = isStudentAllowed(uri, contextPath);
//                break;
//            default:
//                isAllowed = false;
//                break;
//        }
//
//        if (isAllowed) {
//            chain.doFilter(request, response);
//        } else {
//            httpResponse.sendRedirect(contextPath + "/access-denied.jsp");
//        }
//    }
//
//    // Các phương thức isXxxAllowed() giữ nguyên như cũ
//    private boolean isAdminAllowed(String uri, String contextPath) {
//        return uri.equals(contextPath + "/homeadmin.jsp")
//                || uri.equals(contextPath + "/managercourse")
//                || uri.equals(contextPath + "/managertutor")
//                || uri.equals(contextPath + "/tutormanager.jsp")
//                || uri.equals(contextPath + "/ManagerPayment")
//                
//                || uri.equals(contextPath + "/reportdashboard.jsp")
//                || uri.equals(contextPath + "/schedulemanager.jsp")
//                || uri.equals(contextPath + "/coursemanager.jsp")
//                || uri.equals(contextPath + "/editaccount.jsp")
//                || uri.equals(contextPath + "/feedbacksupport.jsp")
//                || uri.equals(contextPath + "/manageruser");
//    }
//
//    private boolean isStaffAllowed(String uri, String contextPath) {
//        return uri.equals(contextPath + "/homestaff.jsp")
//                || uri.equals(contextPath + "/coursemanager.jsp")
//                || uri.equals(contextPath + "/editaccount.jsp")
//                || uri.equals(contextPath + "/login")
//                || uri.equals(contextPath + "/feedbacksupport.jsp");
//    }
//
//    private boolean isTutorAllowed(String uri, String contextPath) {
//        return uri.equals(contextPath + "/hometutor.jsp")
//                || uri.equals(contextPath + "/ProfileTuTorServlet")
//                || uri.equals(contextPath + "/tutorcoursesservlet")
//                || uri.equals(contextPath + "/ManageReservation")
//                || uri.equals(contextPath + "/scheduleservlet")
//                
//                || uri.equals(contextPath + "/coursemanager.jsp")
//                || uri.equals(contextPath + "/editaccount.jsp")
//                || uri.equals(contextPath + "/feedbacksupport.jsp");
//    }
//
//    private boolean isStudentAllowed(String uri, String contextPath) {
//        return uri.equals(contextPath + "/menu.jsp")
//                || uri.equals(contextPath + "/courses")
//                || uri.equals(contextPath + "/login")
//                || uri.equals(contextPath + "/TutorListForUsersServlet")
//                || uri.equals(contextPath + "/CourseLearnController")
//                || uri.equals(contextPath + "/userInfo")
//                
//                || uri.equals(contextPath + "/editaccount.jsp")
//                || uri.equals(contextPath + "/feedbacksupport.jsp");
//    }
//
//    @Override
//    public void destroy() {
//    }
//}
