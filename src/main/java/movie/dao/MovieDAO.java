// FilmNote/src/main/java/movie.dao.MovieDAO.java
package movie.dao;

import movie.bean.MovieDTO;
import java.io.IOException;
import java.io.Reader;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MovieDAO {

	// 싱글톤 인스턴스 생성
	private static MovieDAO instance = new MovieDAO();
	private SqlSessionFactory sqlSessionFactory;
    
	public static MovieDAO getInstance() {
		return instance;
	}
	
	public MovieDAO() { // Driver Loading
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
    /** movieWrite.jsp */
	// 영화 등록
	// 이미지 Object Storage 에 올리기
	
	
	
	
	
	
	
	
	
	/** movieList.jsp */
	// 영화 목록
	public List<MovieDTO> movieList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);

		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieDTO> list = sqlSession.selectList("movieSQL.movieList", map);
		sqlSession.close();

		return list;
		
	}	
	
	
	// 영화 개수
	public int getTotalA() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int totalA = 0;      
		totalA = sqlSession.selectOne("movieSQL.getTotalA");        
		sqlSession.close();    
		
		return totalA;
	}
	
	
	
	/** movieView.jsp */
	// 영화 조회
	public MovieDTO getBoard(int mcode) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		MovieDTO movieDTO = sqlSession.selectOne("movieSQL.getBoard", mcode);
		sqlSession.close();
		return movieDTO;
	}

	// 영화 평점 업데이트
	public void updateMovieScore(int mcode, double score) {
		System.out.println("updateMovieScore() 호출");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mcode", mcode);
		map.put("score", score);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("movieSQL.updateMovieScore", map);
		sqlSession.commit();
		sqlSession.close();
	}

	// 영화 삭제 - 1개 이상 삭제 (1개도 가능)
    public void deleteMovies(String[] mcodes) {
        SqlSession sqlSession = sqlSessionFactory.openSession();
        try {
            Map<String, Object> mcodeMap = new HashMap<>();
            mcodeMap.put("mcodes", mcodes);
            sqlSession.delete("movieSQL.deleteMovies", mcodeMap);
            sqlSession.commit();
        } catch (Exception e) {
            e.printStackTrace();
            sqlSession.rollback(); // 오류 발생 시 롤백
        } finally {
            sqlSession.close();
        }
    }



    
    
    
    
    
    
	/** movieList.jsp */
	// 영화 검색
    
	
    
    
    
	
	


	
}

