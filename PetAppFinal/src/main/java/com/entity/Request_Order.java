package com.entity;

public class Request_Order {

   private int id; 
   private String request_id;
   private String userName;
   private String email;
   private String phonenr;
   private String city;
   private String description;
   private String pet_name;
   private String owner_email;
   private String status;
public Request_Order() {
	super();
	// TODO Auto-generated constructor stub
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhonenr() {
	return phonenr;
}
public void setPhonenr(String phonenr) {
	this.phonenr = phonenr;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}
@Override
public String toString() {
	// TODO Auto-generated method stub
	return super.toString();
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getRequest_id() {
	return request_id;
}
public void setRequest_id(String request_id) {
	this.request_id = request_id;
}
public String getPet_name() {
	return pet_name;
}
public void setPet_name(String pet_name) {
	this.pet_name = pet_name;
}
public String getOwner_email() {
	return owner_email;
}
public void setOwner_email(String owner_email) {
	this.owner_email = owner_email;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
   
}
