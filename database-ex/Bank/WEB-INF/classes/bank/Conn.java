package bank;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conn {

		private static Connection instance;
		
		public static Connection getInstance() {
			if(instance==null) {
				String url="jdbc:mysql://localhost:3306/bank";
				String user="root";
				String password="123456";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					instance=DriverManager.getConnection(url,user,password);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch(SQLException e) {}
			}
			return instance;
		}
}