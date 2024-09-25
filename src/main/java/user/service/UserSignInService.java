package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserSignInService implements CommandProcess {
    
    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        String uid = request.getParameter("uid");
        String upwd = request.getParameter("upwd");

        UserDAO userDAO = UserDAO.getInstance();
        UserDTO userDTO = userDAO.loginUser(uid, upwd);
        
        if (userDTO != null) {
            // 로그인 성공 시 세션에 사용자 정보 저장
            request.getSession().setAttribute("userDTO", userDTO);
            return "/index.do";  // 메인 페이지로 이동
        } else {
            // 로그인 실패 시 로그인 페이지로 다시 이동
            request.setAttribute("errorMsg", "Invalid username or password.");
            return "/user/userSignIn.jsp";
        }
    }
}
