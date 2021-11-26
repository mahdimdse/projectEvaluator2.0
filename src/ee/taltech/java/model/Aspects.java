package ee.taltech.java.model;

public class Aspects {
	private String name;
	private String created_by;
	private String is_deleted;
	
	public Aspects(String name, String created_by, String is_deleted) {
		super();
		this.name = name;
		this.created_by = created_by;
		this.is_deleted = is_deleted;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	public String isIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
}
