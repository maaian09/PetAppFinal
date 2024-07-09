package com.user.servlet;
import javax.*;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import com.DAO.PetsDAOImpl;
import com.Db.DBConnect;
import com.entity.petforadoptionDtls;

@WebServlet("/PetsAddAdoptionServlet")
@MultipartConfig
public class PetsAddAdoptionServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			HttpSession session = req.getSession();
            String email = (String) session.getAttribute("userEmail");
            if (email == null) {
                session.setAttribute("failedMsg", "User not logged in");
                resp.sendRedirect("login.jsp");
                return;
            }
			String name=req.getParameter("name");
			String animal_type=req.getParameter("animal_type");
			String gender=req.getParameter("gender");
			String breed=req.getParameter("breed");
			String age = req.getParameter("age");
            String description=req.getParameter("description");
			Part photo=req.getPart("photo_url");
            String fileName=photo.getSubmittedFileName();
            String location=req.getParameter("location");
            String special_care=req.getParameter("special_care");
            String status="available";
            petforadoptionDtls p = new petforadoptionDtls(name, animal_type, gender, breed, age, description, fileName, location, email,special_care, status); //
            
            PetsDAOImpl dao=new PetsDAOImpl(DBConnect.getConn());
            
            boolean f=dao.addPets(p);
           
            
            if(f) {
            	session.setAttribute("succMsg", "Animal postat cu succes");
                resp.sendRedirect("user/adaugaAnuntadoptie.jsp");
                
            
            }else {
            	session.setAttribute("failedMsg", "Something Wrong on Server");
                resp.sendRedirect("user/adaugaAnuntadoptie.jsp");
                
            }
			
			
			
			
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
}