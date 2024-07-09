package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import com.DAO.PetsDAOImpl;
import com.entity.petforadoptionDtls;
import com.entity.user;
import com.Db.DBConnect;

@WebServlet("/FilterServlet")
public class FilterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int user_id = Integer.parseInt(request.getParameter("user_id"));
        String animal_type_filter = request.getParameter("animal_type_filter");
        String gender_filter = request.getParameter("gender_filter");
        String location = request.getParameter("location");
        String care_filter=request.getParameter("care_filter");
        String age_filter=request.getParameter("age_filter");
        PetsDAOImpl dao = new PetsDAOImpl(DBConnect.getConn());
        List<petforadoptionDtls> p = dao.getPetByFilter(animal_type_filter, gender_filter, location, care_filter, age_filter);
        user us=new user();
        HttpSession session = request.getSession();
        session.setAttribute("filteredPets", p);
        session.setAttribute("age_filter", age_filter);
        session.setAttribute("user_id", user_id);
        session.setAttribute("animal_type_filter", animal_type_filter);
        session.setAttribute("gender_filter", gender_filter);
        session.setAttribute("location", location);
        session.setAttribute("care_filter", care_filter);
        session.setAttribute("age_filter", age_filter);
        response.sendRedirect("FILTER2.jsp");
    }

   
}

