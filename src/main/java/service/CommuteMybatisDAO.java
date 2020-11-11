package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.CommuteDTO;

@Service
public class CommuteMybatisDAO extends AbstractMybatis {
	String namespace = "comm";
	HashMap<String,Object> map = new HashMap<String,Object>();
	
	public int insertGTW(String email,String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.put("email", email);
			map.put("workspace_name", workspace_name);
			String statement = namespace + ".selectCOM";
			int temp = sqlSession.selectOne(statement, map);
			if (temp == 0) {
				statement = namespace + ".insertGTW";
				temp = sqlSession.insert(statement, map); 
				sqlSession.commit();
				return temp;
			} else {
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return -1;

	}

	public int updateOW(String email,String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("email", email);
			map.put("workspace_name", workspace_name);
			String statement = namespace + ".selectCOM";
			int temp = sqlSession.selectOne(statement, map);
			if (temp == 0) {
				return 0;
			} else {
				statement = namespace + ".updateOW";
				temp = sqlSession.update(statement, map);
				sqlSession.commit();
				return temp;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return -1;

	}
	
	public List<CommuteDTO> commAllList(String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		try {
			String statement = namespace + ".commAllList";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}

}
