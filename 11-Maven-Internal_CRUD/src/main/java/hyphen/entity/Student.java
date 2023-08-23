package hyphen.entity;

import java.sql.Date;

public class Student {
	private int id;
	private String name;
	private String level;
	private String email;
	private String password;
	private String dob;
	private Date createdAt;
	private Date updated_at;
	
	public Student(String name, String level, String email, String password, String dob, Date createdAt,
			Date updated_at) {
		super();
		this.name = name;
		this.level = level;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.createdAt = createdAt;
		this.updated_at = updated_at;
	}

	public Student(int id, String name, String level, String email, String dob, Date updated_at) {
		super();
		this.id = id;
		this.name = name;
		this.level = level;
		this.email = email;
		this.password = password;
		this.dob = dob;
		this.createdAt = createdAt;
		this.updated_at = updated_at;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", level=" + level + ", email=" + email + ", password="
				+ password + ", dob=" + dob + ", createdAt=" + createdAt + ", updated_at=" + updated_at + "]";
	}
}
