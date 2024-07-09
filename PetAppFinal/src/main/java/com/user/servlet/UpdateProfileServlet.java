package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.Db.DBConnect;
import com.entity.user;

/**
 * Servlet implementation class UpdateProfileServlet
 */
@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phonenr=req.getParameter("phonenr");
			String password=req.getParameter("password");
			String city=req.getParameter("city");
			String animal_type_filter=req.getParameter("animal_type_filter");
			String gender_filter=req.getParameter("gender_filter");
			String care_filter=req.getParameter("care_filter");
			String age_filter=req.getParameter("age_filter");
            user us=new user();
            us.setUser_id(id);
            us.setName(name);
            us.setEmail(email);
            us.setPhonenr(phonenr);
            us.setCity(city);
            us.setAnimal_type_filter(animal_type_filter);
            us.setGender_filter(gender_filter);
            us.setCare_filter(care_filter);
            us.setAge_filter(age_filter);
            
            HttpSession session=req.getSession();
			userDAOImpl dao=new userDAOImpl(DBConnect.getConn());
			
			dao.checkPassword(id, password);
			boolean f=dao.checkPassword(id, password);
			
			if(f) {
				boolean f2=dao.updateProfile(us);
				if(f2) {
					 session.setAttribute("userobj", us);
					session.setAttribute("succMsg", "profil actualizat cu succes");
					 resp.sendRedirect("setting.jsp");
				}else {
					session.setAttribute("failedMsg", "Something wrong on server");
					 resp.sendRedirect("setting.jsp");
				}
			}else {
				session.setAttribute("failedMsg", "Parolă incorectă");
				 resp.sendRedirect("setting.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}

