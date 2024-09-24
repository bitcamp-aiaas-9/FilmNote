// FilmNote/src/main/java/main/IndexService.java
package main;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import main.dao.IndexDAO;
import movie.bean.MovieDTO;

public class IndexService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		List<MovieDTO> movieboardList = IndexDAO.getInstance().getMovieBoardList();
		request.setAttribute("movieboardList", movieboardList);
		
		return "/index.jsp";
	}

}
