package controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.WorkspaceMakeMybatisDAO;

@Controller
@RequestMapping("/workspace_make/")
public class Workspace_makeController{
	public HttpSession session = null;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	@RequestMapping("Workspace_make")
	public String Workspace_make(String workspace_name,Model m) throws Exception {
		Random ran = new Random();

		String email = (String) session.getAttribute("email");
		String name = (String) session.getAttribute("name");

		WorkspaceMakeMybatisDAO dmdao = new WorkspaceMakeMybatisDAO();
		String code = "";
		boolean ok = true;
		int temp = -2;

		while (ok) {
			for (int i = 0; i < 4; i++) {
				code += ran.nextInt(10) + "";
			}
			temp = dmdao.CheckCode(code);
			if (temp == 1) {
				ok = false;
			} else if (temp == 0) {
				continue;
			} else {
				ok = false;
				m.addAttribute("Message", "DB오류");
				return "/view/workspace_make/work.jsp";
			}
		}

		int result = dmdao.insertWork(workspace_name, email, code, name);
		if (result == -1) {
			m.addAttribute("Message", "DB오류");
			m.addAttribute("code", "관리자에게 문의하시오.");
		} else {
			m.addAttribute("Message", "워크스페이스 생성완료");
			m.addAttribute("code", "초대코드는 " + code + " 입니다.");
		}

		return "workspace_make/work";
	}

	@RequestMapping("Workspace_name")
	public String Workspace_name(String workspace_name,Model m) throws Exception {

		WorkspaceMakeMybatisDAO dmmdao = new WorkspaceMakeMybatisDAO();

		int result = dmmdao.CheckName(workspace_name);

		if (result == -1) {
			m.addAttribute("Message", "DB오류");
		} else if (result == 1) {
			m.addAttribute("Message", "사용가능");
		} else if (result == 0) {
			m.addAttribute("Message", "사용불가");
		}

		return "workspace_make/work";
	}

	@RequestMapping("make_workspace")
	public String make_workspace() throws Throwable {
		return "workspace_make/make_workspace";
	}

	
}
