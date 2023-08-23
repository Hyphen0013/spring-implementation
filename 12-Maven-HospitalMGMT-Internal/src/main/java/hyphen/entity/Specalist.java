package hyphen.entity;

import java.sql.Date;

public class Specalist {
	private int id;
	private String specialistName;
	private Date createdAt;
	private Date updated_at;	

	public Specalist() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Specalist(int id, String specialistName, Date createdAt, Date updated_at) {
		super();
		this.id = id;
		this.specialistName = specialistName;
		this.createdAt = createdAt;
		this.updated_at = updated_at;		
	}
	
	public Specalist(String specialistName, Date createdAt) {
		super();
		this.id = id;
		this.specialistName = specialistName;
		this.createdAt = createdAt;
		this.updated_at = updated_at;		
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

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSpecialistName() {
		return specialistName;
	}

	public void setSpecialistName(String specialistName) {
		this.specialistName = specialistName;
	}
}
