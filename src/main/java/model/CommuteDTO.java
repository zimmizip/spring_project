package model;

public class CommuteDTO {
	private String email;
	private String day;
	private String gtw;
	private String ow;
	private String name;
	
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
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getGtw() {
		return gtw;
	}
	public void setGtw(String gtw) {
		this.gtw = gtw;
	}
	public String getOw() {
		return ow;
	}
	public void setOw(String ow) {
		this.ow = ow;
	}
	@Override
	public String toString() {
		return "CommuteDTO [email=" + email + ", day=" + day + ", gtw=" + gtw + ", ow=" + ow + "]";
	}
	
}
