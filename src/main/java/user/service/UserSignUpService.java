// FilmNote/src/main/java/user/service/UserSignUpService.java
package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class UserSignUpService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		return "/user/userSignUp.jsp"; // 회원가입 페이지
	}

}

