package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import hyphen.entity.Student;

public class StudentDao {
	private Connection conn;

	public StudentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean studentRegister(Student student) {
		boolean check = false;
		
		try {
			String sql = "INSERT INTO student(name, email, password, created_at) VALUES(?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getEmail());
			ps.setString(3, student.getPassword());
			ps.setDate(4, student.getCreatedAt());

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
	
	public Student login(String email, String password) {
		Student student = null;
		try {
			String sql = "SELECT * FROM student WHERE email = ? AND password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				student = new Student();
				student.setId(rs.getInt(1));
				student.setName(rs.getString(2));
				student.setLevel(rs.getString(3));
				student.setEmail(rs.getString(4));
				student.setPassword(rs.getString(5));
				student.setDob(rs.getString(6));
				student.setCreatedAt(rs.getDate(7));
			}			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		return student;
	}
	
	/**
	 * Update Password with validation
	 */
	public HashMap<String, String> updatePassword(int userId, String oldPassword, String currPassword, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		boolean check = true;
		String sql = "";
		try {
			
			sql = "SELECT * FROM student WHERE id = ? and password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			ps.setString(2, oldPassword);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				check = false;
			}				
			if(check) {
				map.put("password_matched", "SORRY! Old password is not matched");
			} else {
				sql = "UPDATE student SET password = ? WHERE id = ? and email = ?";
				PreparedStatement psUpdate = conn.prepareStatement(sql);
				psUpdate.setString(1, currPassword);
				psUpdate.setInt(2, userId);
				psUpdate.setString(3, email);

				int a = psUpdate.executeUpdate();
				if (a == 1) {
					map.put("changed", "Your password updated successfully!");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return map;
	}
}
