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
import service.LoginMybatisDAO;
import service.RegistMybatisDAO;


@Controller
@RequestMapping("/login/")
public class LoginController {
	public LoginMybatisDAO logindao = new LoginMybatisDAO();
	public RegistMybatisDAO registdao = new RegistMybatisDAO();
	public LoginDTO logindto = new LoginDTO();

	public ModelAndView mv = new ModelAndView();
	public HttpSession session = null;
	
	@Autowired
	LoginMybatisDAO LoginPro;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	
	//로그인
	@RequestMapping("login")
	public String login(String email, String password, Model m)  throws Throwable { 	
		
		if (email==null)  email = "";
	    if (password==null)  password = "";
	    
	    boolean check = false;
	    boolean logincheck = false;
	    
	    if(email!=""&& password!="") {			//email,password값 null이 아닐때
	    check = registdao.IdCheck(email);						//registdao에 있는 IdCheck 메서드 사용하여 boolean return값을 변수에 저장
	    logincheck = logindao.LoginCheck(email, password);		//userdao에 있는 LoginCheck 메서드 사용하여 boolean return값을 변수에 저장
	    int loginerror = 0; 

	    if(check == true ) {							//email,password 모두 일치할때 (정상 로그인)
	    	if(logincheck == true) {					//email 정상입력
	    		m.addAttribute("email",email);			//로그인한 email값 저장
	    		String name = logindao.GetName(email);
		    	session.setAttribute("name", name);
		    	session.setAttribute("email", email);	//session에 email값 저장
		    	return "redirect:/main/main";						
	    	}else {												//비밀번호 틀렸을때
	    		loginerror = 2;									//error 코드값 설정
		    	m.addAttribute("loginerror", loginerror);		//error 코드값 저장
		    	m.addAttribute("email", email);	
		    	return "login/login";
	    	}
	    } else {												//email 틀렸을때
	    	loginerror = 1;										//error 코드값 설정
	    	m.addAttribute("loginerror",loginerror);			//error 코드값 저장
	    	return "login/login";
	    }
	    }else {									//email,password값 null일때
	    	return "login/login";
	    }
	}
	    
}