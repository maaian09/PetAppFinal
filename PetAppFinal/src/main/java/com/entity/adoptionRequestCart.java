package com.entity;

public class adoptionRequestCart {
       private int id_adoption_request;
       private int pet_id;
       private int user_id;
       private String pet_name;
       private String owner_email;
       private String description;
	public adoptionRequestCart() {
		super();
		
	}
	public int getId_adoption_request() {
		return id_adoption_request;
	}
	public void setId_adoption_request(int id_adoption_request) {
		this.id_adoption_request = id_adoption_request;
	}
	public int getPet_id() {
		return pet_id;
	}
	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public adoptionRequestCart(int pet_id, int user_id,  String pet_name, String owner_email,
			String description) {
		super();
		this.pet_id = pet_id;
		this.user_id = user_id;
		
		this.pet_name = pet_name;
		this.owner_email = owner_email;
		this.description = description;
	}

}
