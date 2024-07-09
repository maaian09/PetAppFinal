package com.DAO;


import java.util.List;

import com.entity.petfoundDtls;
import com.entity.petlostDtls;



public interface PetsFoundDAO {
	public boolean addPetsFound(petfoundDtls p);
	public List<petfoundDtls> getPetsFound();
	public boolean deleteFoundPets(int id);
	public List<petfoundDtls> getPetsFound2(); //ca sa aratam pe mainpage
	public List<petfoundDtls> getAllPetsFound();
	public petfoundDtls getPetFoundById(int id);
	public List<petfoundDtls> getPetFoundByEmail(String email);
	public boolean deleteFoundPet(String email, int id);
}
