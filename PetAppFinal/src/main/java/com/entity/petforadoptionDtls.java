package com.entity;

public class petforadoptionDtls {
private int id;
private String name;
private String gender;
private String animal_type;
private String breed;
private String age;
private String description;
private String photo_url;
private String location;
private String email;
private String special_care;
private String status;

public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public petforadoptionDtls() {
	super();
	// TODO Auto-generated constructor stub
}
public petforadoptionDtls(String name, String animal_type, String gender,String breed, String age,  String description,
		String photo_url,  String location, String email, String special_care, String status) //
 {
	super();
	this.name = name;
	this.animal_type = animal_type;
	this.gender = gender;
	this.breed = breed;
	this.age = age;	
	this.description = description;
	this.photo_url = photo_url;
	this.location = location;
	this.email=email;
	this.special_care=special_care;	
	this.status="Available";

}
@Override
public String toString() {
	return "petforadoptionDtls [id=" + id + ", name=" + name + ", gender=" + gender + ", animal_type="
			+ animal_type + ", breed=" + breed + ", age=" + age + ", description=" + description + ", photo_url="
			+ photo_url + ", location=" + location + " , special_care=\" + special_care + \"]";
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id =id;
}


public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getGender() {
	return gender;
}
public void setGender(String gender) {
	this.gender = gender;
}
public String getAnimal_type() {
	return animal_type;
}
public void setAnimal_type(String animal_type) {
	this.animal_type = animal_type;
}
public String getBreed() {
	return breed;
}
public void setBreed(String breed) {
	this.breed = breed;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
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
public String getSpecial_care() {
	return special_care;
}
public void setSpecial_care(String special_care) {
	this.special_care = special_care;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}


}