package com.DAO;

import java.sql.Connection;
import java.util.List;

import com.entity.Request_Order;

public interface RequestOrderDAO {
	/*public int getRequestOrderNo();*/
	
	public boolean saveRequestOrder(List<Request_Order> rlist);
	
	public List<Request_Order> getPet(String email);
	public List<Request_Order> getAllRequest();
	public List<Request_Order> getRequestForPostedPet(String owner_email);
	public boolean denyOtherRequests(String request_id, String pet_name);
	 public boolean updateRequestStatus(String request_id, String email);
	
}
