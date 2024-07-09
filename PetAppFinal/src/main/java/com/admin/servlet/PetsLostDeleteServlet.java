package com.admin.servlet;
import com.DAO.PetsLostDAOImpl;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetsDAOImpl;
import com.Db.DBConnect;


@WebServlet("/PetsLostDeleteServlet")
public class PetsLostDeleteServlet extends HttpServlet {
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	    	int id=Integer.parseInt(req.getParameter("id"));
	    	
	    	
	    	PetsLostDAOImpl dao=new PetsLostDAOImpl(DBConnect.getConn());
	    	boolean f=dao.deleteLostPets(id);
	    	HttpSession session=req.getSession();
	    	
	    	if(f) {
	    		session.setAttribute("succMsg", "Anunț șters");
	    		resp.sendRedirect("admin/pierdute.jsp");
	    	}else {
	    		session.setAttribute("failedMsg", "Something went wrong on server");
	    		resp.sendRedirect("admin/pierdute.jsp");
	    	}
	    	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
