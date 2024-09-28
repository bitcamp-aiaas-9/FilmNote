package user.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.control.CommandProcess;

import user.dao.UserDAO;

public class UserPwdCheckService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String nowupwd = request.getParameter("nowupwd");
		String uid = request.getParameter("uid");
		UserDAO userDAO = UserDAO.getInstance();

		boolean pwdCheck = userDAO.pwdCheck(uid, nowupwd);

		JSONObject jsonResoponse = new JSONObject();

		// 결과에 따라 JSON 응답 구성
		jsonResoponse.put("pwdCheck", pwdCheck);
		if (!pwdCheck) {
			jsonResoponse.put("error", "비밀번호가 맞지 않습니다."); // 비밀번호 불일치 시 오류 메시지
		}

		response.setContentType("application/json");
		response.getWriter().write(jsonResoponse.toString());

		return "none";
	}

}
