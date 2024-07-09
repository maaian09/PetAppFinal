package com.DAO;

import java.util.List;

import com.entity.petlostDtls;

public interface PetsLostDAO {
	public boolean addPetsLost(petlostDtls p);
	public List<petlostDtls> getPetsLost();
	public boolean deleteLostPets(int id);
	public List<petlostDtls> getPetsLost2(); //ca sa aratam pe mainpage
	public List<petlostDtls> getAllPetsLost(); //ca sa le aratam pe pg resp
	public petlostDtls getPetLostById(int id);
	public List<petlostDtls> getPetLostByEmail(String email);
	public List<petlostDtls> getPetsForLost(String email);
	public boolean deleteLostPet(String email, int id);
}
