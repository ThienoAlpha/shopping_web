package dv.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dv.webapp.model.User;

public class UserDAO {
	private Connection cons;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;

	public UserDAO(Connection cons) {
		this.cons = cons;
	}

	public User userLogin(String email, String passwords) {
		User user = null;
		try {
			query = "select * from users where email = ? and password = ?";
			pst = this.cons.prepareStatement(query);
			pst.setString(1, email);
			pst.setString(2, passwords);
			rs = pst.executeQuery();

			if (rs.next()) {
				user = new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return user;
	}
}
