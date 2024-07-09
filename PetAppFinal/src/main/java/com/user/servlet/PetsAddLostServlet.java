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
import com.DAO.PetsLostDAOImpl;
import com.Db.DBConnect;
import com.entity.petlostDtls;

@WebServlet("/PetsAddLostServlet")
@MultipartConfig
public class PetsAddLostServlet extends HttpServlet {

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
			String contact = req.getParameter("contact");
			String lostOnString = req.getParameter("lost_on");
			java.sql.Date lostOnDate = null;
			try {
			    LocalDate localDate = LocalDate.parse(lostOnString); 
			    lostOnDate = Date.valueOf(localDate); 
			} catch (DateTimeParseException e) {
			    e.printStackTrace(); 
			}
			Part photo=req.getPart("photo_url");
            String fileName=photo.getSubmittedFileName();
            String location=req.getParameter("location");
            
            
            petlostDtls p = new petlostDtls(name, animal_type, gender, breed, contact, lostOnDate, fileName, location,email);
            
           
            
            PetsLostDAOImpl dao=new PetsLostDAOImpl(DBConnect.getConn());
            
            boolean f=dao.addPetsLost(p);
           
            
            if(f) {
            	session.setAttribute("succMsg", "Animal postat cu succes");
                resp.sendRedirect("user/adaugaAnuntPierdute.jsp");
                
            
            }else {
            	session.setAttribute("failedMsg", "Something Wrong on Server");
                resp.sendRedirect("user/adaugaAnuntPierdute.jsp");
                
            }
			
			
			
			
			
		}catch(Exception e ) {
			e.printStackTrace();
		}
	}
	
	
}