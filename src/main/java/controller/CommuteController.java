package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import service.CommuteMybatisDAO;

@Controller
@RequestMapping("/commute/")
public class CommuteController{
	public HttpSession session = null;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	@RequestMapping("comm")
	public String comm(String type,Model m) throws Exception {
		
		String email = (String) session.getAttribute("email");
		String workspace_name = (String) session.getAttribute("workspace_name");
		
		CommuteMybatisDAO cmb = new CommuteMybatisDAO();
		if (type.equals("gtw")) {
			int result = cmb.insertGTW(email, workspace_name);

			if (result == -1) {
				m.addAttribute("Message", "DB오류");
			} else if (result == 0) {
				m.addAttribute("Message", "이미 출근하셨습니다.");
			} else {
				m.addAttribute("Message", "출근 확인되셨습니다.");
			}
		} else {
			int result = cmb.updateOW(email,workspace_name);
			if (result == -1) {
				m.addAttribute("Message", "DB오류");
			} else if (result == 0) {
				m.addAttribute("Message", "아직 출근을 하지 않으셧습니다.");
			} else {
				m.addAttribute("Message", "퇴근 확인되셨습니다.");
			}
		}

		return "commute/com";
	}

	@RequestMapping("commute")
	public String commute() throws Throwable {
		return "commute/commute";
	}
}
