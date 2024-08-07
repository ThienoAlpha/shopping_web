package dv.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dv.webapp.model.Order;


public class OrderDAO {
	private Connection cons;
	private PreparedStatement pst;
	private String query;
	private ResultSet rs;
	
	
	public OrderDAO(Connection cons) {
		// TODO Auto-generated constructor stub
		this.cons = cons;
		
	}
	public int insertOder(Order model) {
		int result = 0;
		query = "INSERT INTO `webapp_shop`.`orders`" + "(`p_id`, `u_id`, `o_quantity`, `o_date`) VALUES" +" (?, ?, ?, ?);";
		try {
			pst = this.cons.prepareStatement(query);
			pst.setInt(1, model.getId());
			pst.setInt(2, model.getUid());
			pst.setInt(3, model.getQuantity());
			pst.setString(4, model.getDate());
			
			result = pst.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
}
