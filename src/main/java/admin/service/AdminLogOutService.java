package admin.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;

public class AdminLogOutService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        request.getSession().invalidate(); // 세션 무효화
        return "/index.do"; // 메인 페이지로 이동
    }
}