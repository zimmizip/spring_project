package model;

public class WorkUsersDTO {
	private String workspace_name;
	private String name;
	private String email;
	private String userDate;
	private String grade;
	
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "WorkUsersDTO [workspace_name=" + workspace_name + ", name=" + name + ", email=" + email + ", userDate="
				+ userDate + ", grade=" + grade + "]";
	}
	
}
