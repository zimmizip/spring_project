package model;

public class TodoDTO {
	private int num;
	private String email;
	private String content;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "TodoDTO [num=" + num + ", email=" + email + ", content=" + content + "]";
	}
	
	
}
