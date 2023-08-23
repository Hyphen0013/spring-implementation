package hyphen.entity;

import java.sql.Date;

public class Appointment {
	private int appon_id;
	private int userId;
	private String name;
	private String gender;
	private int age;
	private String appon_date;
	private String email;
	private String mobno;
	private String disease;
	private int doc_id;
	private String survey_recom;
	private String appon_info;
	private String appon_status;
	private Date status_updateAt;
	private String address;
	private String comments;
	private Date created_at;
	private Date updated_at;

	public Appointment() {
		super();
	}

	public Appointment(int appon_id, int userId, String name, String gender, int age, String appon_date, String email,
			String mobno, String disease, int doc_id, String survey_recom, String appon_info, String appon_status, Date status_updateAt,
			String address, String comments, Date created_at, Date updated_at) {
		super();
		this.appon_id = appon_id;
		this.userId = userId;
		this.name = name;
		this.gender = gender;
		this.age = age;
		this.appon_date = appon_date;
		this.email = email;
		this.mobno = mobno;
		this.disease = disease;
		this.doc_id = doc_id;
		this.survey_recom = survey_recom;
		this.appon_info = appon_info;
		this.appon_status = appon_status;
		this.status_updateAt = status_updateAt;
		this.address = address;
		this.comments = comments;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public int getAppon_id() {
		return appon_id;
	}

	public void setAppon_id(int appon_id) {
		this.appon_id = appon_id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getAppon_date() {
		return appon_date;
	}

	public void setAppon_date(String appon_date) {
		this.appon_date = appon_date;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobno() {
		return mobno;
	}

	public void setMobno(String mobno) {
		this.mobno = mobno;
	}

	public String getDisease() {
		return disease;
	}

	public void setDisease(String disease) {
		this.disease = disease;
	}

	public int getDoc_id() {
		return doc_id;
	}

	public void setDoc_id(int doc_id) {
		this.doc_id = doc_id;
	}

	public String getSurvey_recom() {
		return survey_recom;
	}

	public void setSurvey_recom(String survey_recom) {
		this.survey_recom = survey_recom;
	}

	public String getAppon_info() {
		return appon_info;
	}

	public void setAppon_info(String appon_info) {
		this.appon_info = appon_info;
	}

	public String getAppon_status() {
		return appon_status;
	}

	public void setAppon_status(String appon_status) {
		this.appon_status = appon_status;
	}
	
	public Date getStatus_updateAt() {
		return status_updateAt;
	}

	public void setStatus_updateAt(Date status_updateAt) {
		this.status_updateAt = status_updateAt;
	}	

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

}
