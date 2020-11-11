package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class WorkspaceAttendMybatisDAO extends AbstractMybatis {
	String namespace = "attend";
	HashMap<String,Object> map = new HashMap<String,Object>();
	
	public int insertUsers(String code, String email, String name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".CheckCode";
			String workspace_name = sqlSession.selectOne(statement, code); 
			if(workspace_name == null) {
				return 2;
			}else {
				map.put("workspace_name",workspace_name);
				map.put("email", email);
				map.put("name", name);
				statement = namespace + ".insertUsers";
				int temp = sqlSession.insert(statement, map);
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

}
