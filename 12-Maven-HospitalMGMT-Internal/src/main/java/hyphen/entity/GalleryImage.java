package hyphen.entity;

import java.sql.Date;

public class GalleryImage {
	private int img_id;
	private String img_name;
	private String img_heading;
	private String remarks;
	private Date created_at;
	private Date updated_at;

	public GalleryImage(int img_id, String img_name, String img_heading, String remarks, Date created_at,
			Date updated_at) {
		super();
		this.img_id = img_id;
		this.img_name = img_name;
		this.img_heading = img_heading;
		this.remarks = remarks;
		this.created_at = created_at;
		this.updated_at = updated_at;
	}

	public GalleryImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getImg_heading() {
		return img_heading;
	}

	public void setImg_heading(String img_heading) {
		this.img_heading = img_heading;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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
