package hyphen.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	private static Connection conn;
	
	public static Connection getConnection() {
		try {
			if(conn == null) {
				String driver = "com.mysql.cj.jdbc.Driver";
				String url = "jdbc:mysql://localhost:3306/studentportalmicro";
				String username = "root";
				String password = "password";
				
				Class.forName(driver);
				conn = DriverManager.getConnection(url, username, password);
							
				System.out.println("Connection established..." + conn);	
			}

			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			e.printStackTrace();
		}
		return conn;
	}
}
