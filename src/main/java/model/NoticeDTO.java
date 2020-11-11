package model;

public class NoticeDTO {
	private int num;
	private String workspace_name;
	private String day;
	private String title;
	private String content;
	
	
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
	@Override
	public String toString() {
		return "NoticeDTO [num=" + num + ", workspace_name=" + workspace_name + ", day=" + day + ", title=" + title
				+ ", content=" + content + "]";
	}
	
}
