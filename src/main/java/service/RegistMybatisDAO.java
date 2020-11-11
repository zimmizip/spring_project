package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@Service
public class RegistMybatisDAO extends AbstractMybatis {
		
		String namespace = "regist";
		HashMap<String, Object> map = new HashMap<String, Object>();
	   
		public int Join (String email, String name, String password) {
			SqlSession sqlSession = getSqlSessionFactory().openSession();
			int x = 0;
			map.clear();
			try {
				String statement = namespace + ".Join";
				map.put("email", email);
				map.put("name", name);
				map.put("password", password);
				x = (int)sqlSession.insert(statement, map);
				sqlSession.commit();
		}finally {
			sqlSession.close();
		}
		return x;
		}
		
	   
	   
	  //이메일 체크
	  public boolean IdCheck (String email){ 
		 SqlSession sqlSession = getSqlSessionFactory().openSession();
		 int x = 0;
		 boolean result = false;

		 try { 
			 String statement = namespace + ".IdCheck";
			 x = sqlSession.selectOne(statement, email);
			 if(x == 1) {
				 result = true;
			 }
		  }finally{ 
			  sqlSession.close();
		  } 
		 return result; 	
		  }
	 
}
