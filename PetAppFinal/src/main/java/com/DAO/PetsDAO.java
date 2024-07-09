package com.DAO;

import java.util.ArrayList;
import java.util.List;

import com.entity.petforadoptionDtls;

public interface PetsDAO {
	public boolean addPets(petforadoptionDtls p);

	public List<petforadoptionDtls> getPetsForAdoption();

	public boolean deletePets(int id);

	public List<petforadoptionDtls> getPetsForAdoption2();

	public List<petforadoptionDtls> getAllPetsForAdoption();

	public petforadoptionDtls getPetById(int id);

	public List<petforadoptionDtls> getPetsForAdoption(String email);

	public boolean deletePet(String email, int id);

	public List<petforadoptionDtls> getPetByFilter(String animal_type, String gender, String location, String special_care,String age_filter);
}
