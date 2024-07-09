package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.adoptionRequestCart;


public class RequestCartDAOImpl implements RequestCartDAO{

	private Connection conn;
	public RequestCartDAOImpl(Connection conn) {
		this.conn=conn;
	}
	
	
	public boolean addAdoptionRequestCart(adoptionRequestCart r) {
	    boolean f = false;
	    try {
	        if (!isPetAlreadyInCart(r.getUser_id(), r.getPet_id())) {
	            String sql = "insert into request_cart(pet_id,user_id, pet_name,owner_email) values(?,?,?,?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, r.getPet_id());
	            ps.setInt(2, r.getUser_id());
	            
	            ps.setString(3, r.getPet_name());
	            ps.setString(4, r.getOwner_email());

	            int i = ps.executeUpdate();
	            if (i == 1) {
	                f = true;
	            }
	        } else {
	            System.out.println("Pet is already in the request cart.");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return f;
	}



	
	public List<adoptionRequestCart> getPetByUser(int user_id) {
		List<adoptionRequestCart> list=new ArrayList<adoptionRequestCart>();
		adoptionRequestCart r=null;
		
		try {
			String sql="select * from request_cart where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				r=new adoptionRequestCart();
				r.setId_adoption_request(rs.getInt(1));
				r.setPet_id(rs.getInt(2));
				r.setUser_id(rs.getInt(3));
				
				r.setPet_name(rs.getString(4));
				r.setOwner_email(rs.getString(5));
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public adoptionRequestCart getPetByUser2(int user_id) {
		adoptionRequestCart r=null;
      
		try {
			String sql="select * from request_cart where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				r=new adoptionRequestCart();
				r.setId_adoption_request(rs.getInt(1));
				r.setPet_id(rs.getInt(2));
				r.setUser_id(rs.getInt(3));
				
				r.setPet_name(rs.getString(4));
				r.setOwner_email(rs.getString(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}
	public adoptionRequestCart getRequestByUser(int user_id) {
		adoptionRequestCart r=null;
      
		try {
			String sql="select * from request_cart where user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				r=new adoptionRequestCart();
				r.setId_adoption_request(rs.getInt(1));
				r.setPet_id(rs.getInt(2));
				r.setUser_id(rs.getInt(3));
				
				r.setPet_name(rs.getString(4));
				r.setOwner_email(rs.getString(5));
				r.setDescription(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return r;
	}


	public boolean withdrawRequest(int pet_id, int user_id) {
		boolean f=false;
		
		
		try {
			String sql="delete from request_cart where pet_id=? and user_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, pet_id);
			ps.setInt(2, user_id);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return f;
	}
	public List<adoptionRequestCart> getPetByEmail(String email) {
		List<adoptionRequestCart> list=new ArrayList<adoptionRequestCart>();
		adoptionRequestCart r=null;
		
		try {
			String sql="select * from request_cart where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				r=new adoptionRequestCart();
				r.setId_adoption_request(rs.getInt(1));
				r.setPet_id(rs.getInt(2));
				r.setUser_id(rs.getInt(3));
				
				r.setPet_name(rs.getString(4));
				r.setOwner_email(rs.getString(5));
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean isPetAlreadyInCart(int user_id, int pet_id) {
	    boolean exists = false;
	    try {
	        String sql = "SELECT * FROM request_cart WHERE user_id = ? AND pet_id = ?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, user_id);
	        ps.setInt(2, pet_id);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            exists = true;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return exists;
	}

	public List<adoptionRequestCart> getPetByUserAndPet(int user_id, int pet_id){
		List<adoptionRequestCart> list=new ArrayList<adoptionRequestCart>();
		adoptionRequestCart r=null;
		
		try {
			String sql="select * from request_cart where user_id=? and pet_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, user_id);
			ps.setInt(2, pet_id);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				r=new adoptionRequestCart();
				r.setId_adoption_request(rs.getInt(1));
				r.setPet_id(rs.getInt(2));
				r.setUser_id(rs.getInt(3));
				
				r.setPet_name(rs.getString(4));
				r.setOwner_email(rs.getString(5));
				list.add(r);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	  public boolean clearCartByUser(int user_id) {
	        boolean isCleared = false;
	        try {
	            String sql = "DELETE FROM request_cart WHERE user_id=?";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, user_id);
	            int rowsAffected = ps.executeUpdate();
	            if (rowsAffected > 0) {
	                isCleared = true;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return isCleared;
	    }

}
