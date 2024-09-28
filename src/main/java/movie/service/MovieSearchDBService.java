// FilmNote/src/main/java/movie.service.MovieSearchDBService.java
package movie.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.control.CommandProcess;

import movie.bean.MovieDTO;
import movie.bean.MoviePaging;
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
		int currentPage = 1;
		if (pg != null) {
			try {
				currentPage = Integer.parseInt(pg);
				if (currentPage < 1) {
					currentPage = 1; // 최소 페이지는 1
				}
			} catch (NumberFormatException e) {
				currentPage = 1; // 변환 실패 시 기본값 설정
			}
		}

		if (searchOpt == null || searchValue == null || searchValue.trim().isEmpty()) {
			response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
			return errorResponse("검색한 값이 없습니다.").toString();
		}

		// 2. DB
		MovieDAO movieDAO = MovieDAO.getInstance();
		int totalSearch = movieDAO.totalSearch(searchOpt, searchValue); // 검색한 갯수
		int limit = 10;
		int startNum = (currentPage - 1) * limit; // 시작 위치

		// Map<String, Object>로 영화 목록과 총 개수를 가져옴
		Map<String, Object> resultMap = movieDAO.searchMovies(searchOpt, searchValue, startNum, limit);

		List<MovieDTO> movieDTOList = (List<MovieDTO>) resultMap.get("movies"); // List<MovieDTO>로 캐스팅
		// totalMovies와 movieDTOList는 메서드에서 제공해야 함
		int totalMovies = (Integer) resultMap.get("totalMovies"); // 총 영화 개수 가져오기

		// 페이징 처리
		MoviePaging moviePaging = new MoviePaging();
		moviePaging.setCurrentPage(currentPage);
		moviePaging.setPageBlock(5);
		moviePaging.setPageSize(limit);
		moviePaging.setTotalA(totalSearch);
		moviePaging.makePagingHTML();

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
		jsonResponse.put("totalMovies", totalMovies); // 서버에서 제대로 설정되는지 확인
		jsonResponse.put("pagingHTML", moviePaging.getPagingHTML().toString()); // 페이징 HTML도 같이 확인

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(jsonResponse.toString());

		return null;
	}

	private JSONObject errorResponse(String message) {
		JSONObject errorResponse = new JSONObject();
		errorResponse.put("error", message);
		return errorResponse;
	}

}