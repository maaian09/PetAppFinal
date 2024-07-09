package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Request_Order;

public class RequestOrderDAOImpl implements RequestOrderDAO{
	
	private Connection conn;
	public RequestOrderDAOImpl(Connection conn) {
		super();
		this.conn=conn;
	}
		
	public boolean saveRequestOrder(List<Request_Order> rlist) {
		boolean f=false;
		try {
			String sql="insert into order_request(request_id,user_name, email,phonenr,city,description,pet_name,owner_email,status) values (?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			for(Request_Order r:rlist) {
				ps.setString(1,r.getRequest_id());
				ps.setString(2, r.getUserName());
				ps.setString(3, r.getEmail());
				ps.setString(4, r.getPhonenr());
				ps.setString(5, r.getCity());
				ps.setString(6, r.getDescription());
				ps.setString(7, r.getPet_name());
				ps.setString(8, r.getOwner_email());
				ps.setString(9, r.getStatus());
				ps.addBatch();
				
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
f=true;
conn.setAutoCommit(true);
		} catch (Exception e) {
			e.printStackTrace();
		}                                      	
			return f;
	}
	public List<Request_Order> getPet(String email) {
		
		List<Request_Order> list=new ArrayList<Request_Order>();
		Request_Order o=null;
		try {
			
			String sql="select * from order_request where email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Request_Order();
				o.setId(rs.getInt(1));
				o.setRequest_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhonenr(rs.getString(5));
				o.setCity(rs.getString(6));
				o.setDescription(rs.getString(7));
				o.setPet_name(rs.getString(8));
				o.setOwner_email(rs.getString(9));
				o.setStatus(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	
	public List<Request_Order> getAllRequest() {
		
		
		List<Request_Order> list=new ArrayList<Request_Order>();
		Request_Order o=null;
		try {
			
			String sql="select * from order_request ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Request_Order();
				o.setId(rs.getInt(1));
				o.setRequest_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhonenr(rs.getString(5));
				o.setCity(rs.getString(6));
				o.setDescription(rs.getString(7));
				o.setPet_name(rs.getString(8));
				o.setOwner_email(rs.getString(9));
				o.setStatus(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<Request_Order> getRequestForPostedPet(String owner_email) {
		
		List<Request_Order> list=new ArrayList<Request_Order>();
		Request_Order o=null;
		try {
			
			String sql="select * from order_request where owner_email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, owner_email);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				o=new Request_Order();
				o.setId(rs.getInt(1));
				o.setRequest_id(rs.getString(2));
				o.setUserName(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setPhonenr(rs.getString(5));
				o.setCity(rs.getString(6));
				o.setDescription(rs.getString(7));
				o.setPet_name(rs.getString(8));
				o.setOwner_email(rs.getString(9));
				o.setStatus(rs.getString(10));
				list.add(o);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	   public boolean updateRequestStatus(String request_id, String email) {
	        boolean f = false;
	        try {
	        	String query = "UPDATE order_request SET status=? WHERE request_id=? AND email=?";
	            PreparedStatement ps = conn.prepareStatement(query);
	            ps.setString(1, "Acceptat");  
	           
	            ps.setString(2, request_id);
	            ps.setString(3, email);
	            int i = ps.executeUpdate();
	            if (i == 1) {
	                f = true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return f;
	    }
	   public boolean denyOtherRequests(String request_id, String pet_name) {
		    boolean f = false;
		    try {
		        String query = "UPDATE order_request SET status=? WHERE pet_name=? AND request_id<>?";
		        PreparedStatement pstmt = conn.prepareStatement(query);
		        pstmt.setString(1, "Respins");  
		        pstmt.setString(2, pet_name);    
		        pstmt.setString(3, request_id); 
		        int i = pstmt.executeUpdate();
		        if (i >= 1) {
		            f = true;
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    return f;
		}

}
