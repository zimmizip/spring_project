package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.DocumentDTO;

@Service
public class DocumentMybatisDAO extends AbstractMybatis {
	String namespace = "doc";
	HashMap<String,Object> map = new HashMap<String,Object>();
	
	public int insertDoc(String workspace_name,String email,String title,String content) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.put("workspace_name", workspace_name);
			map.put("email", email);
			map.put("title", title);
			map.put("content", content);
			String statement = namespace + ".insertDoc";
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
	
	public List<DocumentDTO> docuAllList(String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		try {
			String statement = namespace + ".docuAllList";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public List<DocumentDTO> docu_finishList(String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("workspace", workspace);
		try {
			String statement = namespace + ".docu_finishList";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}
	
	public DocumentDTO docu_contentList(int num, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		DocumentDTO article = new DocumentDTO();
		try {
			article = sqlSession.selectOne(namespace + ".docu_contentList", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return article;
	}
	
	public int docuPermit(int num, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		int result = -1;
		try {
			result = sqlSession.update(namespace + ".docuPermit", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
	
	public int docuCancel(int num, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		int result = -1;
		try {
			result = sqlSession.update(namespace + ".docuCancel", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}

}
