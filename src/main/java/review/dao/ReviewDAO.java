// FilmNote/src/main/java/review.dao.ReviewDAO.java
package review.dao;

import review.bean.ReviewDTO;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import movie.bean.MovieDTO;

public class ReviewDAO {
	// 싱글톤 인스턴스 생성
	private static ReviewDAO instance = new ReviewDAO();
	private SqlSessionFactory sqlSessionFactory;
	private String reviewMapper = "reviewSQL";
    
	public static ReviewDAO getInstance() {
		return instance;
	}
	
	public ReviewDAO() { // Driver Loading
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<ReviewDTO> getReviewList(int mcode) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ReviewDTO> reviewDTOList = sqlSession.selectList(reviewMapper + ".getReviewList", mcode);
		sqlSession.close();
		
		return reviewDTOList;
	}
	
}
