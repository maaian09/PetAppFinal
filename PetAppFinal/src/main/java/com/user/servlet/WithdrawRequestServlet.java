package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.RequestCartDAOImpl;
import com.Db.DBConnect;

@WebServlet("/WithdrawRequestServlet")
public class WithdrawRequestServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int pet_id=Integer.parseInt(req.getParameter("pet_id"));
		int user_id=Integer.parseInt(req.getParameter("user_id"));
		RequestCartDAOImpl dao=new RequestCartDAOImpl(DBConnect.getConn());
		boolean f=dao.withdrawRequest(pet_id, user_id);
		HttpSession session=req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Ai retras animalul din listă");
			resp.sendRedirect("requestscart.jsp");
		}else {
			session.setAttribute("failedMsg", "Something wrong on server");
			resp.sendRedirect("requestscart.jsp");
		}
		
	}
	
}
