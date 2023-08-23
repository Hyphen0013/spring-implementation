package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hyphen.entity.Specalist;

public class SpecalistDao {
	private Connection conn;

	public SpecalistDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addSpecialist(Specalist specialist) {
		boolean check = false;
		
		try {
			String sql = "INSERT INTO specialist(spec_name, created_at) VALUES(?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, specialist.getSpecialistName());
			ps.setDate(2, specialist.getCreatedAt());

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
	
	public List<Specalist> getAllSpecialist() {
		List<Specalist> list = new ArrayList<Specalist>();
		Specalist s = null;
		
		try {
			String sql = "SELECT * FROM specialist";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s = new Specalist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				list.add(s);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
}
