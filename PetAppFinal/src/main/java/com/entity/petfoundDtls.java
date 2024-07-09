package com.entity;

import java.sql.Date;

public class petfoundDtls {
	private int id;
	private String animal_type;
	private String gender;
	private String breed;
	private Date found_on;
	private String photo_url;
	private String location;
	private String contact;
	private String email;
	public petfoundDtls() {
		super();
		// TODO Auto-generated constructor stub
	}
	public petfoundDtls(String animal_type, String gender, String breed, Date found_on, String photo_url,
			String location, String contact, String email) {
		super();
		this.animal_type = animal_type;
		this.gender = gender;
		this.breed = breed;
		this.found_on = found_on;
		this.photo_url = photo_url;
		this.location = location;
		this.contact = contact;
		this.email=email;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnimal_type() {
		return animal_type;
	}
	public void setAnimal_type(String animal_type) {
		this.animal_type = animal_type;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public Date getFound_on() {
		return found_on;
	}
	public void setFound_on(Date found_on) {
		this.found_on = found_on;
	}
	public String getPhoto_url() {
		return photo_url;
	}
	public void setPhoto_url(String photo_url) {
		this.photo_url = photo_url;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	
	

}
