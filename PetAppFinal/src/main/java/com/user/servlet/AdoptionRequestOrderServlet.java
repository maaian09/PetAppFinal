package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.RequestCartDAOImpl;
import com.DAO.RequestOrderDAOImpl;
import com.Db.DBConnect;
import com.entity.Request_Order;
import com.entity.adoptionRequestCart;
import com.entity.petforadoptionDtls;

@WebServlet("/AdoptionRequestOrderServlet")
public class AdoptionRequestOrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			HttpSession session = req.getSession();
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("username");
			String email = req.getParameter("email");
			String phonenr = req.getParameter("phonenr");
			String city = req.getParameter("city");
			String description = req.getParameter("description");
            String status="Trimis";
			RequestCartDAOImpl dao = new RequestCartDAOImpl(DBConnect.getConn());
			List<adoptionRequestCart> plist = dao.getPetByUser(id);
			if (plist.isEmpty()) {
				req.getSession().setAttribute("failedMsg", "Adaugă animale");
				resp.sendRedirect("requestscart.jsp");
			} else {
				RequestOrderDAOImpl dao2 = new RequestOrderDAOImpl(DBConnect.getConn());
				Request_Order o = null;
				ArrayList<Request_Order> requestorderlist = new ArrayList<Request_Order>();
				Random random = new Random();
				for (adoptionRequestCart c : plist) {
					o = new Request_Order();
					o.setRequest_id("RQST-ORD-00" + random.nextInt(1000));
					o.setUserName(name);
					o.setEmail(email);
					o.setPhonenr(phonenr);
					o.setCity(city);
					o.setDescription(description);
					o.setPet_name(c.getPet_name());
					o.setOwner_email(c.getOwner_email());
					o.setStatus(status);
					requestorderlist.add(o);
				}
				if (description == null || description.isEmpty()) {
					req.getSession().setAttribute("failedMsg", "Furnizează o descriere");
					resp.sendRedirect("requestscart.jsp");
				} else {
					boolean f = dao2.saveRequestOrder(requestorderlist);
					if (f) {
						boolean cleared = dao.clearCartByUser(id);
						resp.sendRedirect("request_succesful.jsp");
						if (cleared) {
							System.out.println("Coșul a fost golit cu succes pentru utilizatorul cu ID-ul" + id);
							resp.sendRedirect("request_successful.jsp");
						} else {
							session.setAttribute("failedMsg", "Cereri salvate dar eroare golire coș ");
							resp.sendRedirect("requestscart.jsp");
						}
					} else {
						session.setAttribute("failedMsg", "Cereri eșuate");
						resp.sendRedirect("requestscart.jsp");
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}}
