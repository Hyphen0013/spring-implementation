package hyphen.main;

import java.sql.Connection;
import java.sql.Date;
import java.util.Calendar;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

public class InsertDataMain {
	
	public static void main(String[] args) {
		Connection conn = DBConnect.getConnection();
		
		// Create a SQL data object
		Calendar calendar = Calendar.getInstance();
		Date createdAt = new Date(calendar.getTime().getTime());		
		
		Student stud = new Student();
		stud.setName("Digy");
		stud.setLevel("student");
		stud.setEmail("digyspab@gmail.com");
		stud.setPassword("123456");
		stud.setCreatedAt(createdAt);
		stud.setUpdated_at(null);
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean a = dao.dataInsert(stud);
		
		if (a) {
			System.out.println("Insert data Sucessfully...");
		} else {
			System.out.println("Insert failed...");
		}		
	}
}
