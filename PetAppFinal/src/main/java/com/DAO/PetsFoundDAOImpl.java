package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.petfoundDtls;
import com.entity.petlostDtls;




public class PetsFoundDAOImpl {
	 private Connection conn;
	    
		
		public PetsFoundDAOImpl(Connection conn) {
			super();
			this.conn = conn;
		}
		
		public boolean addPetsFound(petfoundDtls p) {
			boolean f=false;
			try {
				String sql="insert into petfound(animal_type, gender, breed, found_on,  photo_url,  location,contact,email) values(?,?,?,?,?,?,?,?)";
				PreparedStatement ps=conn.prepareStatement(sql);
	
				ps.setString(1, p.getAnimal_type());
				ps.setString(2, p.getGender());
				ps.setString(3, p.getBreed());
				ps.setDate(4, p.getFound_on());
				ps.setString(5, p.getPhoto_url());
				ps.setString(6, p.getLocation());
				ps.setString(7, p.getContact());
				ps.setString(8, p.getEmail());
				
				
				
				int i=ps.executeUpdate();
				
				
				if(i==1) {
					f=true;
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return f;
		}
		
		public List<petfoundDtls> getPetsFound() {
			List<petfoundDtls> list= new ArrayList<petfoundDtls>();
			petfoundDtls p=null;
			try {
				String sql="select * from petfound";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
				
				while(rs.next())
				{
					p=new petfoundDtls();
					p.setId(rs.getInt(1));
					p.setAnimal_type(rs.getString(2));
					p.setGender(rs.getString(3));
					p.setBreed(rs.getString(4));
					p.setFound_on(rs.getDate(5));
					p.setPhoto_url(rs.getString(6));
					p.setLocation(rs.getString(7));
					p.setContact(rs.getString(8));
					p.setEmail(rs.getString(9));
					list.add(p);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}
		
		public boolean deleteFoundPets(int id) {
			boolean f=false;
			
			
			try {
				String sql="delete from petfound where id=?";
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
		
		public List<petfoundDtls> getPetsFound2() {
			List<petfoundDtls> list= new ArrayList<petfoundDtls>();
			petfoundDtls p=null;
			try {
				String sql="select * from petfound order by id DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
				int i=1;
				while(rs.next() && i<=4)
				{
					p=new petfoundDtls();
					p.setId(rs.getInt(1));
					p.setAnimal_type(rs.getString(2));
					p.setGender(rs.getString(3));
					p.setBreed(rs.getString(4));
					p.setFound_on(rs.getDate(5));
					p.setPhoto_url(rs.getString(6));
					p.setLocation(rs.getString(7));
					p.setContact(rs.getString(8));
					p.setEmail(rs.getString(9));
					list.add(p);
					i++;
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}
		
		public List<petfoundDtls> getAllPetsFound() {
			List<petfoundDtls> list= new ArrayList<petfoundDtls>();
			petfoundDtls p=null;
			try {
				String sql="select * from petfound order by id DESC";
				PreparedStatement ps=conn.prepareStatement(sql);
				
				ResultSet rs=ps.executeQuery();
			
				while(rs.next() )
				{
					p=new petfoundDtls();
					p.setId(rs.getInt(1));
					p.setAnimal_type(rs.getString(2));
					p.setGender(rs.getString(3));
					p.setBreed(rs.getString(4));
					p.setFound_on(rs.getDate(5));
					p.setPhoto_url(rs.getString(6));
					p.setLocation(rs.getString(7));
					p.setContact(rs.getString(8));
					p.setEmail(rs.getString(9));
					list.add(p);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
				
			}
			
			return list;
		}
		
		public petfoundDtls getPetFoundById(int id) {
			
			petfoundDtls p=null;
			try {
				String sql="select * from petfound where id=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, id);
				
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
				p= new petfoundDtls();
				p.setId(rs.getInt(1));
				p.setAnimal_type(rs.getString(2));
				p.setGender(rs.getString(3));
				p.setBreed(rs.getString(4));
				p.setFound_on(rs.getDate(5));
				p.setPhoto_url(rs.getString(6));
				p.setLocation(rs.getString(7));
				p.setContact(rs.getString(8));
				p.setEmail(rs.getString(9));
				}
				
			}catch(Exception e){
				e.printStackTrace();
			}
			return p;
			
		}
		public List<petfoundDtls> getPetFoundByEmail(String email) {
			List<petfoundDtls> list=new ArrayList<petfoundDtls>();
			petfoundDtls p=null;
				try {
					 String sql = "SELECT * FROM petfound WHERE email = ? ";
					PreparedStatement ps=conn.prepareStatement(sql);
					ps.setString(1, email);
					ResultSet rs=ps.executeQuery();
					
					while(rs.next())
					{
						p=new petfoundDtls();
						p.setId(rs.getInt(1));
						p.setAnimal_type(rs.getString(2));
						p.setGender(rs.getString(3));
						p.setBreed(rs.getString(4));
						p.setFound_on(rs.getDate(5));
						p.setPhoto_url(rs.getString(6));

						p.setLocation(rs.getString(7));
						p.setContact(rs.getString(8));
	
						p.setEmail(rs.getString(9));
						list.add(p);
						
					}
					
				}catch(Exception e) {
					
					e.printStackTrace();
					
				}
			return list;
		}
		
		
		 public boolean deleteFoundPet(String email, int id) {
			 boolean f=false;
			 try {
				String sql="delete from petfound where email=? and id=?";
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
