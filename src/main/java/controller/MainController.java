package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.MainDTO;
import model.NoticeDTO;
import model.TodoDTO;
import service.ChatMybatisDAO;
import service.MainMybatisDAO;
import service.NoticeMybatisDAO;
import service.TodoMybatisDao;

@Controller
@RequestMapping("/main/")
public class MainController {
	private String workspace;
	public HttpSession session = null;
	
	@Autowired
	NoticeMybatisDAO nmDAO;
	
	@Autowired
	ChatMybatisDAO chatDAO;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
		if(session.getAttribute("workspace_name") != null) {
			session.setAttribute("workspace", session.getAttribute("workspace_name"));
		}
		workspace = (String)session.getAttribute("workspace");
	}
	
	@RequestMapping("main")
	public String main(Model m) throws Exception {
		String email = (String) session.getAttribute("email");
		MainMybatisDAO mmdao = new MainMybatisDAO();
		TodoMybatisDao tmdao = new TodoMybatisDao(); 
		List<MainDTO> workspaceList = mmdao.selectWorkspace(email);
		List<TodoDTO> todoList = tmdao.selectTodo(email);
		m.addAttribute("workspaceList", workspaceList);
		m.addAttribute("todoList",todoList);

		return "main/main";
	}

	@RequestMapping("workspace_main")
	public String workspace_main(@RequestParam("workspace_name") String workspace_name, Model m) throws Throwable {

		if (session.getAttribute("workspace_name") == null) {
			session.setAttribute("workspace_name", workspace_name);
		}
		
		MainMybatisDAO mmdao = new MainMybatisDAO();
		String code = mmdao.selectCode(workspace_name);

		session.setAttribute("Wcode", code);
		
		List<?> noticeList = null;
		noticeList = nmDAO.noticeAllList(workspace_name);
		
		List<?> chatList = null;
		chatList = chatDAO.chatList(workspace_name);
		
		boolean manager = mmdao.CheckManager((String)session.getAttribute("email"), workspace_name);

		if(manager) {
			m.addAttribute("manager", 1);
		}else {
			m.addAttribute("manager", 0);
		}
		
		m.addAttribute("chatList", chatList);
		m.addAttribute("noticeList", noticeList);
		return "main/workspace_main";
	}


	@RequestMapping("noticeContent")
	public String noticeContent(@RequestParam("num") int num, Model m)  throws Throwable { 
		NoticeDTO noti = nmDAO.noticeContent(num, workspace);
		m.addAttribute("noti", noti);
		return  "admin/mainNotiContent";
	}
	
	@RequestMapping("workspace_out")
	public String workspace_out(Model m) throws Throwable {
		
		MainMybatisDAO mmdao = new MainMybatisDAO();
		mmdao.workspace_out((String)session.getAttribute("workspace_name"),(String)session.getAttribute("email"));
		
		m.addAttribute("Message","탈퇴 완료");
		
		return "main/mainout";
	}
}
