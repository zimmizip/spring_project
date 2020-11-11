package model;

public class MainDTO {
	private String WORKSPACE_NAME;
	private int COUNT;
	@Override
	public String toString() {
		return "MainDTO [WORKSPACE_NAME=" + WORKSPACE_NAME + ", COUNT=" + COUNT + "]";
	}
	public String getWORKSPACE_NAME() {
		return WORKSPACE_NAME;
	}
	public void setWORKSPACE_NAME(String WORKSPACE_NAME) {
		this.WORKSPACE_NAME = WORKSPACE_NAME;
	}
	public int getCOUNT() {
		return COUNT;
	}
	public void setCOUNT(int cOUNT) {
		COUNT = cOUNT;
	}
	
	

}
