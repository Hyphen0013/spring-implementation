package hyphen.main;

import java.sql.Connection;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Scanner;

import hyphen.conn.DBConnect;
import hyphen.dao.StudentDao;
import hyphen.entity.Student;

public class mainClass {

	public static void main(String[] args) {
		Connection conn = DBConnect.getConnection();
		
		boolean f = true;
		while(f) {
			System.out.println("--------------------------------");
			System.out.println("1. Create Contact");
			System.out.println("2. Edit Contact");
			System.out.println("3. Delete Contact");
			System.out.println("4. View Contact");
			System.out.println("5. Exit");
			System.out.println("--------------------------------");
			
			Calendar calendar = Calendar.getInstance();
			Date createdAt = new Date(calendar.getTime().getTime());				
			
			Scanner sc = new Scanner(System.in);
			System.out.println("Enter Number");
			int no = sc.nextInt();
			
			StudentDao dao = new StudentDao(DBConnect.getConnection());
			
			switch (no) {
			case 1: {
				System.out.println("Enter Name: ");
				String name = sc.next();
				
				System.out.println("Enter level: ");
				String level = sc.next();
				
				System.out.println("Enter Email: ");
				String email = sc.next();
				
				System.out.println("Enter Password: ");
				String password = sc.next();
				
				
				Student stud = new Student();
				stud.setName(name);
				stud.setLevel(level);
				stud.setEmail(email);
				stud.setPassword(password);
				stud.setCreatedAt(createdAt);
				stud.setUpdated_at(createdAt);	
				
				
				boolean a = dao.dataInsert(stud);
				
				if (a) {
					System.out.println("Insert data Sucessfully...");
				} else {
					System.out.println("Insert failed...");
				}
				break;
				
			}
			
			case 2: {
				System.out.println("Enter Name: ");
				String name = sc.next();
				
				System.out.println("Enter Email: ");
				String email = sc.next();	
				
				Student stud = new Student();
				stud.setName(name);
				stud.setEmail(email);
				
				boolean ed = dao.editData(stud);
				if (ed) {
					System.out.println("Edit data Sucessfully...");
				} else {
					System.out.println("Edit failed...");
				}
				break;
			}
			
			case 3: {				
				System.out.println("Enter Email: ");
				String email = sc.next();	
				
				boolean ed = dao.deleteData(email);
				if (ed) {
					System.out.println("Delete data Sucessfully...");
				} else {
					System.out.println("delete failed...");
				}
				break;
			}
			
			case 4: {				
				System.out.println("Enter Email: ");
				String email = sc.next();	
				
				Student stud = dao.getData(email);
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyy");
				
				if (stud != null) {
					System.out.println("Id: - " + stud.getId());
					System.out.println("Name: - " + stud.getName());
					System.out.println("Level: - " + stud.getLevel());
					System.out.println("Email: - " + stud.getEmail());
					System.out.println("Password: - " + stud.getPassword());
					System.out.println("Created At: - " + formatter.format(stud.getCreatedAt()));	
				} else {
					System.out.println("Data not available");
				}
				break;
			}
			
			case 5: {
				List<Student> list = dao.getAllData();
				if (list.isEmpty()) {
					System.out.println("Data not available");
				} else {
					SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyy");
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
				break;
			}
			
			case 6: {
				f=false;
				System.out.println("Your program is terminated!");
				break;
			}			
			
			default:
				System.out.println("Invalid Number choose from avobe number");
			}
			
		}
	}

}
