package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.*;
import com.Db.DBConnect;
import com.entity.user;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
			HttpSession session = req.getSession();
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				user us = new user();
				us.setName("Admin");
				session.setAttribute("userobj", us);
				resp.sendRedirect("admin/home.jsp");
			} else {
				user us = dao.login(email, password);
				if (us != null) {
					session.setAttribute("userobj", us);
					session.setAttribute("userEmail", us.getEmail());
					resp.sendRedirect("mainpage.jsp");
				} else {
					session.setAttribute("failedMsg", "Email & Parolă invalide");
					resp.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
}
