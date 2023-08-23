package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hyphen.entity.Student;

public class StudentDao {
	private Connection conn;

	public StudentDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/**
	 * Add Student in Database
	 * @param student
	 */
	public boolean addStudent(Student student) {
		boolean check = false;
		
		try {
			String sql = "INSERT INTO student(name, level, email, password, dob, created_at, updated_at) VALUES(?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getLevel());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getPassword());
			ps.setString(5, student.getDob());
			ps.setDate(6, student.getCreatedAt());
			ps.setDate(7, student.getUpdated_at());

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
	 * Edit Student in Database
	 * @param student
	 */
	public boolean editStudent(Student student) {
		boolean check = false;
		
		try {
			String sql = "UPDATE student SET name = ?, level = ?, email = ?, dob = ?, updated_at = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, student.getName());
			ps.setString(2, student.getLevel());
			ps.setString(3, student.getEmail());
			ps.setString(4, student.getDob());
			ps.setDate(5, student.getUpdated_at());
			ps.setInt(6, student.getId());

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
	 * 
	 * @return
	 */ 
	public boolean deleteStudent(int id) {
		boolean check = false;
		
		try {
			String sql = "DELETE FROM student WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);	
			
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
	
	public List<Student> getAllStudent() {
		List<Student> list = new ArrayList<Student>();
		Student stud = null;
		
		try {
			String sql = "SELECT * FROM student";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				stud = new Student(sql, sql, sql, sql, sql, null, null);
				stud.setId(rs.getInt(1));
				stud.setName(rs.getString(2));
				stud.setLevel(rs.getString(3));
				stud.setEmail(rs.getString(4));
				stud.setPassword(rs.getString(5));
				stud.setDob(rs.getString(6));
				
				list.add(stud);	
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	public Student getStudentById(int id) {
		Student stud = null;
		try {
			String sql = "SELECT * FROM student WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				stud = new Student(sql, sql, sql, sql, sql, null, null);
				stud.setId(rs.getInt(1));
				stud.setName(rs.getString(2));
				stud.setLevel(rs.getString(3));
				stud.setEmail(rs.getString(4));
				stud.setPassword(rs.getString(5));
				stud.setDob(rs.getString(6));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		return stud;
	}
}
