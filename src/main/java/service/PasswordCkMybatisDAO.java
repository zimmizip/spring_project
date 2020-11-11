package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class PasswordCkMybatisDAO extends AbstractMybatis {

	String namespace = "passwordCk";
	HashMap<String, Object> map = new HashMap<String, Object>();

	// 비밀번호 찾기
	public String FindPassword(String email, String name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String result = "";
		map.clear();
		try {
			String statement = namespace + ".FindPassword";
			map.put("email", email);
			map.put("name", name);
			result = sqlSession.selectOne(statement, map);

		} finally {
			sqlSession.close();
		}
		return result;
	}

}
