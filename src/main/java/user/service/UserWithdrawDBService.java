// FilmNote/src/main/java/user/service/UserWithdrawDBService.java
package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserWithdrawDBService implements CommandProcess {
    
	@Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		   response.setContentType("text/html; charset=UTF-8"); // 응답의 인코딩을 UTF-8로 설정
		    response.setCharacterEncoding("UTF-8"); // 응답의 캐릭터 인코딩 설정
        HttpSession session = request.getSession();
       
        UserDTO userDTO = (UserDTO) session.getAttribute("userDTO");
        if (userDTO == null) {
            response.getWriter().write("userDTO=null");
            return null;
        }
        
        String uid =userDTO.getUid();
        String nowpwd = request.getParameter("nowpwd");
        UserDAO userDAO = UserDAO.getInstance();
        boolean ispwd = userDAO.pwdCheck(uid, nowpwd);
        
        if(!ispwd) {
        	response.getWriter().write("비밀번호가 맞지 않습니다");
        	return null;
        }
        
        
        int result = userDAO.userWithdraw(uid);
        
        
        if (result > 0) {
            session.invalidate(); // 세션 삭제
            response.getWriter().write("success");
        } else {
            response.getWriter().write("fail");
        }
        
        return null; // 뷰 페이지 반환이 필요하지 않음   
    }
}