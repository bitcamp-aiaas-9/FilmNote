// FilmNote/src/main/java/user/service/UserSignUpDBService.java
package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class UserSignUpDBService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/user/userSignUp.jsp";
	}

}

