package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class LoginMybatisDAO extends AbstractMybatis {

	String namespace = "login";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public boolean LoginCheck(String email, String password) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = 0;
		boolean result = false;
		map.clear();

		try {
			String statement = namespace + ".LoginCheck";
			map.put("email", email);
			map.put("password", password);
			x = sqlSession.selectOne(statement, map);

			if (x == 1) {
				result = true;
			}
		} finally {
			sqlSession.close();
		}
		return result;
	}

	public String GetName(String email) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String name = "";

		try {
			String statement = namespace + ".GetName";
			name = (String) sqlSession.selectOne(statement, email);
			
			return name;
		} finally {
			sqlSession.close();
		}
	}
}
