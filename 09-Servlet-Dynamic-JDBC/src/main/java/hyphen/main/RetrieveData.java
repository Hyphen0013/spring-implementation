package hyphen.main;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

public class RetrieveData {

	public static void main(String[] args) {
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		Student stud = dao.getData("hyphen.call@gmail.com");
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyy");
		
		if(stud == null) {
			System.out.println("No data found");
		} else {
			
			System.out.println("Id: - " + stud.getId());
			System.out.println("Name: - " + stud.getName());
			System.out.println("Level: - " + stud.getLevel());
			System.out.println("Email: - " + stud.getEmail());
			System.out.println("Password: - " + stud.getPassword());
			System.out.println("Created At: - " + formatter.format(stud.getCreatedAt()));			
		}
		
		System.out.println("------------ ALL DATA ---------------------------");
		
		List<Student> list = dao.getAllData();
		for(Student s : list) {
			System.out.println("| Id: - " + s.getId());
			System.out.println("| Name: - " + s.getName());
			System.out.println("| Level: - " + s.getLevel());
			System.out.println("| Email: - " + s.getEmail());
			System.out.println("| Password: - " + s.getPassword());
			System.out.println("| Created At: - " + formatter.format(s.getCreatedAt()));
			System.out.println("________");
		}
	}
}
