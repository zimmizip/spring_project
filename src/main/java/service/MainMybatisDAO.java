package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.MainDTO;

@Service
public class MainMybatisDAO extends AbstractMybatis {
	String namespace = "main";
	HashMap<String,Object> map = new HashMap<String,Object>();
	
	public List<MainDTO> selectWorkspace(String email) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".selectWorkspace";
			return sqlSession.selectList(statement, email); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return null;
	}
	
	public String selectCode(String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		System.out.println(workspace);
		String code = "";
		try {
			code = sqlSession.selectOne(namespace + ".selectCode", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return code;
	}
	
	public boolean CheckManager(String email,String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		map.put("email",email);
		try {
			String temp = sqlSession.selectOne(namespace + ".CheckManager", map);
			if(temp.equals("관리자 멤버")) {
				return true;
			}else {
				return false;
			}
		} finally {
			sqlSession.close();
		}
	}
	public boolean workspace_out(String workspace_name, String email) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace_name", workspace_name);
		map.put("email",email);
		try {
			int temp = sqlSession.delete(namespace + ".workspace_out", map);
			sqlSession.commit();
			if(temp == 1) {
				return true;
			}
		} finally {
			
			sqlSession.close();
		}
		return false;
	}
}
