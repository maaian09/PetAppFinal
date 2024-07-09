package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetsFoundDAOImpl;
import com.DAO.PetsLostDAOImpl;
import com.Db.DBConnect;

/**
 * Servlet implementation class PetsFoundDeleetServlet
 */
@WebServlet("/PetsFoundDeleteServlet")
public class PetsFoundDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	    	int id=Integer.parseInt(req.getParameter("id"));
	    	
	    	
	    	PetsFoundDAOImpl dao=new PetsFoundDAOImpl(DBConnect.getConn());
	    	boolean f=dao.deleteFoundPets(id);
	    	HttpSession session=req.getSession();
	    	
	    	if(f) {
	    		session.setAttribute("succMsg", "Anunț șters");
	    		resp.sendRedirect("admin/gasite.jsp");
	    	}else {
	    		session.setAttribute("failedMsg", "Somethong went wrong on server");
	    		resp.sendRedirect("admin/gasite.jsp");
	    	}
	    	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
