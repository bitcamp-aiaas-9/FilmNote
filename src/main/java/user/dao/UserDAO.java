// FilmNote/src/main/java/user.dao.UserDAO.java
package user.dao;

import user.bean.UserDTO;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDAO {
	// 싱글톤 인스턴스 생성
	private static UserDAO instance = new UserDAO();
	private SqlSessionFactory sqlSessionFactory;
    
	public static UserDAO getInstance() {
		return instance;
	}
	
	public UserDAO() { // Driver Loading
		try {
			Reader reader = Resources.getResourceAsReader("mybatis-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
		public UserDTO loginUser(String uid, String upwd) {
		    SqlSession sqlSession = sqlSessionFactory.openSession();
		    try {
		        Map<String, String> params = new HashMap<>();
		        params.put("uid", uid);
		        params.put("upwd", upwd);
		        return sqlSession.selectOne("userSQL.loginUser", params);
		    } finally {
		        sqlSession.close();
		    }
		}
	
	public void insertUser(UserDTO user) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			sqlSession.insert("userSQL.insertUser", user);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public void userEdit(UserDTO user) {
		  SqlSession sqlSession = sqlSessionFactory.openSession();		  
		  sqlSession.update("userSQL.userEdit", user);
		  sqlSession.commit();
		  sqlSession.close();
	}

	public UserDTO getMember(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		UserDTO userDTO = sqlSession.selectOne("userSQL.getMember", id);
		sqlSession.close();		 	
		return userDTO;
	}
	
	public boolean checkIdExists(String uid) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		try {
			int count = sqlSession.selectOne("userSQL.checkIdExists", uid);
			return count > 0;
		} finally {
			sqlSession.close();
		}
	}

	public boolean pwdCheck(String id, String nowpwd) {
	    SqlSession sqlSession = sqlSessionFactory.openSession();
	    try {
	        // 데이터베이스에서 저장된 비밀번호 조회
	        String pwdCheck = sqlSession.selectOne("userSQL.pwdCheck", id);

	        // 비밀번호가 존재하고 입력된 비밀번호와 일치하는지 확인
	        if (pwdCheck != null && pwdCheck.equals(nowpwd)) {
	            return true; // 비밀번호 일치
	        } else {
	            return false; // 비밀번호 불일치 또는 존재하지 않음
	        }
	    } finally {
	        sqlSession.close();
	    }   
	}
	
	public int userWithdraw(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int result = sqlSession.delete("userSQL.userWithdraw", id);
		sqlSession.commit();
		sqlSession.close();		
		return result;
	}
}