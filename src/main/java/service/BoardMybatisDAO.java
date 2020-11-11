package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import model.BoardDTO;
import model.CommentDTO;

@Service
public class BoardMybatisDAO extends AbstractMybatis {
	String namespace = "Board";
	HashMap<String, Object> map = new HashMap<String, Object>();

	public List<BoardDTO> boardAllList(String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			return sqlSession.selectList(namespace + ".boardAllList", workspace_name);
		} finally {
			sqlSession.close();
		}
	}

	public int getArticleCount( String category, String sentence, String workspace_name) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("category", category);
			map.put("sentence", sentence);
			map.put("workspace_name", workspace_name);
			return sqlSession.selectOne(namespace + ".getArticleCount", map);
		} finally {
			sqlSession.close();
		}}

	public List<BoardDTO> getArticles(int start, int end,  String category, String sentence, String workspace_name)
			throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			map.clear();
			map.put("workspace_name", workspace_name);
			map.put("start", start);
			map.put("end", end);
			map.put("category", category);
			map.put("sentence", sentence);
			return sqlSession.selectList(namespace + ".getArticles", map);
		} finally {
			sqlSession.close();
		}
	}

	public BoardDTO getArticle(int num,  boolean readcount,String workspace_name) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace_name", workspace_name);
		BoardDTO article = new BoardDTO();
		try {
			if (readcount)
			sqlSession.update(namespace + ".addReadCount", map);
			article = (BoardDTO) sqlSession.selectOne(namespace + ".getArticle", map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public int addReadCount(int num,  String category, String sentence) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.clear();
			map.put("num", num);
			return sqlSession.selectOne(namespace + ".addReadCount", map);
		} finally {
			sqlSession.close();
		}
	}

	public void insertArticle(BoardDTO article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		String workspace_name = article.getWorkspace_name();
		try {
			map.clear();
			int number = sqlSession.selectOne(namespace + ".insertArticle_new",workspace_name);
			if (number != 0)
				number = number + 1;
			else
				number = 1;
			if (num != 0) {
				map.put("ref", ref);
				map.put("re_step", re_step);
				map.put("workspace_name", workspace_name);
				sqlSession.update(namespace + ".insertArticle_update", map);
				sqlSession.commit();
				re_step = re_step + 1;
				re_level = re_level + 1;
			} else {
				ref = number;
				re_step = 0;
				re_level = 0;
			}
			article.setNum(number);
			article.setRef(ref);
			article.setRe_step(re_step);
			article.setRe_level(re_level);
			sqlSession.insert(namespace + ".insertArticle_insert", article);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int updateArticle(BoardDTO article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		int x = -1;
		try {
			
			x = sqlSession.update(namespace + ".update_update", article);
			
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return x;
	}

	public int deleteArticle(int num,String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace_name",workspace_name);
		int x = -1;
		try {
			sqlSession.selectOne(namespace + ".delete_passwd", map);
			x = sqlSession.delete(namespace + ".delete_delete", map); //�??��?��?��?? 받는곳�? board?��?��?��
		
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
		return x;
	}

	public int insertComment(CommentDTO commentDTO) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int number = sqlSession.selectOne(namespace + ".selectComment_num", commentDTO.getWorkspace_name());
		if (number != 0)
			number = number + 1;
		else
			number = 1;
		commentDTO.setComment_num(number);
		int result = sqlSession.insert(namespace + ".insert_comment", commentDTO);
		sqlSession.commit();
		sqlSession.close();
		return result;
		
	}

	public List<CommentDTO> selectCommentList(int num,String workspace_name) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		map.clear();
		map.put("num", num);
		map.put("workspace_name", workspace_name);
		List<CommentDTO> commentList = sqlSession.selectList(namespace + ".select_commentList",map);
		return commentList;
	}
	public int deleteComment(CommentDTO commentDTO) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int result = sqlSession.delete(namespace + ".delete_comment", commentDTO);
		sqlSession.commit();
		sqlSession.close();
		return result;
		
	}
}