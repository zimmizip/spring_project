package model;

public class BoardDTO{
	private String workspace_name;
	private int num;
	private String writer;
	private String subject;
	private String content;
	private String passwd;
	private String reg_date;
	private int readcount;
	private int ref;
	private int re_step;
	private int re_level;
	private String filename;
	private int filesize;
	public String getWorkspace_name() {
		return workspace_name;
	}

	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getNum() {
		return num;
	}

	public int getReadcount() {
		return readcount;
	}

	public String getWriter() {
		return writer;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public String getPasswd() {
		return passwd;
	}

	public String getReg_date() {
		return reg_date;
	}

	public int getRef() {
		return ref;
	}

	public int getRe_level() {
		return re_level;
	}

	public int getRe_step() {
		return re_step;
	}

	@Override
	public String toString() {
		return "BoardDTO [workspace_name=" + workspace_name + ", num=" + num + ", writer=" + writer + ", subject="
				+ subject + ", content=" + content + ", passwd=" + passwd + ", reg_date=" + reg_date + ", readcount="
				+ readcount + ", ref=" + ref + ", re_step=" + re_step + ", re_level=" + re_level + ", filename="
				+ filename + ", filesize=" + filesize + "]";
	}

}