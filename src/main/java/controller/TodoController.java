package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.TodoMybatisDao;

@Controller
@RequestMapping("/todo/")
public class TodoController {
	public HttpSession session = null;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
		
	}
	
	@RequestMapping("todo")
	public String todo() throws Exception{
		return "todo/todo_make";
	}
	
	@RequestMapping("todo_make")
	public String todo_make(String content,Model m) throws Exception {
		
		TodoMybatisDao tmdao = new TodoMybatisDao();
		boolean ok = tmdao.todo_make(content,(String)session.getAttribute("email"));
		
		if(ok == true) {
			m.addAttribute("message","추가 되었습니다");
		}else {
			m.addAttribute("message","DB 오류");
		}
		
		return "todo/todo";
	}
	
	@RequestMapping("todo_del")
	public String todo_del(int num,Model m) throws Exception {
		
		TodoMybatisDao tmdao = new TodoMybatisDao();
		boolean ok = tmdao.todo_del(num,(String)session.getAttribute("email"));
		
		if(ok == true) {
			m.addAttribute("Message","삭제 되었습니다");
		}else {
			m.addAttribute("Message","DB 오류");
		}
		
		return "todo/mainout";
	}
}
