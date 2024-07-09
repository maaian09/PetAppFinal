package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.petforadoptionDtls;

public class PetsDAOImpl implements PetsDAO {
	private Connection conn;

	public PetsDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addPets(petforadoptionDtls p) {
		boolean f = false;
		try {
			String sql = "insert into petforadoption(name, animal_type, gender, breed, age, description, photo_url, location, email, special_care, status) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, p.getName());
			ps.setString(2, p.getAnimal_type());
			ps.setString(3, p.getGender());
			ps.setString(4, p.getBreed());
			ps.setString(5, p.getAge());
			ps.setString(6, p.getDescription());
			ps.setString(7, p.getPhoto_url());
			ps.setString(8, p.getLocation());
			ps.setString(9, p.getEmail());
			ps.setString(10, p.getSpecial_care());
			ps.setString(11, p.getStatus());
			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<petforadoptionDtls> getPetsForAdoption() {
		List<petforadoptionDtls> list = new ArrayList<petforadoptionDtls>();
		petforadoptionDtls p = null;
		try {
			String sql = "select * from petforadoption";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

	public boolean deletePets(int id) {
		boolean f = false;

		try {
			String sql = "delete from petforadoption where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<petforadoptionDtls> getPetsForAdoption2() {
		List<petforadoptionDtls> list = new ArrayList<petforadoptionDtls>();
		petforadoptionDtls p = null;
		try {
			String sql = "select * from petforadoption order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);
				i++;
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

	public List<petforadoptionDtls> getAllPetsForAdoption() {
		List<petforadoptionDtls> list = new ArrayList<petforadoptionDtls>();
		petforadoptionDtls p = null;
		try {
			String sql = "select * from petforadoption order by id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);
			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

	public petforadoptionDtls getPetById(int id) {

		petforadoptionDtls p = null;
		try {
			String sql = "select * from petforadoption where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;

	}

	public List<petforadoptionDtls> getPetsForAdoption(String email) {
		List<petforadoptionDtls> list = new ArrayList<petforadoptionDtls>();
		petforadoptionDtls p = null;
		try {
			String sql = "select * from petforadoption where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean deletePet(String email, int id) {
		boolean f = false;
		try {
			String sql = "delete from petforadoption where email=? and id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setInt(2, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public List<petforadoptionDtls> getPetByFilter(String animal_type, String gender, String location,
		String special_care, String age_filter) {
		List<petforadoptionDtls> list = new ArrayList<petforadoptionDtls>();petforadoptionDtls p = null;
		try {StringBuilder sql = new StringBuilder(
					"SELECT * FROM petforadoption WHERE animal_type LIKE ? AND gender LIKE ? AND location LIKE ?");
			if ("nu".equals(special_care)) {
				sql.append(" AND special_care = 'nu'");
			}if (age_filter != null && !age_filter.isEmpty() && !"any".equals(age_filter)) {
				if ("7+".equals(age_filter)) {
					sql.append(" AND CAST(age AS UNSIGNED) >= 7");} else {
					String[] ageRange = age_filter.split("-");
					sql.append(" AND CAST(age AS UNSIGNED) BETWEEN ? AND ?");
				}}PreparedStatement ps = conn.prepareStatement(sql.toString());
			ps.setString(1, "%" + animal_type + "%");
			ps.setString(2, "%" + gender + "%");
			ps.setString(3, "%" + location + "%");
			if (age_filter != null && !age_filter.isEmpty() && !"any".equals(age_filter)) {if (!"7+".equals(age_filter)) {
					String[] ageRange = age_filter.split("-");
					ps.setInt(4, Integer.parseInt(ageRange[0]));
					ps.setInt(5, Integer.parseInt(ageRange[1]));
				}}ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);}} catch (Exception e) {
			e.printStackTrace();}return list;}

	public List<petforadoptionDtls> getAvailablePets() {
		List<petforadoptionDtls> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM petforadoption  WHERE status='Available' ORDER BY id DESC ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				petforadoptionDtls p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<petforadoptionDtls> getAvailablePets2() {
		List<petforadoptionDtls> list = new ArrayList<>();
		try {
			String sql = "SELECT * FROM petforadoption WHERE status='Available' ORDER BY id DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				petforadoptionDtls p = new petforadoptionDtls();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAnimal_type(rs.getString(3));
				p.setGender(rs.getString(4));
				p.setBreed(rs.getString(5));
				p.setAge(rs.getString(6));
				p.setDescription(rs.getString(7));
				p.setPhoto_url(rs.getString(8));
				p.setLocation(rs.getString(9));
				p.setEmail(rs.getString(10));
				p.setSpecial_care(rs.getString(11));
				p.setStatus(rs.getString(12));
				list.add(p);

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public boolean updatePetStatus(String name) {
		boolean f = false;
		try {
			String sql = "UPDATE petforadoption SET status=? WHERE name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "adoptat");
			ps.setString(2, name);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
