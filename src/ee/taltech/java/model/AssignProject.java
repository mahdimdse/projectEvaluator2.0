package ee.taltech.java.model;

public class AssignProject {
	private String project_id;
	private String user_id;
	
	public AssignProject(String project_id, String user_id) {
		super();
		this.project_id = project_id;
		this.user_id = user_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
	
}
