package ee.taltech.java.model;

public class User {
	
	private String first_name;
	private String last_name;
	private String username;
	private String email;
	private String password;
	private String role_id;
	private String is_deleted;
	
	public User(String first_name, String last_name, String username, String email, String password, String role_id,
			String is_deleted) {
		super();
		this.first_name = first_name;
		this.last_name = last_name;
		this.username = username;
		this.email = email;
		this.password = password;
		this.role_id = role_id;
		this.is_deleted = is_deleted;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() throws Exception {
//		PasswordManager pw = new PasswordManager();
//		String decrypted = pw.decrypt(password);
//		return decrypted;
		return password;
	}

	public void setPassword(String password) throws Exception {
		PasswordManager pw = new PasswordManager();
		String encrypted = pw.encrypt(password);
		this.password = encrypted;		
	}

	public String getRole_id() {
		return role_id;
	}

	public void setRole_id(String role_id) {
		this.role_id = role_id;
	}

	public String getIs_deleted() {
		return is_deleted;
	}

	public void setIs_deleted(String is_deleted) {
		this.is_deleted = is_deleted;
	}
	
}
