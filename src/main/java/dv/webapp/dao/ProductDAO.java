package dv.webapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import dv.webapp.connection.DBConnect;
import dv.webapp.model.Cart;
import dv.webapp.model.Product;

public class ProductDAO {
	private Connection cons;
	private PreparedStatement pst;
	private String query;
	private ResultSet rs;

	public ProductDAO(Connection cons) {
		this.cons = cons;
	}

	public ArrayList<Product> getAllproduct() {
		cons = DBConnect.getConnection();
		query = "SELECT * FROM webapp_shop.products;";
		ArrayList<Product> arr = new ArrayList<Product>();
		try {

			pst = cons.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt("id"));
				pr.setName(rs.getString("name"));
				pr.setCategory(rs.getString("category"));
				pr.setPrice(rs.getDouble("price"));
				pr.setImage(rs.getString("image"));
				arr.add(pr);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return arr;

	}

	public ArrayList<Product> getProductbyCategory(String category) {
		cons = DBConnect.getConnection();
		query = "SELECT * FROM webapp_shop.products where category = '"+ category +"';";
		ArrayList<Product> arr = new ArrayList<Product>();
		try {

			pst = cons.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product pr = new Product();
				pr.setId(rs.getInt("id"));
				pr.setName(rs.getString("name"));
				pr.setCategory(rs.getString("category"));
				pr.setPrice(rs.getDouble("price"));
				pr.setImage(rs.getString("image"));
				arr.add(pr);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return arr;

	}

	public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
		List<Cart> products = new ArrayList<Cart>();
		try {
			if (cartList.size() > 0) {
				for (Cart item : cartList) {
					query = "SELECT * FROM webapp_shop.products where id=?;";
					pst = cons.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while (rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("id"));
						row.setName(rs.getString("name"));
						row.setCategory(rs.getString("category"));
						row.setPrice(rs.getDouble("price") * item.getQuantity());
						row.setQuantity(item.getQuantity());
						products.add(row);

					}
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return products;

	}

	public double getTotalCartPrice(ArrayList<Cart> cartlist) {
		double sum = 0;
		try {
			for (Cart item : cartlist) {
				query = "select price from products where id = ?";
				pst = cons.prepareStatement(query);
				pst.setInt(1, item.getId());
				rs = pst.executeQuery();
				while (rs.next()) {
					sum += rs.getDouble("price") * item.getQuantity();
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return sum;
	}

	public int getQuantity(ArrayList<Cart> cartlist) {
		int quan = 0;
		try {
			for (Cart item : cartlist) {
				query = "select quantity from products where id = ?";
				pst = cons.prepareStatement(query);
				pst.setInt(1, item.getId());
				rs = pst.executeQuery();
				while (rs.next()) {
					quan = rs.getInt("quantity");
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return quan;
	}
}