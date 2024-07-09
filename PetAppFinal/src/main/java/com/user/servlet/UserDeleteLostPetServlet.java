package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetsDAOImpl;
import com.DAO.PetsLostDAOImpl;
import com.Db.DBConnect;

/**
 * Servlet implementation class UserDeleteLostPetServlet
 */
@WebServlet("/UserDeleteLostPetServlet")
public class UserDeleteLostPetServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			int id=Integer.parseInt(req.getParameter("id"));
			PetsLostDAOImpl dao=new PetsLostDAOImpl(DBConnect.getConn());
			boolean f=dao.deleteLostPet(email, id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Ai șters animalul de pe site");
				resp.sendRedirect("my_lost_pets.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("my_lost_pets.jsp");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
