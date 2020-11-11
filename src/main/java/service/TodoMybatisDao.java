package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.TodoDTO;

@Service
public class TodoMybatisDao extends AbstractMybatis {
	String namespace = "todo";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public List<TodoDTO> selectTodo(String email){
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = namespace + ".selectTodo";
			return sqlSession.selectList(statement, email);
		} finally {
			sqlSession.close();
		}
	}
	
	public boolean todo_make(String content, String email) {
		System.out.println("content" + content);
		System.out.println("email" + email);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.put("email", email);
		map.put("content", content);
		try {
			String statement = namespace + ".sel_num";
			Object temp = sqlSession.selectOne(statement, email);
			if(temp != null) {
				map.put("num",((int)temp)+1);
			}else {
				map.put("num", 1);
			}
			statement = namespace + ".todo_make";
			int ok = sqlSession.insert(statement, map);
			sqlSession.commit();
			if (ok == 1) {
				return true;
			}
		} finally {
			sqlSession.close();
		}
		return false;
	}
	
	public boolean todo_del(int num, String email) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.put("email", email);
		map.put("num", num);
		try {
			String statement = namespace + ".todo_del";
			int ok = sqlSession.delete(statement, map);
			sqlSession.commit();
			if (ok == 1) {
				return true;
			}
		} finally {
			sqlSession.close();
		}
		return false;
	}
}
