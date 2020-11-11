package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class MemberDeleteMybatisDAO extends AbstractMybatis {

	String namespace = "memberdelete";
	HashMap<String, Object> map = new HashMap<String, Object>();

	// 회원 탈퇴
	public int DeleteMember (String email, String password) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = 0;
		map.clear();
		try {
			String statement = namespace + ".DeleteMember";
			map.put("email", email);
			map.put("password", password);

			x = (int)sqlSession.delete(statement, map);
			sqlSession.commit();
	}finally {
		sqlSession.close();
	}
	return x;
	}
	  

}