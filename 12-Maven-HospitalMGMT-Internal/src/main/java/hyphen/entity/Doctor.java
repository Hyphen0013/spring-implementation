package hyphen.entity;

import java.sql.Date;

public class Doctor {
	private int doc_id;
	private String name;
	private String email;
	private String qualification;
	private String specialist;
	private String password;
	private String dob;
	private String mobno;
	private Date createdAt;
	private Date updated_at;

	public Doctor() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Doctor(String name, String email, String qualification, String specialist, String password, String dob,
			String mobno, Date createdAt) {
		super();
		this.name = name;
		this.email = email;
		this.qualification = qualification;
		this.specialist = specialist;
		this.password = password;
		this.dob = dob;
		this.mobno = mobno;
		this.createdAt = createdAt;
	}


	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
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

	public String getQualification() {
		return qualification;
	}

	public void setQualification(String qualification) {
		this.qualification = qualification;
	}

	public String getSpecialist() {
		return specialist;
	}

	public void setSpecialist(String specialist) {
		this.specialist = specialist;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public Date getCreatedAt() {
		return createdAt;
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

}
