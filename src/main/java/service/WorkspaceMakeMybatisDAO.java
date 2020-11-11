package service;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class WorkspaceMakeMybatisDAO extends AbstractMybatis {
	String namespace = "work";
	HashMap<String,Object> map = new HashMap<String,Object>();
	
	public int CheckName(String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			
			String statement = namespace + ".CheckName";
			int temp = sqlSession.selectOne(statement,workspace_name);
			
			if(temp == 0) {
				return 1; 
			}else {
				return 0; 
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return -1;

	}
	
	public int CheckCode(String code) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			
			String statement = namespace + ".CheckCode";
			int temp = sqlSession.selectOne(statement,code);
			
			if(temp == 0) {
				return 1; //중복?�� ?��?���? 1
			}else {
				return 0; //중복?�� ?��?���? 0
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return -1;

	}
	
	public int insertWork(String workspace_name, String email, String code, String name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.put("workspace_name",workspace_name);
			map.put("email",email);
			map.put("code",code);
			//Maker?��?���? insert
			String statement = namespace + ".insertWork";
			sqlSession.insert(statement, map);
			sqlSession.commit();
			//Users?��?���? ?���?
			map.put("name", name);
			statement = namespace + ".insertUsers";
			int temp = sqlSession.insert(statement, map);
			sqlSession.commit();
			
			return temp;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return -1;
	}
	
	public Map<String, String> deleteWorkspace(String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace_name", workspace_name);
		return sqlSession.selectOne(namespace + ".deleteWorkspace", map);
	}
	
	public int deleteWorkspacePro(String email, String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace_name", workspace_name);
		map.put("email", email);
		int x = -1;
		try {
			String statement = namespace + ".deleteWorkspacePro";
			x = sqlSession.delete(statement, map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return x;
	}
	

}
