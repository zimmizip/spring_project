package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class MemberModifyMybatisDAO extends AbstractMybatis {

	String namespace = "membermodify";
	HashMap<String, Object> map = new HashMap<String, Object>();

	// 회원 정보 수정
	public int ModifyMember (String email, String name_modify, String password_modify) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = 0;
		map.clear();
		try {
			String statement = namespace + ".ModifyMember";
			map.put("email", email);
			map.put("name_modify", name_modify);
			map.put("password_modify", password_modify);
			x = (int)sqlSession.insert(statement, map);
			sqlSession.commit();
	}finally {
		sqlSession.close();
	}
	return x;
	}
	
 
}