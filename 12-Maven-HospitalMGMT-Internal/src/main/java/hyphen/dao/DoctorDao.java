package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import hyphen.entity.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao(Connection conn) {
		super();
		this.conn = conn;
	}
	
	/**
	 * Add Doctor in Database
	 * @param doctor
	 */	
	public boolean registerDoctor(Doctor doc) {
		boolean check = false;
		
		try {
			String sql = "INSERT INTO doctor(name, email, qualification, specialist, password, dob, mobno, created_at) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doc.getName());
			ps.setString(2, doc.getEmail());
			ps.setString(3, doc.getQualification());
			ps.setString(4, doc.getSpecialist());
			ps.setString(5, doc.getPassword());
			ps.setString(6, doc.getDob());
			ps.setString(7, doc.getMobno());
			ps.setDate(8, doc.getCreatedAt());

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
	 * Get All Doctors
	 * @return doctor
	 */
	public List<Doctor> getAllDoctors() {
		List<Doctor> list = new ArrayList<Doctor>();
		Doctor s = null;
		
		try {
			String sql = "SELECT * FROM doctor";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				s = new Doctor();
				s.setDoc_id(rs.getInt(1));
				s.setName(rs.getString(2));
				s.setEmail(rs.getString(3));
				s.setQualification(rs.getString(4));
				s.setSpecialist(rs.getString(5));
				s.setDob(rs.getString(7));
				s.setMobno(rs.getString(8));
								
				list.add(s);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * Get Doctor by ID
	 * @param id
	 * @return
	 */
	public Doctor getDoctorById(int id) {
		Doctor doc = null;
		try {
			String sql = "SELECT * FROM doctor WHERE doc_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				doc = new Doctor();
				doc.setDoc_id(rs.getInt(1));;
				doc.setName(rs.getString(2));
				doc.setEmail(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setSpecialist(rs.getString(5));
				doc.setPassword(rs.getString(6));
				doc.setDob(rs.getString(7));
				doc.setMobno(rs.getString(8));
				doc.setCreatedAt(rs.getDate(9));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}	
		return doc;
	}
	
	/**
	 * Edit Doctor in Database
	 * @param doctor
	 */
	public boolean editDoctor(Doctor doctor) {
		boolean check = false;
		
		try {
			String sql = "";
			if(doctor.getPassword() == null) {
				sql = "UPDATE doctor SET name = ?, email = ?, qualification = ?, specialist = ?, dob = ?, mobno = ?, updated_at = ? WHERE doc_id = ?";
			} else {
				sql = "UPDATE doctor SET name = ?, email = ?, qualification = ?, specialist = ?, password = ?, dob = ?, mobno = ?, updated_at = ? WHERE doc_id = ?";
			}
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, doctor.getName());
			ps.setString(2, doctor.getEmail());
			ps.setString(3, doctor.getQualification());
			ps.setString(4, doctor.getSpecialist());
			
			if(doctor.getPassword() == null) {
				ps.setString(5, doctor.getDob());
				ps.setString(6, doctor.getMobno());
				ps.setDate(7, doctor.getUpdated_at());
				ps.setInt(8, doctor.getDoc_id());				
			} else {
				ps.setString(5, doctor.getPassword());
				ps.setString(6, doctor.getDob());
				ps.setString(7, doctor.getMobno());
				ps.setDate(8, doctor.getUpdated_at());
				ps.setInt(9, doctor.getDoc_id());				
			}

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
	 * Delete Doctor in Database from id
	 * @param doctor
	 */	
	public boolean deleteDoctor(int id) {
		boolean check = false;
		try {
			String sql = "DELETE FROM doctor WHERE doc_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i == 1) {
				check = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return check;
	}
	
	/**
	 * Doctor login
	 */
	public Doctor login(String email, String password) {
		Doctor doc = null;
		
		try {
			String sql =  "SELECT * FROM doctor WHERE email = ? AND password = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				doc = new Doctor();
				doc.setDoc_id(rs.getInt(1));;
				doc.setName(rs.getString(2));
				doc.setEmail(rs.getString(3));
				doc.setQualification(rs.getString(4));
				doc.setSpecialist(rs.getString(5));
				doc.setPassword(rs.getString(6));
				doc.setDob(rs.getString(7));
				doc.setMobno(rs.getString(8));
				doc.setCreatedAt(rs.getDate(9));
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return doc;
	}
	
	/**
	 * Update Password with validation
	 */
	public HashMap<String, String> updatePassword(int userId, String oldPassword, String currPassword, String email) {
		HashMap<String, String> map = new HashMap<String, String>();
		boolean check = true;
		String sql = "";
		try {
			
			sql = "SELECT * FROM doctor WHERE doc_id = ? and password = ?";
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
				sql = "UPDATE doctor SET password = ? WHERE doc_id = ? and email = ?";
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
