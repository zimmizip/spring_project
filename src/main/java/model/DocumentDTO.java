package model;

public class DocumentDTO {
	private int num;
	private String workspace_name;
	private String email;
	private String day;
	private String title;
	private String content;
	private String approval;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	@Override
	public String toString() {
		return "DocumentDTO [num=" + num + ", workspace_name=" + workspace_name + ", email=" + email + ", day=" + day
				+ ", title=" + title + ", content=" + content + ", approval=" + approval + "]";
	}
}
