// FilmNote/src/main/java/user/service/UserWithdrawDBService.java
package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.dao.UserDAO;

public class UserWithdrawDBService implements CommandProcess {
    
	@Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        HttpSession session = request.getSession();
        String uid = (String) session.getAttribute("uid");

        if (uid == null) {
            return "FilmNote.error.jsp"; // 유저 ID가 없을 때
        }
        
        UserDAO userDAO = UserDAO.getInstance();
        int result = userDAO.userWithdraw(uid);
        
        if (result > 0) {
            session.invalidate(); // 세션 삭제
            response.getWriter().write("success"); // 회원 탈퇴 성공
        } else {
            response.getWriter().write("error"); // 회원 탈퇴 실패
        }
        
        return null; // 뷰 페이지 반환이 필요하지 않음   
    }
}