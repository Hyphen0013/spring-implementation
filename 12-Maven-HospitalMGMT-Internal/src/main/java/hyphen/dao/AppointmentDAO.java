package hyphen.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import hyphen.entity.Appointment;
import hyphen.entity.Doctor;

public class AppointmentDAO {
	private Connection conn;

	public AppointmentDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	/**
	 * Add Appointment in Database
	 * 
	 * @param appointment
	 */
	public boolean addAppointment(Appointment appon) {
		boolean check = false;

		try {
			String sql = "INSERT INTO appointment(userId, name, gender, age, appon_date, email, mobno, disease, doc_id, survey_recom, appon_info, appon_status, address, comments, created_at) "
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, appon.getUserId());
			ps.setString(2, appon.getName());
			ps.setString(3, appon.getGender());
			ps.setInt(4, appon.getAge());
			ps.setString(5, appon.getAppon_date());
			ps.setString(6, appon.getEmail());
			ps.setString(7, appon.getMobno());
			ps.setString(8, appon.getDisease());
			ps.setInt(9, appon.getDoc_id());
			ps.setString(10, appon.getSurvey_recom());
			ps.setString(11, appon.getAppon_info());
			ps.setString(12, appon.getAppon_status());
			ps.setString(13, appon.getAddress());
			ps.setString(14, appon.getComments());
			ps.setDate(15, appon.getCreated_at());

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
	 * Edit Appointment
	 * 
	 * @param doctor
	 */
	public boolean editAppointment(Appointment appon) {
		boolean check = false;

		try {
			String sql = "UPDATE appointment SET userId = ?, name = ?, gender = ?, age = ?, appon_date = ?, email = ?, mobno = ?, disease = ?, "
					+ "doc_id = ?, survey_recom = ?, appon_info = ?, appon_status = ?, address = ?, comments = ?, updated_at = ? WHERE appon_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, appon.getUserId());
			ps.setString(2, appon.getName());
			ps.setString(3, appon.getGender());
			ps.setInt(4, appon.getAge());
			ps.setString(5, appon.getAppon_date());
			ps.setString(6, appon.getEmail());
			ps.setString(7, appon.getMobno());
			ps.setString(8, appon.getDisease());
			ps.setInt(9, appon.getDoc_id());
			ps.setString(10, appon.getSurvey_recom());
			ps.setString(11, appon.getAppon_info());
			ps.setString(12, appon.getAppon_status());
			ps.setString(13, appon.getAddress());
			ps.setString(14, appon.getComments());
			ps.setDate(15, appon.getUpdated_at());
			ps.setInt(16, appon.getAppon_id());

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
	 * Get Appointment by userId
	 * 
	 * @param userId
	 * @return
	 */
	public List<Appointment> getAllAppointmentByLoginUser(int userId) {
		List<Appointment> appontList = new ArrayList<Appointment>();
		Appointment apon = null;

		try {
			String sql = "SELECT * FROM appointment WHERE userId = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				apon = new Appointment();
				apon.setAppon_id(rs.getInt(1));
				apon.setUserId(rs.getInt(2));
				apon.setName(rs.getString(3));
				apon.setGender(rs.getString(4));
				apon.setAge(rs.getInt(5));
				apon.setAppon_date(rs.getString(6));
				apon.setEmail(rs.getString(7));
				apon.setMobno(rs.getString(8));
				apon.setDisease(rs.getString(9));
				apon.setDoc_id(rs.getInt(10));
				apon.setSurvey_recom(rs.getString(11));
				apon.setAppon_info(rs.getString(12));
				apon.setAppon_status(rs.getString(13));
				apon.setStatus_updateAt(rs.getDate(14));
				apon.setAddress(rs.getString(15));
				apon.setComments(rs.getString(16));
				apon.setCreated_at(rs.getDate(17));
				apon.setUpdated_at(rs.getDate(18));

				appontList.add(apon);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return appontList;
	}

	/**
	 * Get Appointment by appon_id
	 * 
	 * @param apponID
	 * @return
	 */
	public Appointment getAllAppointmentByApponID(int id, String type) {
		Appointment apon = null;

		try {
			String sql = "";
			if(type.equals("appointment")) {
				sql = "SELECT * FROM appointment WHERE appon_id = ?";	
			}
			if(type.equals("doctor")) {
				sql = "SELECT * FROM appointment WHERE doc_id = ?";	
			}			
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				apon = new Appointment();
				apon.setAppon_id(rs.getInt(1));
				apon.setUserId(rs.getInt(2));
				apon.setName(rs.getString(3));
				apon.setGender(rs.getString(4));
				apon.setAge(rs.getInt(5));
				apon.setAppon_date(rs.getString(6));
				apon.setEmail(rs.getString(7));
				apon.setMobno(rs.getString(8));
				apon.setDisease(rs.getString(9));
				apon.setDoc_id(rs.getInt(10));
				apon.setSurvey_recom(rs.getString(11));
				apon.setAppon_info(rs.getString(12));
				apon.setAppon_status(rs.getString(13));
				apon.setStatus_updateAt(rs.getDate(14));
				apon.setAddress(rs.getString(15));
				apon.setComments(rs.getString(16));
				apon.setCreated_at(rs.getDate(17));
				apon.setUpdated_at(rs.getDate(18));
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return apon;
	}
	
	/**
	 * Get Appointment by doctorId
	 * 
	 * @param userId
	 * @return
	 */
	public List<Appointment> getAllAppointmentByDoctor(int doctorId) {
		List<Appointment> appontList = new ArrayList<Appointment>();
		Appointment apon = null;

		try {
			String sql = "SELECT * FROM appointment WHERE doc_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				apon = new Appointment();
				apon.setAppon_id(rs.getInt(1));
				apon.setUserId(rs.getInt(2));
				apon.setName(rs.getString(3));
				apon.setGender(rs.getString(4));
				apon.setAge(rs.getInt(5));
				apon.setAppon_date(rs.getString(6));
				apon.setEmail(rs.getString(7));
				apon.setMobno(rs.getString(8));
				apon.setDisease(rs.getString(9));
				apon.setDoc_id(rs.getInt(10));
				apon.setSurvey_recom(rs.getString(11));
				apon.setAppon_info(rs.getString(12));
				apon.setAppon_status(rs.getString(13));
				apon.setStatus_updateAt(rs.getDate(14));
				apon.setAddress(rs.getString(15));
				apon.setComments(rs.getString(16));
				apon.setCreated_at(rs.getDate(17));
				apon.setUpdated_at(rs.getDate(18));

				appontList.add(apon);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return appontList;
	}
	
	
	/**
	 * Update Appointment after doctro review
	 * 
	 * @param doctor
	 */
	public boolean updateReviewStatusByDoc(Appointment appon) {
		boolean check = false;

		try {
			String sql = "UPDATE appointment SET appon_status = ?, status_updateAt = ? WHERE appon_id = ? and doc_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, appon.getAppon_status());
			ps.setDate(2, appon.getStatus_updateAt());
			ps.setInt(3, appon.getAppon_id());
			ps.setInt(4, appon.getDoc_id());

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
	 * Get All Appointment
	 * 
	 * @param userId
	 * @return
	 */
	public List<Appointment> getAllAppointment() {
		List<Appointment> appontList = new ArrayList<Appointment>();
		Appointment apon = null;

		try {
			String sql = "SELECT * FROM appointment ORDER BY appon_id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				apon = new Appointment();
				apon.setAppon_id(rs.getInt(1));
				apon.setUserId(rs.getInt(2));
				apon.setName(rs.getString(3));
				apon.setGender(rs.getString(4));
				apon.setAge(rs.getInt(5));
				apon.setAppon_date(rs.getString(6));
				apon.setEmail(rs.getString(7));
				apon.setMobno(rs.getString(8));
				apon.setDisease(rs.getString(9));
				apon.setDoc_id(rs.getInt(10));
				apon.setSurvey_recom(rs.getString(11));
				apon.setAppon_info(rs.getString(12));
				apon.setAppon_status(rs.getString(13));
				apon.setStatus_updateAt(rs.getDate(14));
				apon.setAddress(rs.getString(15));
				apon.setComments(rs.getString(16));
				apon.setCreated_at(rs.getDate(17));
				apon.setUpdated_at(rs.getDate(18));

				appontList.add(apon);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return appontList;
	}	
}
