package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hyphen.entity.GalleryImage;

public class GalleryImageDAO {
	
	private Connection conn;

	public GalleryImageDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/**
	 * Add Gallery in Database
	 * @param gallery
	 */	
	public boolean addGalleryImage(GalleryImage gallery) {
		boolean check = false;
		
		try {
			String sql = "INSERT INTO gallery(img_name, img_heading, remarks, created_at) VALUES(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql); 
			ps.setString(1, gallery.getImg_name());
			ps.setString(2, gallery.getImg_heading());
			ps.setString(3, gallery.getRemarks());
			ps.setDate(4, gallery.getCreated_at());

			int a = ps.executeUpdate();
			if (a == 1) {
				check = true;
			}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return check;		
	}
	
	/**
	 * Get All Gallery
	 * @return gallery
	 */
	public List<GalleryImage> getAllGalleryImage() {
		List<GalleryImage> list = new ArrayList<GalleryImage>();
		GalleryImage s = null;
		
		try {
			String sql = "SELECT * FROM gallery";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s = new GalleryImage();
				s.setImg_id(rs.getInt(1));
				s.setImg_name(rs.getString(2));
				s.setImg_heading(rs.getString(3));
				s.setRemarks(rs.getString(4));
				s.setCreated_at(rs.getDate(5));
								
				list.add(s);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}	
}
