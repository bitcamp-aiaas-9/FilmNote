// FilmNote/src/main/java/movie.service.MovieEditDBService.java
package movie.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import movie.bean.MovieDTO;
import movie.dao.MovieDAO;

public class MovieEditDBService implements CommandProcess {
	private String bucketName = "filmnote-bucket-116";
	
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 실제 폴더
		String realFolder = request.getServletContext().getRealPath("/storage");	
		
		System.out.println("realFolder : " + realFolder);
		// D:\Web\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\FilmNote\storage
		
		// 업로드 디버깅
		System.out.println("Before MultipartRequest initialization");
		
	    MultipartRequest multi = new MultipartRequest(
		        request, 
		        realFolder, // 이미지 저장되는 위치
		        5 * 1024 * 1024, // 5MB
		        "UTF-8",
		        new DefaultFileRenamePolicy() // 같은 이름이 업로드되면 파일명 변경
		    );
	    System.out.println("MultipartRequest initialized successfully" + multi);
	    
		System.out.print("MovieEditDBService.java mcode : ");
		System.out.println(request.getParameter("mcode"));
		
		// 1. Data 받기
		int mcode = Integer.parseInt(request.getParameter("mcode"));
		int pg = Integer.parseInt(request.getParameter("pg"));		
	    String movieTitle = multi.getParameter("movieTitle");
	    String movieDirector = multi.getParameter("movieDirector");
	    String movieGenre = multi.getParameter("movieGenre");
	    String movieReleaseDate = multi.getParameter("movieReleaseDate");
	    int movieRating = Integer.parseInt(multi.getParameter("movieRating"));
	    float movieScore = Float.parseFloat(multi.getParameter("movieScore"));
	    String movieSynopsis = multi.getParameter("movieSynopsis");		
		
        /** 포스터 처리 */
        String moviePoster = multi.getFilesystemName("moviePoster");
        // 파일 객체 생성 (파일의 이름만 알고 있기 때문)
        File file = new File(realFolder, moviePoster);
	    
	    // Object Storage (NCP)에 새로운 이미지 업로드
        NCPObjectStorageService ncp = new NCPObjectStorageService();
        String uploadedFileName = ncp.uploadFile(bucketName, "storage/", file); // UUID 쓰려면 moviePoster 에 랜덤 생성된 이름을 덮어씌워 줘야함
        String moviePosterURL = "https://kr.object.ncloudstorage.com/filmnote-bucket-116/storage/" + uploadedFileName;
   
	    
		
		
	    // 2. DB
        MovieDTO movieDTO = new MovieDTO();
        movieDTO.setTitle(movieTitle);
        movieDTO.setDirector(movieDirector);
        movieDTO.setGenre(movieGenre);
        movieDTO.setRelease_date(movieReleaseDate);
        movieDTO.setRating(movieRating);
        movieDTO.setScore(movieScore);
        movieDTO.setSynopsis(movieSynopsis);
        movieDTO.setPoster(moviePosterURL);
	
		
		// 3. Response
        MovieDAO movieDAO = MovieDAO.getInstance();
        movieDAO.updateMovie(movieDTO);
		
		
		return "none";
	}

}
