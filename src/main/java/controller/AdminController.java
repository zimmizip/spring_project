package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.DocumentDTO;
import model.NoticeDTO;
import model.WorkUsersDTO;
import service.CommuteMybatisDAO;
import service.DocumentMybatisDAO;
import service.NoticeMybatisDAO;
import service.WorkUsersMybatisDAO;
import service.WorkspaceMakeMybatisDAO;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	public String workspace;
	public String code;
	public HttpSession session = null;
	
	@Autowired
	WorkUsersMybatisDAO wumDAO;
	@Autowired
	NoticeMybatisDAO nmDAO;
	@Autowired
	DocumentMybatisDAO dmDAO;
	@Autowired
	WorkspaceMakeMybatisDAO wmDAO;
	
	@ModelAttribute
	public void headProcess(HttpServletRequest request, HttpServletResponse res) {
		try {	
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	
			e.printStackTrace();
		}
		session = request.getSession();
		if(session.getAttribute("workspace_name") != null) {
			session.setAttribute("workspace", session.getAttribute("workspace_name"));
		}
		
		if(session.getAttribute("Wcode") != null) {
			session.setAttribute("Wcode", session.getAttribute("Wcode"));
		}
		
		code = (String)session.getAttribute("Wcode");
		workspace = (String)session.getAttribute("workspace");
	}
	
	// 관리자 첫페이지이자, 워크스페이스 멤버 리스트를 요청합니다.
	@RequestMapping("admin")
	public String admin(Model m)  throws Throwable {
		List<?> userList = wumDAO.workUserAllList(workspace);
		
		m.addAttribute("userList", userList);
		return  "admin/admin"; 
	}
	
	// 선택한 멤버 프로필을 요청합니다.
	@RequestMapping("workUserProfile")
	public String workUserProfile(@RequestParam("email") String email,Model m)  throws Throwable {

		WorkUsersDTO user = wumDAO.userProfile(email, workspace);
		
		m.addAttribute("user", user);
		return  "admin/workUserProfile"; 
	}
	
	// 멤버 삭제.
	@RequestMapping("deleteUser")
	public String deleteUser(String email,Model m)  throws Throwable {
		
		int result = wumDAO.deleteUser(email, workspace);
		
		m.addAttribute("result", result);
		//response.getWriter().write(result); // ajax 요청에 의한 리턴.
		return  "admin/workUserProfile";
	}
	
	// 공지사항 리스트를 요청.
	@RequestMapping("notice")
	public String notice(Model m)  throws Throwable { 
		List<?> noticeList = null;
		
		noticeList = nmDAO.noticeAllList(workspace);
		
		m.addAttribute("noticeList", noticeList);
		return  "admin/notice"; 
	}
	
	//작성한 공지사항을 등록.
	@RequestMapping("noticePro")
	public String noticePro(String title,String content)  throws Throwable {
		NoticeDTO noti = new NoticeDTO();
		noti.setWorkspace_name(workspace);
		noti.setTitle(title);
		noti.setContent(content);

		nmDAO.insertNotice(noti);
		
		return  "admin/noticePro"; 
	}
	
	//공지사항 내용
	@RequestMapping("noticeContent")
	public String noticeContent(@RequestParam("num") int num, Model m)  throws Throwable { 
		
		NoticeDTO noti = nmDAO.noticeContent(num, workspace);
		m.addAttribute("noti", noti);
		return  "admin/noticeContent"; 
	}
	
	// 공지 수정폼
	@RequestMapping("noticeUpdate")
	public String noticeUpdate(@RequestParam("num") int num,Model m)  throws Throwable { 

		NoticeDTO noti = nmDAO.noticeContent(num, workspace);
		
		m.addAttribute("noti", noti);
		return  "admin/noticeUpdate"; 
	}
	
	// 공지 수정
	@RequestMapping("notiUpdateFix")
	public String notiUpdateFix(int num,String title,String content,Model m) throws Exception {

		int result = nmDAO.notiUpdate(num, workspace, title, content);
		
		m.addAttribute("result", result);
		//response.getWriter().write(result);
		return "admin/noticeUpdate";
	}
	
	//공지 삭제
	@RequestMapping("notiDelete")
	public String notiDelete(int num,Model m)  throws Throwable { 
		
		int result = nmDAO.notiDelete(num, workspace);
		
		m.addAttribute("result", result);
		//response.getWriter().write(result);
		return  "admin/noticeContent"; 
	}
	
	// 할일 리스트.
	@RequestMapping("todo")
	public String todo()  throws Throwable { 
		 return  "admin/todo"; 
	} 
	
	// 근태 목록 요청.
	@RequestMapping("commute")
	public String commute(Model m)  throws Throwable { 
		List<?> articleList = null;
		CommuteMybatisDAO cmDAO = new CommuteMybatisDAO();
		articleList = cmDAO.commAllList(workspace);
		
		m.addAttribute("articleList", articleList);
		return  "admin/commute"; 
	} 
	
	// 결재 완료 리스트 요청.
	@RequestMapping("approval_finish")
	public String approval_finish(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		List<?> docu_finishList = null;
		DocumentMybatisDAO dbPro = new DocumentMybatisDAO();
		docu_finishList = dbPro.docu_finishList(workspace);
		
		request.setAttribute("docu_finishList", docu_finishList);
		 return  "admin/approval_finish"; 
	} 
	
	// 결재 대기 리스트 요청.
	@RequestMapping("approval_wait")
	public String approval_wait(HttpServletRequest request, HttpServletResponse response)  throws Throwable { 
		List<?> docu_waitList = null;
		DocumentMybatisDAO dbPro = new DocumentMybatisDAO();
		docu_waitList = dbPro.docuAllList(workspace);
		
		request.setAttribute("docu_waitList", docu_waitList);
		return  "admin/approval_wait"; 
	} 
	
	// 결재 내용 요청.
	@RequestMapping("approval_content")
	public String approval_content(@RequestParam("num") int num,Model m)  throws Throwable {
		
		DocumentDTO docu = dmDAO.docu_contentList(num, workspace);
		
		m.addAttribute("docu", docu);
		return  "admin/approval_content"; 
	}
	
	// 결재 승인
	@RequestMapping("docuPermit")
	public String docuPermit(int num,Model m)  throws Throwable {

		int result = dmDAO.docuPermit(num, workspace);
		m.addAttribute("result", result);
		//response.getWriter().write(result); // ajax 요청에 의한 리턴.
		
		return  "admin/approval_content";
	}
	
	//승인 취소
	@RequestMapping("docuCancel")
	public String docuCancel(int num,Model m)  throws Throwable {
		int result = dmDAO.docuCancel(num, workspace);
		m.addAttribute("result", result);
		//response.getWriter().write(result); // ajax 요청에 의한 리턴.
		
		return  "admin/approval_content";
	}
	
	@RequestMapping("deleteWorkspace")
	public String deleteWorkspace(Model m) throws Throwable {
		Map<String, String> admin = wmDAO.deleteWorkspace(workspace);
		m.addAttribute("admin", admin);
		
		return "admin/deleteWorkspace";
	}
	
	@RequestMapping("deleteWorkspacePro")
	public String deleteWorkspacePro(String email, Model m) throws Throwable {
		int result = wmDAO.deleteWorkspacePro(email, workspace);
		m.addAttribute("result", result);
		
		return "redirect:/main/main";
	}
	
}
