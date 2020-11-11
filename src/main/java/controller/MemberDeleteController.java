package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import model.LoginDTO;
import service.MemberDeleteMybatisDAO;




@Controller
@RequestMapping("/memberdelete/")
public class MemberDeleteController  {
	public MemberDeleteMybatisDAO deletedao = new MemberDeleteMybatisDAO();
	public LoginDTO logindto = new LoginDTO();
	
	public ModelAndView mv = new ModelAndView();
	public HttpSession session = null;
	
	@Autowired
	MemberDeleteMybatisDAO MemberDeletePro;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	// 회원 탈퇴
	@RequestMapping("memberdelete")
	public String memberdelete(String email, String password, Model m) throws Throwable {
		

		if (password == null)
			password = "";
		int deletecode = 0;
		
		// 비밀번호 입력한경우 아래 내용 실행
		if (password != "") {

				// 비밀번호 정상적으로 입력하였을 때 DAO의 DeleteMember() 메서드를 통하여 DB에 저장
			int result = (int)deletedao.DeleteMember(email,password);

			if (result == 1) { // 회원탈퇴에 성공 하였을 경우
				deletecode = 1;
				m.addAttribute("deletecode", deletecode); // deletecode 코드값 저장
				return "login/login";
			} else {		//회원탈퇴 실패(비밀번호 틀렸을때)
				deletecode = 2;
				m.addAttribute("deletecode", deletecode); // deletecode 코드값 저장
				return "memberdelete/memberdelete";
			}
		}else {
			return "memberdelete/memberdelete";
	}
	}
}	
	