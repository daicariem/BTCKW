package Model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DBCrud {
	 public static List<Product> getAllProduct(Connection conn) {
	        List<Product> productList = null;
	        String sql = "SELECT * FROM product.sanpham";
	        PreparedStatement ps = null;
	        ResultSet rs = null;
	        productList = new ArrayList<>();

	        try {
	            ps = conn.prepareStatement(sql);
	            rs = ps.executeQuery();
	            while (rs.next()) {
	            	 int id = rs.getInt("id");
	                 String name = rs.getString("name");
	                 String description = rs.getString("description");
	                 String material = rs.getString("material");
	                 String color = rs.getString("color");
	                 double price = rs.getDouble("price");
	                 String image = rs.getString("image");
	                 productList.add(new Product(id, name, description, material,color,price,image));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                ps.close();
	                rs.close();
	            } catch (SQLException e) {
	                e.printStackTrace();
	            }

	        }

	        return productList;
	    }

	public User login(String username,String password) {
		Connection conn;	
		PreparedStatement ps = null;
        ResultSet rs = null;
		String query = "SELECT * FROM product.users where username = ? and password = ?";
		try {
			conn = new KetNoiCSDL().getKetNoiCSDL();
            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while(rs.next()) {
            	return new User(rs.getInt(1),rs.getString(2),rs.getString(3));
            }
            rs = ps.executeQuery();
		}catch (Exception e) {
			
		}
		return null;
	}
	
	public User checkAccountExist(String username) {
		Connection conn;	
		PreparedStatement ps = null;
        ResultSet rs = null;
		String query = "SELECT * FROM product.users where username = ?";
		try {
			conn = new KetNoiCSDL().getKetNoiCSDL();
            ps = conn.prepareStatement(query);
            ps.setString(1, username); 
            rs = ps.executeQuery();
            while(rs.next()) {
            	return new User(rs.getInt(1),rs.getString(2),rs.getString(3));
            }
            rs = ps.executeQuery();
		}catch (Exception e) {
			
		}
		return null;
	}
	
	public void signup(String username,String password) {
		Connection conn;	
		PreparedStatement ps = null;
		String query = "INSERT INTO product.users (username, password) VALUES (?,?)";
		
		try {
			conn = new KetNoiCSDL().getKetNoiCSDL();
            ps = conn.prepareStatement(query);
            ps.setString(1,username);
            ps.setString(2, password);
            ps.executeUpdate();
		}catch(Exception e){
			
		}
	}
}
