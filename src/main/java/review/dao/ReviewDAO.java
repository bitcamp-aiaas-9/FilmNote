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

public class ReviewDAO {
	// 싱글톤 인스턴스 생성
	private static ReviewDAO instance = new ReviewDAO();
	private SqlSessionFactory sqlSessionFactory;
    
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
	
}
