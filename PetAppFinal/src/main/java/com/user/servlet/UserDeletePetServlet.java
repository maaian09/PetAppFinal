package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.tagext.TryCatchFinally;

import com.DAO.PetsDAOImpl;
import com.Db.DBConnect;

/**
 * Servlet implementation class UserDeletePetServlet
 */
@WebServlet("/UserDeletePetServlet")
public class UserDeletePetServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String email=req.getParameter("email");
			int id=Integer.parseInt(req.getParameter("id"));
			PetsDAOImpl dao=new PetsDAOImpl(DBConnect.getConn());
			boolean f=dao.deletePet(email, id);
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("succMsg", "Ai șters animalul de pe site");
				resp.sendRedirect("my_pets_for_adoption.jsp");
			}else {
				session.setAttribute("failedMsg", "Something wrong on server");
				resp.sendRedirect("my_pets_for_adoption.jsp");
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
