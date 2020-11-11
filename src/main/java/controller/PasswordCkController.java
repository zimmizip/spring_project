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
import service.PasswordCkMybatisDAO;


@Controller
@RequestMapping("/passwordCk/")
public class PasswordCkController {
	public PasswordCkMybatisDAO passwordCkdao = new PasswordCkMybatisDAO();
	public LoginDTO logindto = new LoginDTO();
	
	public ModelAndView mv = new ModelAndView();
	public HttpSession session = null;
	
	@Autowired
	PasswordCkMybatisDAO PasswordCkPro;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse response) {
		//세션
		session = request.getSession();
	}
	
	//비밀번호찾기
	@RequestMapping("findpassword")
	public String findpassword(String name, String email, Model m)  throws Throwable { 
							
	    if (email==null)  email = "";
	    if (name==null)  name = "";
	    	
	    if(name!=""&& email!="") {			//email,password값 null이 아닐때
	    	
	    String findpass = passwordCkdao.FindPassword(email,name);			//userDAO에 있는 FindPassword 메서드 사용하여 찾은 비밀번호 값을 findpass 변수에 저장
		if (findpass==null) findpass = ""; 
	    
	    	if(findpass !="" && !findpass.equals(null)) {		//비밀번호 찾으려는 회원정보 있을때 
	    		m.addAttribute("findpass",findpass);			//찾은 비밀번호 값 저장
	    		m.addAttribute("email",email);
	    		m.addAttribute("name",name);
	    		return "passwordCk/findpassword";
	    	} else {											//비밀번호 찾으려는 회원정보 없을때 
	    		m.addAttribute("findpass",findpass);
	    		return "passwordCk/findpassword";
	    	} 
	    	}else{							//email,password값 null일때
	    	
	    		return "passwordCk/findpassword";
	    	}
	    
	}
	
	
	//찾은비밀번호 보여주기
	@RequestMapping("password")
	public String password(String name, String email, Model m)  throws Throwable { 

		if (name==null)  name = "";
   		if (email==null)  email = "";

   		if(name!=""&& email!="") {
	   String findpass = passwordCkdao.FindPassword(email,name);		//userDAO에 있는 FindPassword 메서드 사용하여 찾은 비밀번호 값을 findpassword 변수에 저장
	   
	   session.setAttribute("findpass", findpass);
   	
   		} return "passwordCk/password";
	} 
}