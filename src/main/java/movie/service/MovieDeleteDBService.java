// FilmNote/src/main/java/movie.service.MovieDeleteDBService.java
package movie.service;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import movie.dao.MovieDAO;

public class MovieDeleteDBService implements CommandProcess {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // 1. Data 받기
	  String[] mcodes = request.getParameterValues("mcodes");
      System.out.println("mcode: " + mcodes);

      
      // 2. DB
//      MovieDTO movieDTO = new MovieDTO();
//      movieDTO.setMcode(mcode);
//      
//      MovieDAO movieDAO = MovieDAO.getInstance();
//      movieDAO.deleteMovie(mcode);
      
      
      if (mcodes != null && mcodes.length > 0) {
          MovieDAO movieDAO = MovieDAO.getInstance();
          System.out.println("mcodes: " + Arrays.toString(mcodes));
          movieDAO.deleteMovies(mcodes);
      }
      
      
      return "none";
   }

}
