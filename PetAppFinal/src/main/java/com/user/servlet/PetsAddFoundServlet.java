package com.user.servlet;
import javax.*;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import com.DAO.PetsFoundDAOImpl;
import com.Db.DBConnect;
import com.entity.petfoundDtls;

@WebServlet("/PetsAddFoundServlet")
@MultipartConfig
public class PetsAddFoundServlet extends HttpServlet {

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
            
			String animal_type=req.getParameter("animal_type");
			String gender=req.getParameter("gender");
			String breed=req.getParameter("breed");
			String foundOnString = req.getParameter("found_on");
			java.sql.Date foundOnDate = null;
			try {
			    LocalDate localDate = LocalDate.parse(foundOnString); 
			    foundOnDate = Date.valueOf(localDate); 
			} catch (DateTimeParseException e) {
			    e.printStackTrace(); 
			}
			Part photo=req.getPart("photo_url");
            String fileName=photo.getSubmittedFileName();
            String location=req.getParameter("location");
			String contact = req.getParameter("contact");
			
			
            
            
            
            petfoundDtls p = new petfoundDtls(animal_type, gender, breed, foundOnDate,fileName, location, contact,email );
            
            
            PetsFoundDAOImpl dao=new PetsFoundDAOImpl(DBConnect.getConn());
            
            boolean f=dao.addPetsFound(p);
           
            
            if(f) {
            	session.setAttribute("succMsg", "Animal postat cu succes");
                resp.sendRedirect("user/adaugaAnuntGasit.jsp");
                
            
            }else {
            	session.setAttribute("failedMsg", "Something Wrong on Server");
                resp.sendRedirect("user/adaugaAnuntGasit.jsp");
                
            }
			
			
			
			
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
	
	
}