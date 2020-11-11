package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.DocumentMybatisDAO;

@Controller
@RequestMapping("/document/")
public class DocumentController{
	public HttpSession session = null;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	@RequestMapping("document_approval")
	public String document_approval(String title,String content,Model m) throws Exception {

		String email = (String) session.getAttribute("email");
		String workspace_name = (String) session.getAttribute("workspace_name");

		DocumentMybatisDAO dmdao = new DocumentMybatisDAO();
		int result = dmdao.insertDoc(workspace_name, email, title, content);

		if (result == -1) {
			m.addAttribute("Message", "DB오류");
		} else {
			m.addAttribute("Message", "제출 완료");
		}

		return "document/doc";
	}

	@RequestMapping("document_approval_")
	public String document_approval_() throws Throwable {
		return "document/document_approval";
	}
}
