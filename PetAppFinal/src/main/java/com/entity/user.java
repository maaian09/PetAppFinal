package com.entity;
public class user {

	private int user_id;
	private String name;
	private String email;
	private String password;
	private String phonenr;
	private String city;
	private String animal_type_filter;
	private String gender_filter;
	private String description;
	private String care_filter;
	private String age_filter;
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
    public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
    public String getPhonenr() {
		return phonenr;
	}
    public void setPhonenr(String phonenr) {
		this.phonenr = phonenr;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCity() {
		return city;
	}
	public String getAnimal_type_filter() {
		return animal_type_filter;
	}
	public void setAnimal_type_filter(String animal_type_filter) {
		this.animal_type_filter = animal_type_filter;
	}
	public String getGender_filter() {
		return gender_filter;
	}
	public void setGender_filter(String gender_filter) {
		this.gender_filter = gender_filter;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCare_filter() {
		return care_filter;
	}
	public void setCare_filter(String care_filter) {
		this.care_filter = care_filter;
	}
	public String getAge_filter() {
		return age_filter;
	}
	public void setAge_filter(String age_filter) {
		this.age_filter = age_filter;
	}
}