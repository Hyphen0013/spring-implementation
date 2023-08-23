package hyphen.main;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

public class EditDataMain {

	public static void main(String[] args) {
		Student stud = new Student();
		stud.setEmail("hyphen.call@gmail.com");
		stud.setName("Hyphen Call");
		
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean f = dao.editData(stud);
		
		if(f) {
			System.out.println("Data edited sucessfully...");
		} else {
			System.out.println("Something wrong...");
		}
	}

}
