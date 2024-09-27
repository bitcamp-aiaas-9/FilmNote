// FilmNote/src/main/java/movie.service.MovieSearchDBService.java
package movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;

public class MovieSearchDBService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 1. Data 받기
		String searchOpt = request.getParameter("searchOpt");
		String searchValue = request.getParameter("searchValue");
		String pg = request.getParameter("pg");

		System.out.println("searchOptDB : " + searchOpt);
		System.out.println("searchValueDB : " + searchValue);

		// 1.1. 현재 페이지 처리
		int currentPage = (pg != null) ? Integer.parseInt(pg) : 1;

		// 1.2. 입력 값 검증
		if (searchOpt == null || searchValue == null || searchValue.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return createErrorResponse("Invalid search options or value").toString();
		}

		  // 2. DB
	    MovieDAO movieDAO = MovieDAO.getInstance();
	    List<MovieDTO> movieDTOList = movieDAO.searchMovies(searchOpt, searchValue);
	   
	    // 3. Response 준비
	    JSONObject jsonResponse = new JSONObject();
	    JSONArray jsonArray = new JSONArray();

	    for (MovieDTO movieDTO : movieDTOList) {
	        JSONObject jsonObject = new JSONObject();
	        jsonObject.put("mcode", movieDTO.getMcode());
	        jsonObject.put("title", movieDTO.getTitle());
	        jsonObject.put("director", movieDTO.getDirector());
	        jsonObject.put("rating", movieDTO.getRating());
	        jsonArray.add(jsonObject);
	    }

	    jsonResponse.put("movies", jsonArray);
	    jsonResponse.put("currentPage", currentPage);
	    jsonResponse.put("totalMovies", movieDTOList.size()); // 검색한 영화 개수

	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(jsonResponse.toString());

	    return null;
	}

	private JSONObject createErrorResponse(String message) {
		JSONObject errorResponse = new JSONObject();
		errorResponse.put("error", message);
		return errorResponse;
	}

}
