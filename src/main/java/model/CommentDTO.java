package model;

public class CommentDTO {

	 private int comment_num; 
	 	private String workspace_name;
		private int comment_board;        
	    private String comment_id;        
	    private String comment_date;        
	    private String comment_content; 
	    private String name;            
	    
	    public String getWorkspace_name() {
			return workspace_name;
		}
		public void setWorkspace_name(String workspace_name) {
			this.workspace_name = workspace_name;
		}
	    
		public int getComment_num() {
			return comment_num;
		}
		public void setComment_num(int comment_num) {
			this.comment_num = comment_num;
		}
		public int getComment_board() {
			return comment_board;
		}
		public void setComment_board(int comment_board) {
			this.comment_board = comment_board;
		}
		public String getComment_id() {
			return comment_id;
		}
		public void setComment_id(String comment_id) {
			this.comment_id = comment_id;
		}
		public String getComment_date() {
			return comment_date;
		}
		public void setComment_date(String comment_date) {
			this.comment_date = comment_date;
		}
		public String getComment_content() {
			return comment_content;
		}
		public void setComment_content(String comment_content) {
			this.comment_content = comment_content;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		@Override
		public String toString() {
			return "CommentDTO [comment_num=" + comment_num + ", workspace_name=" + workspace_name + ", comment_board="
					+ comment_board + ", comment_id=" + comment_id + ", comment_date=" + comment_date
					+ ", comment_content=" + comment_content + ", name=" + name + "]";
		}
	

}
