package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.NoticeDTO;

@Service
public class NoticeMybatisDAO extends AbstractMybatis {
	String namespace = "noti";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public void insertNotice(NoticeDTO article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.insert(namespace + ".insertNotice", article);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public List<NoticeDTO> noticeAllList(String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".noticeAllList";
			return sqlSession.selectList(statement,workspace_name);
		} finally {
			sqlSession.close();
		}
	}
	
	public NoticeDTO noticeContent(int num, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		NoticeDTO article = new NoticeDTO();
		try {
			article = sqlSession.selectOne(namespace + ".noticeContent", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return article;
	}
	
	public int notiDelete(int num, String workspace) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		int result = -1;
		try {
			result = sqlSession.delete(namespace + ".notiDelete", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
	
	public int notiUpdate(int num, String workspace, String title, String content) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace", workspace);
		map.put("title", title);
		map.put("content", content);
		int result = -1;
		try {
			result = sqlSession.update(namespace + ".notiUpdate", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return result;
	}
}
