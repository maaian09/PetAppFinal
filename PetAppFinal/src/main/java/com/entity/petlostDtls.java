package com.entity;

import java.sql.Date;

public class petlostDtls {
private int id;
private String name;
private String animal_type;
private String gender;
private String breed;
private String contact;
private Date lost_on;
private String location;
private String photo_url;
private String email;
public petlostDtls() {
	super();
	// TODO Auto-generated constructor stub
}
public petlostDtls(String name, String animal_type, String gender, String breed, String contact, Date lost_on, String photo_url,
		String location, String email) {
	super();
	this.name = name;
	this.animal_type = animal_type;
	this.gender = gender;
	this.breed = breed;
	this.contact = contact;
	this.lost_on = lost_on;
	this.photo_url= photo_url;
	this.location = location;
	this.email=email;
	
}
@Override
public String toString() {
	return "petlostDtls [id=" + id + ", name=" + name + ", animal_type=" + animal_type + ", gender="
			+ gender + ", breed=" + breed + ", contact=" + contact + ", lost_on=" + lost_on + ", photo_url="
			+ photo_url + ", location=" + location + "]";
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
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
public String getContact() {
	return contact;
}
public void setContact(String contact) {
	this.contact = contact;
}
public Date getLost_on() {
	return lost_on;
}
public void setLost_on(Date lost_on) {
	this.lost_on = lost_on;
}
public String getLocation() {
	return location;
}
public void setLocation(String location) {
	this.location = location;
}
public String getPhoto_url() {
	return photo_url;
}
public void setPhoto_url(String photo_url) {
	this.photo_url = photo_url;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}


}

