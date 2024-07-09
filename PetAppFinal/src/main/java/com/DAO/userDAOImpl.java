package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.*;

public class userDAOImpl implements userDAO {
	private Connection conn;

	public userDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(user us) {
		boolean f = false;
		try {
			String sql = "insert into user(name,email,phonenr,password,city, animal_type_filter,gender_filter, care_filter, age_filter) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhonenr());
			ps.setString(4, us.getPassword());
			ps.setString(5, us.getCity());
			ps.setString(6, us.getAnimal_type_filter());
			ps.setString(7, us.getGender_filter());
			ps.setString(8, us.getCare_filter());
			ps.setString(9, us.getAge_filter());
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public user login(String email, String password) {
		user us = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				us = new user();
				us.setUser_id(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhonenr(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setCity(rs.getString(6));
				us.setAnimal_type_filter(rs.getString(7));
				us.setGender_filter(rs.getString(8));
				us.setCare_filter(rs.getString(9));
				us.setAge_filter(rs.getString(10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	public boolean checkPassword(int id, String password) {
		boolean f = false;
		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				f = true;

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean updateProfile(user us) {
		boolean f = false;
		try {
			String sql = "UPDATE user SET name=?, email=?, phonenr=?, city=?, animal_type_filter=?, gender_filter=?, care_filter=?, age_filter=?  WHERE id=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhonenr());
			ps.setString(4, us.getCity());
			ps.setString(5, us.getAnimal_type_filter());
			ps.setString(6, us.getGender_filter());
			ps.setString(7, us.getCare_filter());
			ps.setString(8, us.getAge_filter());
			ps.setInt(9, us.getUser_id());
			
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean checkUser(String email) {
		boolean f = true;

		try {
			String sql = "Select * from user where email=? ";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public user getUserById(int userId) {
		user us = null;
		try {
			String sql = "SELECT * FROM user WHERE user_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				us = new user();
				us.setUser_id(rs.getInt("user_id"));
				us.setName(rs.getString("name"));
				us.setEmail(rs.getString("email"));
				us.setPhonenr(rs.getString("phonenr"));
				us.setPassword(rs.getString("password"));
				us.setCity(rs.getString("city"));
				us.setAnimal_type_filter(rs.getString("animal_type_filter"));
				us.setGender_filter(rs.getString("gender_filter"));
				us.setCare_filter(rs.getString("care_filter"));
				us.setAge_filter(rs.getString("age_filter"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

}