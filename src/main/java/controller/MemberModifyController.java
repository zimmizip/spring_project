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

import service.MemberModifyMybatisDAO;
import service.PasswordCkMybatisDAO;


@Controller
@RequestMapping("/membermodify/")
public class MemberModifyController  {
	public MemberModifyMybatisDAO modifydao = new MemberModifyMybatisDAO();
	public PasswordCkMybatisDAO passwordCkdao = new PasswordCkMybatisDAO();
	
	public ModelAndView mv = new ModelAndView();
	public HttpSession session = null;
	
	@Autowired
	MemberModifyMybatisDAO MemberModifyPro;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	// 회원정보 수정
	@RequestMapping("membermodify")
	public String membermodify(String email, String name, String name_modify, String password, 
			String password_modify, String repassword_modify, Model m) throws Throwable {

	
		if (email == null)
			email = "";
		if (name == null)
			name = "";	
		if (name_modify == null)
			name_modify = "";		
		if (password == null)
			password = "";
		if (password_modify == null)
			password_modify = "";		
		if (repassword_modify == null)
			repassword_modify = "";	

		// email,name,password 값이 null이 아닌 경우 아래 내용 실행
		if (name != "" && password != ""  ) {
			

			// 모든 페이지를 입력하지 않았을 경우 return
			if (password == null || password.equals("")) {
				session.setAttribute("ErrorMessage", "수정하시려면 현재 비밀번호를 입력해주세요.");
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				m.addAttribute("name_modify", name_modify);
				return "membermodify/membermodify";
			}

			// 이름을 올바르게 입력하지 않았을 경우 (특수문자 기입시 return)
			String reg_name = "[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*";
			if (!name.matches(reg_name)) {
				session.setAttribute("ErrorMessage", "이름이 올바르지 않습니다.");
				return "membermodify/membermodify";
			} else if (name.length() <= 1 || name.length() > 6) {
				session.setAttribute("ErrorMessage", "이름을 확인해주세요.");
				return "membermodify/membermodify";
			}


			// 비밀번호가 서로 일치하지 않을 경우 return
			if (!password_modify.equals(repassword_modify)) {
				session.setAttribute("ErrorMessage", "비밀번호가 일치하지 않습니다.");
				m.addAttribute("name_modify", name_modify);
				return "membermodify/membermodify";
			}

			// 회원정보가 모두 정상적으로 입력하였을 때 DAO의 register() 메서드를 통하여 DB에 저장
			String passwordck = "";
			passwordck = passwordCkdao.FindPassword(email, name);
			
			if (password_modify == "")
				password_modify = password;		//변경할 비밀번호 비어있으면 password_modify값을 password에 저장
			if (name_modify == "")
				name_modify = name;
			int result = 0;
			int modifycode = 0;
			if(password.equals(passwordck)) {
			result = modifydao.ModifyMember(email, name_modify, password_modify);
			}

			if (result == 1) { // 회원가입에 성공 하였을 경우
		         
	            if(password_modify !="") {
	               password_modify = "";
	            }
	            modifycode = 1;
	            m.addAttribute("modifycode", modifycode);

	            if(!(name_modify.equals("")) || !(name_modify.equals(null))) {
	               session.setAttribute("name", name_modify);
	            }else {
	               session.setAttribute("name", (String)session.getAttribute("name"));
	            }
	               session.setAttribute("email", email);
	            
	            return "redirect:/main/main";

	          

			} else { // 회원가입에 실패 하였을 경우

				session.setAttribute("ErrorMessage", "비밀번호가 틀렸습니다.");
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				m.addAttribute("name_modify", name_modify);
				password = "";
				return "membermodify/membermodify";
			}
		} else { // 비밀번호 입력안했을때

			if(name_modify !="" || password_modify !="") {
				session.setAttribute("ErrorMessage", "비밀번호를 입력해주세요.");
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				m.addAttribute("name_modify", name_modify);
				password = "";
			return "membermodify/membermodify";
			}
		return "membermodify/membermodify";
	}
	
	
	}
	
}