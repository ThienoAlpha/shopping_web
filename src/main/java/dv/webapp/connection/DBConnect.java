package dv.webapp.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection() {
		Connection cons = null;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver"); // Gọi vào thư viện com.mysql.cj.jdbc tạo đối tượng Driver để sử
														// dụng đối tượng DriverManager bên dưới
			cons = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp_shop", "root", "123456789lc");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return cons;

	}

	public static void main(String[] args) {
		System.out.println(getConnection());
	}
}
