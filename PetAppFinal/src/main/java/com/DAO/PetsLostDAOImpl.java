package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.adoptionRequestCart;
import com.entity.petforadoptionDtls;
import com.entity.petlostDtls;

public class PetsLostDAOImpl {
	 private Connection conn;
	    
		
		public PetsLostDAOImpl(Connection conn) {
			super();
			this.conn = conn;
		}
		
		public boolean addPetsLost(petlostDtls p) {
			boolean f=false;
			try {
				String sql="insert into petlost(name, animal_type, gender, breed, contact, lost_on, photo_url, location, email) values(?,?,?,?,?,?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, p.getName());
				ps.setString(2, p.getAnimal_type());
				ps.setString(3, p.getGender());
				ps.setString(4, p.getBreed());
				ps.setString(5, p.getContact());
				ps.setDate(6, p.getLost_on());
				ps.setString(7, p.getPhoto_url());
				ps.setString(8, p.getLocation());
				ps.setString(9, p.getEmail());
				
				
				
				int i=ps.executeUpdate();
				
				
				if(i==1) {
					f=true;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
		
		public List<petlostDtls> getPetsLost() {
			List<petlostDtls> list= new ArrayList<petlostDtls>();
			petlostDtls p=null;
			try {
				String sql="select * from petlost";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{
					p=new petlostDtls();
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setAnimal_type(rs.getString(3));
					p.setGender(rs.getString(4));
					p.setBreed(rs.getString(5));
					p.setContact(rs.getString(6));
					p.setLost_on(rs.getDate(7));
					p.setPhoto_url(rs.getString(8));
					p.setLocation(rs.getString(9));
					p.setEmail(rs.getString(10));
					list.add(p);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}
		
	
		public boolean deleteLostPets(int id) {
			boolean f=false;
			
			
			try {
				String sql="delete from petlost where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, id);
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
		
		public List<petlostDtls> getPetsLost2() {
			List<petlostDtls> list= new ArrayList<petlostDtls>();
			petlostDtls p=null;
			try {
				String sql="select * from petlost order by id DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
				int i=1;
				while(rs.next() && i<=4)
				{
					p=new petlostDtls();
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setAnimal_type(rs.getString(3));
					p.setGender(rs.getString(4));
					p.setBreed(rs.getString(5));
					p.setContact(rs.getString(6));
					p.setLost_on(rs.getDate(7));
					p.setPhoto_url(rs.getString(8));
					p.setLocation(rs.getString(9));
					p.setEmail(rs.getString(10));
					list.add(p);
					i++;
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}
		
		public List<petlostDtls> getAllPetsLost() {
			List<petlostDtls> list= new ArrayList<petlostDtls>();
			petlostDtls p=null;
			try {
				String sql="select * from petlost order by id DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next())
				{
					p=new petlostDtls();
					p.setId(rs.getInt(1));
					p.setName(rs.getString(2));
					p.setAnimal_type(rs.getString(3));
					p.setGender(rs.getString(4));
					p.setBreed(rs.getString(5));
					p.setContact(rs.getString(6));
					p.setLost_on(rs.getDate(7));
					p.setPhoto_url(rs.getString(8));
					p.setLocation(rs.getString(9));
					p.setEmail(rs.getString(10));
					list.add(p);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}

		public petlostDtls getPetLostById(int id) {
			
			petlostDtls p=null;
			try {
				String sql="select * from petlost where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, id);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
				p= new petlostDtls()	;
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setContact(rs.getString(6));
				p.setLost_on(rs.getDate(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return p;
			
		}
		public List<petlostDtls> getPetLostByEmail(String email) {
			List<petlostDtls> list=new ArrayList<petlostDtls>();
			petlostDtls p=null;
				try {
					 String sql = "SELECT * FROM petlost WHERE email = ? ";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1, email);
					ResultSet rs=ps.executeQuery();
					
					while(rs.next())
					{
						p=new petlostDtls();
						p.setId(rs.getInt(1));
						p.setName(rs.getString(2));
						p.setAnimal_type(rs.getString(3));
						p.setGender(rs.getString(4));
						p.setBreed(rs.getString(5));
						p.setContact(rs.getString(6));
						p.setLost_on(rs.getDate(7));
						p.setPhoto_url(rs.getString(8));
						p.setLocation(rs.getString(9));
						p.setEmail(rs.getString(10));
						list.add(p);
						
					}
					
				}catch(Exception e) {
					
					e.printStackTrace();
					
				}
			return list;
		}
		
		 public boolean deleteLostPet(String email, int id) {
			 boolean f=false;
			 try {
				String sql="delete from petlost where email=? and id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, email);
				ps.setInt(2, id);
				int i=ps.executeUpdate();
				if(i==1) {
					f=true;
				}
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}	 
			 return f;
			 
			 
			 
		 }
		
		
}
