package hyphen.main;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;

public class DeleteDataMain {

	public static void main(String[] args) {
		StudentDao dao = new StudentDao(DBConnect.getConnection());
		boolean f = dao.deleteData("digyspab@gmail.com");
		
		if(f) {
			System.out.println("Data deleted sucessfully...");
		} else {
			System.out.println("Something went wrong...");
		}
	}

}
