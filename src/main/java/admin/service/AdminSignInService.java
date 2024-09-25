package admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import admin.bean.AdminDTO;
import admin.dao.AdminDAO;

public class AdminSignInService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        String aid = request.getParameter("aid");
        String apwd = request.getParameter("apwd");

        AdminDAO adminDAO = AdminDAO.getInstance();
        AdminDTO adminDTO = adminDAO.loginAdmin(aid, apwd);

        if (adminDTO != null) {
            // 관리자 로그인 성공 시 세션에 관리자 정보 저장
            request.getSession().setAttribute("adminDTO", adminDTO);
            return "/index.do";  // 메인 페이지로 이동
        } else {
            // 로그인 실패 시 로그인 페이지로 다시 이동
            request.setAttribute("errorMsg", "Invalid admin ID or password.");
            return "/admin/adminSignIn.jsp";
        }
    }
}
