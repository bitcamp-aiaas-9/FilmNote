package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import user.bean.UserDTO;
import user.dao.UserDAO;

public class UserEditDBService implements CommandProcess {
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("userId");
		
		UserDAO userDAO = UserDAO.getInstance();
		UserDTO userDTO = UserDAO.getMember(id);
		
		request.setAttribute("userDTO", userDTO);
				
		return "/user/userEdit.jsp";
	}

}
