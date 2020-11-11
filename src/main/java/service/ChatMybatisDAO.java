package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.ChatDTO;

@Service
public class ChatMybatisDAO extends AbstractMybatis {
	String namespace = "chat";
	HashMap<String, Object> map = new HashMap<String, Object>();
	
	public void insertChat(String workspace, String name, String content) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.put("workspace_name", workspace);
			map.put("name", name);
			map.put("content", content);
			String statement = namespace + ".insertChat";
			int result = sqlSession.insert(statement, map);
			sqlSession.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
	
	public List<ChatDTO> chatList(String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".chatList";
			return sqlSession.selectList(statement,workspace_name);
		} finally {
			sqlSession.close();
		}
	}
}
