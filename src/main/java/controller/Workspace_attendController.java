package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.WorkspaceAttendMybatisDAO;

@Controller
@RequestMapping("/workspace_attend/")
public class Workspace_attendController{
	public HttpSession session = null;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	@RequestMapping("Workspace_attend")
	public String Workspace_attend(String code,Model m) throws Exception {

		String email = (String) session.getAttribute("email"); 
		String name = (String) session.getAttribute("name"); ;
		
		WorkspaceAttendMybatisDAO damdao = new WorkspaceAttendMybatisDAO();
	
		int result = damdao.insertUsers(code,email,name);
		
		if (result == -1) {
			m.addAttribute("Message", "DB오류");
		}
		else if(result == 2) {
			m.addAttribute("Message", "잘못된 초대코드를 입력하셨습니다.");
		}
		else if(result == 1) {
			m.addAttribute("Message", "워크스페이스 참가완료");
		}

		return "workspace_attend/attend";
	}
	
	@RequestMapping("attend_workspace")
	public String attend_workspace() throws Throwable {
		return "workspace_attend/attend_workspace";
	}
}
