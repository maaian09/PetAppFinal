package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PetsDAOImpl;
import com.DAO.RequestOrderDAOImpl;
import com.Db.DBConnect;

import util.EmailUtil;

@WebServlet("/AcceptServlet")
public class AcceptServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String request_id = req.getParameter("request_id");
			String email = req.getParameter("email");
			String pet_name = req.getParameter("pet_name");
			String owner_email = req.getParameter("owner_email");
			String host = "smtp.office365.com";
			String user = "furreverhome01@outlook.com";
			String port = "587";
			String password = "cajepgnifeftnnpw";
			String subject = ("Cerere Aprobată");
			String message = "Felicitări! Cererea ta de adopție pentru " + pet_name + " a fost aprobată. "
					+ "Suntem încântați să-l primim pe " + pet_name + " în familia ta.\n\n"
					+ "Pentru mai multe detalii și pentru a stabili detaliile adopției, te rugăm să contactezi stăpânul anterior la: "
					+ owner_email + ".\n\n" + "Cu stimă,\nEchipa FurreverHome";
			String to = req.getParameter(email);
			RequestOrderDAOImpl dao = new RequestOrderDAOImpl(DBConnect.getConn());

			PetsDAOImpl petsDao = new PetsDAOImpl(DBConnect.getConn());
			boolean isUpdated = dao.updateRequestStatus(request_id, email);
			EmailUtil.sendEmail(host, port, user, password, email, subject, message);
			if (isUpdated) {
				petsDao.updatePetStatus(pet_name);
				dao.denyOtherRequests(request_id, pet_name);
				resp.sendRedirect("my_applications.jsp?status=requestAccepted");
			} else {
				resp.sendRedirect("my_applications.jsp?status=updateError");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resp.sendRedirect("my_requests.jsp?status=error");
		}
	}
}
