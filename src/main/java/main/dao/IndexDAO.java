package main.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import movie.bean.MovieDTO;

public class IndexDAO {
	private static IndexDAO instance = new IndexDAO();
	private SqlSessionFactory sqlSessionFactory;
	private String indexMapper = "indexSQL";
    
	public IndexDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static IndexDAO getInstance() {
		return instance;
	}
	
	// 영화 목록
	public List<MovieDTO> getMovieBoardList() {
		System.out.println("getMovieBoardList() 호출");
		List<MovieDTO> movieboardList = null;
		
		SqlSession session = sqlSessionFactory.openSession();
		movieboardList = session.selectList(indexMapper+".getMovieBoardList");
		session.close();
		
		return movieboardList;
	}
	
	// 영화 정보
	public MovieDTO getMovieBoardView(int mcode) {
		System.out.println("getMovieBoardView(" + mcode + ") 호출");
		MovieDTO movieDTO = null;
		
		SqlSession session = sqlSessionFactory.openSession();
		movieDTO = session.selectOne(indexMapper+".getMovieBoardView", mcode);
		session.close();
		
		return movieDTO;
	}
}
