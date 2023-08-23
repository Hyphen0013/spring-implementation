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
	 * Insert in DB
	 */
	public boolean dataInsert(Student stud) {
		boolean check = false;
		try {

			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO student(id, name, level, email, password, created_at, updated_at) VALUES(null, ?, ?, ?, ?, ?, ?)");
			ps.setString(1, stud.getName());
			ps.setString(2, stud.getLevel());
			ps.setString(3, stud.getEmail());
			ps.setString(4, stud.getPassword());
			ps.setDate(5, stud.getCreatedAt());
			ps.setDate(6, stud.getUpdated_at());

			int a = ps.executeUpdate();
			if (a == 1) {
				check = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	/**
	 * Update Data
	 */
	public boolean editData(Student stud) {
		boolean check = false;
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE student SET name = ? where email = ?");
			ps.setString(1, stud.getName());
			ps.setString(2, stud.getEmail());

			int i = ps.executeUpdate();
			if (i == 1) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	/**
	 * Delete Data
	 */
	public boolean deleteData(String email) {
		boolean check = false;
		try {
			PreparedStatement ps = conn.prepareStatement("DELETE FROM student where email = ?");
			ps.setString(1, email);

			int i = ps.executeUpdate();
			if (i == 1) {
				check = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}

	/**
	 * Get data from email
	 */
	public Student getData(String email) {
		Student obj = null;
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM student WHERE email = ?");
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				obj = new Student();
				obj.setId(rs.getInt(1));
				obj.setName(rs.getString(2));
				obj.setLevel(rs.getString(3));
				obj.setEmail(rs.getString(4));
				obj.setPassword(rs.getString(5));
				obj.setCreatedAt(rs.getDate(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}

	/**
	 * Get all data from data base
	 */
	public List<Student> getAllData() {
		List<Student> list = new ArrayList<>();
		Student stud = null;

		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM student");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				stud = new Student();
				stud.setId(rs.getInt(1));
				stud.setName(rs.getString(2));
				stud.setLevel(rs.getString(3));
				stud.setEmail(rs.getString(4));
				stud.setPassword(rs.getString(5));
				stud.setCreatedAt(rs.getDate(6));

				list.add(stud);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
