import java.sql.Connection;
import java.sql.DriverManager;

public class program1 {

	public static void main(String[] args) {
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/studentportalmicro";
			String username = "root";
			String password = "password";
			
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, username, password);
						
			System.out.println("Connection established..." + con);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
