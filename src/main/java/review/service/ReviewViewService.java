// FilmNote/src/main/java/review.service.ReviewViewService.java
package review.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;
import review.bean.ReviewDTO;
import review.dao.ReviewDAO;

public class ReviewViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int mcode = Integer.parseInt(request.getParameter("mcode"));
		MovieDTO movieDTO = MovieDAO.getInstance().getMovie(mcode); // 영화 정보
		List<ReviewDTO> reviewDTOList = ReviewDAO.getInstance().getReviewList(mcode); // 리뷰 리스트
		
		request.setAttribute("movieDTO", movieDTO); // 영화 정보
		request.setAttribute("reviewDTOList", reviewDTOList); // 리뷰 리스트
		
		return "/review/reviewView.jsp";
	}

}
