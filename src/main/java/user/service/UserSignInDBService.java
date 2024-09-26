package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSignInDBService implements CommandProcess {
    
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
    	String uid = request.getParameter("uid");
        String upwd = request.getParameter("upwd");

        System.out.println("Attempting login for user: " + uid); // 로그 추가

        UserDAO userDAO = UserDAO.getInstance();
        UserDTO userDTO = null;
        try {
            userDTO = userDAO.loginUser(uid, upwd);
        } catch (Exception e) {
            System.out.println("Error during login: " + e.getMessage()); // 예외 로그
            e.printStackTrace();
        }

        if (userDTO != null) {
            System.out.println("Login successful for user: " + uid); // 로그 추가
            request.getSession().setAttribute("userDTO", userDTO);
            response.sendRedirect(request.getContextPath() + "/index.do");
            return "none";
        } else {
            System.out.println("Login failed for user: " + uid); // 로그 추가
            request.setAttribute("loginError", "아이디 또는 비밀번호가 올바르지 않습니다.");
            return "/user/userSignIn.jsp";
        }
    }
}
