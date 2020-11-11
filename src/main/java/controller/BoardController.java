package controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import model.BoardDTO;
import model.CommentDTO;
import service.BoardMybatisDAO;

@Controller
@RequestMapping("/board/")
public class BoardController {

	public String pageNum = "";
	public String category = "";
	public String sentence = "";
	public String workspace_name = "";
	HttpSession session = null;

	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		session = request.getSession();

		if (request.getParameter("pageNum") != null) {
			session.setAttribute("pageNum", request.getParameter("pageNum"));
		}

		if (request.getParameter("category") != null) {
			session.setAttribute("category", request.getParameter("category"));
			session.setAttribute("sentence", request.getParameter("sentence"));
			session.setAttribute("pageNum", "1");
		}
		workspace_name = (String) session.getAttribute("workspace_name");
		category = (String) session.getAttribute("category");
		sentence = (String) session.getAttribute("sentence");
		pageNum = (String) session.getAttribute("pageNum");
		if (pageNum == null)
			pageNum = "1";
	}

	@RequestMapping("list")
	public String list(String category, String sentence, Model m) throws Exception {
		int pageSize = 10;

		if (category != null) {
			session.setAttribute("category", category);
			session.setAttribute("sentence", sentence);
		}

		String workspace_name = (String) session.getAttribute("workspace_name");

		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List<?> articleList = null;
		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		count = dbPro.getArticleCount(category, sentence, workspace_name);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, category, sentence, workspace_name);
		}
		number = count - (currentPage - 1) * pageSize;

		int bottomLine = 3;
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;

		if (count > 0) {
			pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
			endPage = startPage + bottomLine - 1;

			if (endPage > pageCount)
				endPage = pageCount;
		}
		m.addAttribute("currentPage", currentPage);
		m.addAttribute("startRow", startRow);
		m.addAttribute("endRow", endRow);
		m.addAttribute("count", count);
		m.addAttribute("number", number);
		m.addAttribute("articleList", articleList);
		m.addAttribute("pageSize", pageSize);
		m.addAttribute("bottomLine", bottomLine);
		m.addAttribute("pageCount", pageCount);
		m.addAttribute("startPage", startPage);
		m.addAttribute("endPage", endPage);

		return "board/list";
	}

	@RequestMapping("content")
	public String content(@RequestParam("num") int num, Model m) throws Exception {

		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		String workspace_name = (String) session.getAttribute("workspace_name");
		BoardDTO article = dbPro.getArticle(num, true, workspace_name);
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();

		List<CommentDTO> commentList = dbPro.selectCommentList(num, workspace_name);
		
		m.addAttribute("article", article);
		m.addAttribute("ref", ref);
		m.addAttribute("re_step", re_step);
		m.addAttribute("re_level", re_level);
		m.addAttribute("commentList", commentList);

		return "board/content";

	}

	@RequestMapping("writeUploadForm")
	public String writeUploadForm(BoardDTO article, Model m) throws Exception {

		m.addAttribute("num", article.getNum());
		m.addAttribute("ref", article.getRef());
		m.addAttribute("re_step", article.getRe_step());
		m.addAttribute("re_level", article.getRe_level());

		return "board/writeUploadForm";
	}

	@RequestMapping("writeUploadPro")
	public String writeUploadPro(MultipartHttpServletRequest multipart, BoardDTO article) throws Exception {

		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();

		if (filename != null && !filename.equals("")) {
			@SuppressWarnings("deprecation")
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int) multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}
		article.setWriter((String) session.getAttribute("name"));
		article.setWorkspace_name(workspace_name);
		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		dbPro.insertArticle(article);

		return "redirect:list";
	}

	@RequestMapping("updateForm")
	public String updateForm(@RequestParam("num") int num, Model m) throws Exception {

		String workspace_name = (String) session.getAttribute("workspace_name");

		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		BoardDTO article = dbPro.getArticle(num, false, workspace_name);

		m.addAttribute("article", article);

		return "board/updateForm";
	}

	@RequestMapping("updatePro")
	public ModelAndView updatePro(MultipartHttpServletRequest multipart, BoardDTO article) throws Exception {

		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();

		if (filename != null && !filename.equals("")) {
			@SuppressWarnings("deprecation")
			String uploadPath = multipart.getRealPath("/") + "/uploadFile";
			FileCopyUtils.copy(multi.getInputStream(),
					new FileOutputStream(uploadPath + "/" + multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int) multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}
		article.setWriter((String) session.getAttribute("name"));
		article.setWorkspace_name(workspace_name);
		ModelAndView mv = new ModelAndView();
		
		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		int check = dbPro.updateArticle(article);
		mv.addObject("check", check);
		mv.setViewName("board/updatePro");
		return mv;
	}

	@RequestMapping("deleteForm")
	public String deleteForm(@RequestParam("num") int num, Model m) throws Exception {

		m.addAttribute("num", num);

		return "board/deleteForm";
	}

	@RequestMapping("deletePro")
	public String deletePro(int num, String passwd, Model m) throws Exception {

		int check = -1;

		String workspace_name = (String) session.getAttribute("workspace_name");

		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		check = dbPro.deleteArticle(num, workspace_name);
		m.addAttribute("check", check);

		return "board/deletePro";
	}

	@RequestMapping("writeComment")
	public String writeComment(int comment_board, String comment_content, Model m) throws Exception {

		String comment_id = (String) session.getAttribute("email");

		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setWorkspace_name((String) session.getAttribute("workspace_name"));
		commentDTO.setComment_board(comment_board);
		commentDTO.setComment_content(comment_content);
		commentDTO.setComment_id(comment_id);
		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		dbPro.insertComment(commentDTO);
		return "redirect:content?num=" + comment_board;
	}

	@RequestMapping("deleteComment")
	public String deleteComment(int comment_board, int comment_num, Model m) throws Exception {

		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setWorkspace_name((String) session.getAttribute("workspace_name"));
		commentDTO.setComment_board(comment_board);
		commentDTO.setComment_num(comment_num);

		BoardMybatisDAO dbPro = new BoardMybatisDAO();
		dbPro.deleteComment(commentDTO);
		return "redirect:content?num=" + comment_board;

	}
}
