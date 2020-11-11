package controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
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
import service.MyAuthentication;
import service.PasswordCkMybatisDAO;
import service.RegistMybatisDAO;

@Controller
@RequestMapping("/regist/")
public class RegistController {
	public RegistMybatisDAO registdao = new RegistMybatisDAO();
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
	@RequestMapping("join")
	public String join(LoginDTO user, String repassword, Model m) throws Throwable {

		String email = user.getEmail();
		String name = user.getName();
		String password = user.getPassword();
		
		if (email == null)			email = "";
		if (name == null)			name = "";
		if (password == null)		password = "";
		if (repassword == null) 	repassword = "";

		if (email != "" || name != "" || password != "" || repassword != "") {		// 값이 하나라도 있는경우 아래 내용 실행

			// 모든 페이지를 입력하지 않았을 경우 return
			if (name == null || name.equals("") || email == null || email.equals("") || password == null
					|| password.equals("") || repassword == null || repassword.equals("")) {
				session.setAttribute("ErrorMessage", "입력하지 않은 항목이 있습니다.");
				session.setAttribute("name", name);
				session.setAttribute("email", email);
				return "regist/register";
			}

			// 이름을 올바르게 입력하지 않았을 경우 (특수문자 기입시 return)
			String reg_name = "[0-9|a-z|A-Z|ㄱ-ㅎ|ㅏ-ㅣ|가-힝]*";
			if (!name.matches(reg_name)) {
				session.setAttribute("ErrorMessage", "이름이 올바르지 않습니다.");
				return "regist/register";
			} else if (name.length() <= 1 || name.length() > 6) {
				session.setAttribute("ErrorMessage", "이름을 확인해주세요.");
				return "regist/register";
			}

			// 이메일을 올바르게 입력하지 않았을 경우 메세지 출력 형식 확인 (@ 와 . 이 없으면 return)
			String reg_email = "([0-9a-zA-Z_\\.-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}$/*";
			if (!email.matches(reg_email)) {
				session.setAttribute("ErrorMessage", "이메일 형식이 맞지 않습니다.");
				return "regist/register";
			}

			// 비밀번호가 서로 일치하지 않을 경우 return
			if (!password.equals(repassword)) {
				session.setAttribute("ErrorMessage", "비밀번호가 일치하지 않습니다.");
				return "regist/register";
			}

			// 회원정보가 모두 정상적으로 입력하였을 때 DAO의 register() 메서드를 통하여 DB에 저장
			int result = registdao.Join(email, name, password);
			int joincode = 1;
			boolean emailcheck = false;
			emailcheck = registdao.IdCheck(email);		////DAO에 있는 IdCheck 메서드 사용하여 아이디 중복 여부 저장

			if (result == 1) {							// 회원가입에 성공 하였을 경우
				joincode = 1; 							// joincode 코드값 설정
				m.addAttribute("joincode", joincode); 	// joincode 코드값 저장
				session.setAttribute("Message", "회원가입이 되셨습니다.");
				session.setAttribute("name", "");
				session.setAttribute("email", "");
				return "login/login";

			} else { 									// 회원가입에 실패 하였을 경우

				if (emailcheck) {						//이미 존재하는 아이디일때
					session.setAttribute("ErrorMessage", "이미 존재하는 이메일 입니다.");
					session.setAttribute("email", "");
					return "regist/register";
				} else {
					session.setAttribute("ErrorMessage", "오류가 발생하였습니다. 잠시후 다시 시도해주세요.");
					session.setAttribute("name", "");
					session.setAttribute("email", "");
					return "regist/register";
				}
			}
		}
		return "regist/register";
	}
	
	
	//이메일 인증 메일 전송
	@RequestMapping("emailRegisterCheckServlet")
	public String emailRegisterCheckServlet(String email, Model m) throws Throwable {
		 @SuppressWarnings("unused")
		String smtpHost = "smtp.gmail.com";
	      
	             
	       //보내는 사람의 정보
	       String fromName = "com워크";
	       String fromEmail = "ssywork4@gmail.com"; 			// ex) wow@gmail.com
	       
	       try {
	         Properties props = new Properties();
	         props.put("mail.smtp.user", fromEmail);
	         props.put("mail.smtp.host", "smtp.googlemail.com");
	         props.put("mail.smtp.port", "465");
	         props.put("mail.smtp.starttls.enable", "true");
	         props.put("mail.smtp.auth", "true");
	         props.put("mail.smtp.debug", "true");
	         props.put("mail.smtp.socketFactory.port", "465");
	         props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	         props.put("mail.smtp.socketFactory.fallback", "false");
	         
	           // 메일 인증
	           Authenticator myauth=new MyAuthentication(); 
	           Session sess=Session.getInstance(props, myauth);
	         
	         
	           InternetAddress addr = new InternetAddress();
	           addr.setPersonal(fromName,"UTF-8");
	           addr.setAddress(fromEmail);
	           
	           StringBuffer buffer = new StringBuffer();
	           for(int i=0; i<6; i++) {
	              int n = (int)(Math.random() * 10);
	              buffer.append(n);
	           }
	           String authNum = buffer.toString();
	         
	           Message msg = new MimeMessage(sess);
	           msg.setFrom(addr);         
	           msg.setSubject(MimeUtility.encodeText("회원가입 인증 메일입니다.", "utf-8","B"));
	           msg.setContent("인증 번호는 [" + authNum + "] 입니다.", "text/html;charset=utf-8");
	           msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));

	           m.addAttribute("code", authNum);
	         
	           Transport.send(msg);
	           
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	       return "regist/reg";
	}
	
	//아이디 중복체크
	@RequestMapping("idCheck")
	public String idCheck(String email, Model m) throws Throwable {
				
		boolean ok = registdao.IdCheck(email);
		
		if(ok) {
			m.addAttribute("code", 0);
		}else {
			m.addAttribute("code", 1);
		}
		
		return "regist/reg";
	}
}