package com.DAO;

import com.entity.adoptionRequestCart;


import java.util.List;

public interface RequestCartDAO {
	public boolean addAdoptionRequestCart(adoptionRequestCart r);
	
	public List<adoptionRequestCart> getPetByUser(int user_id);
	public adoptionRequestCart getRequestByUser(int user_id);
	public boolean withdrawRequest(int pet_id, int user_id);
	public List<adoptionRequestCart> getPetByEmail(String email);
	public List<adoptionRequestCart> getPetByUserAndPet(int user_id, int pet_id);
}
