// FilmNote/src/main/java/movie.service.MovieDeleteDBService.java
package movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;

public class MovieDeleteDBService implements CommandProcess {

   @Override
   public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
      // 1. Data 받기
      int mcode = Integer.parseInt(request.getParameter("mcode"));
      System.out.println("mcode: " + mcode);

      
      // 2. DB
      MovieDTO movieDTO = new MovieDTO();
      movieDTO.setMcode(mcode);
      
      MovieDAO movieDAO = MovieDAO.getInstance();
      movieDAO.deleteMovie(mcode);
      
      
      
      return "none";
   }

}
