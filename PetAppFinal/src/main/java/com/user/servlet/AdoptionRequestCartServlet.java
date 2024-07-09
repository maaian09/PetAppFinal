package com.user.servlet;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.PetsDAOImpl;
import com.DAO.RequestCartDAOImpl;
import com.Db.DBConnect;
import com.entity.adoptionRequestCart;
import com.entity.petforadoptionDtls;

@WebServlet("/AdoptionRequestCartServlet")
public class AdoptionRequestCartServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int pet_id=Integer.parseInt(req.getParameter("pet_id"));
			int user_id=Integer.parseInt(req.getParameter("user_id"));
			PetsDAOImpl dao=new PetsDAOImpl(DBConnect.getConn());
			petforadoptionDtls p =dao.getPetById(pet_id);
			adoptionRequestCart r=new adoptionRequestCart();
			r.setPet_id(pet_id);
			r.setUser_id(user_id);
			r.setPet_name(p.getName());
			r.setOwner_email(p.getEmail());
			HttpSession session=req.getSession();
			RequestCartDAOImpl dao2=new RequestCartDAOImpl(DBConnect.getConn());
			boolean f=dao2.addAdoptionRequestCart(r);	
			if(f) {
				session.setAttribute("addAdoptionRequest", "Added to requests cart");
				resp.sendRedirect("all_pets_for_adoption.jsp");	
			}else {
				session.setAttribute("failed", "Something wrong on server");
				resp.sendRedirect("all_pets_for_adoption.jsp");
			}} catch (Exception e) {
			e.printStackTrace();}}}