package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class TableHelpers {
	private Connection conn;

	public TableHelpers(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/**
	 * COUNT from all tables
	 * Dynamic count
	 */
	public int countRowFromTable(String tableName, String idType, int Id) {
		int i = 0;
		try {
			String sql = "";
			PreparedStatement ps = null;
			if(idType != null && idType.equals("doctor")) {
				sql = "SELECT * FROM " + tableName + " WHERE doc_id = ?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, Id);
			} else {
				sql = "SELECT * FROM " + tableName;
				ps = conn.prepareStatement(sql);
			}
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				i++;
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return i;
	}
}
