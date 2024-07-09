package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PetsDAOImpl;
import com.Db.DBConnect;

@WebServlet("/delete")
public class PetsDeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    try {
	    	int id=Integer.parseInt(req.getParameter("id"));
	    	
	    	
	    	PetsDAOImpl dao=new PetsDAOImpl(DBConnect.getConn());
	    	boolean f=dao.deletePets(id);
	    	HttpSession session=req.getSession();
	    	
	    	if(f) {
	    		session.setAttribute("succMsg", "Animal șters");
	    		resp.sendRedirect("admin/spreadoptie.jsp");
	    	}else {
	    		session.setAttribute("failedMsg", "Somethong went wrong on server");
	    		resp.sendRedirect("admin/spreadoptie.jsp");
	    	}
	    	
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
