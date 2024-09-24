package main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;

public class MovieViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int mcode = Integer.parseInt(request.getParameter("mcode"));
		MovieDTO movieDTO = MovieDAO.getInstance().getBoard(mcode);
		
		request.setAttribute("movieDTO", movieDTO);
		return "";
	}

}
