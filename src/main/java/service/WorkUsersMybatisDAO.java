package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.WorkUsersDTO;

@Service
public class WorkUsersMybatisDAO extends AbstractMybatis {
	String namespace = "workUsers";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public List<WorkUsersDTO> workUserAllList(String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		try {
			String statement = namespace + ".workUserAllList";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public WorkUsersDTO userProfile(String email, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("email", email);
		map.put("workspace", workspace);
		WorkUsersDTO article = new WorkUsersDTO();
		try {
			article = sqlSession.selectOne(namespace + ".userProfile", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return article;
	}
	
	public int deleteUser(String email, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		map.put("email", email);
		int x = -1;
		try {
			String statement = namespace + ".deleteUser";
			x = sqlSession.delete(statement, map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return x;
	}
	
}
