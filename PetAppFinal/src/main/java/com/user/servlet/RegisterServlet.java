package com.user.servlet;

import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.userDAOImpl;
import com.Db.DBConnect;
import com.entity.user;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet { 
    private static final String PASSWORD_PATTERN = 
        "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";// regex pt validarea parolei
    private static final Pattern pattern = Pattern.compile(PASSWORD_PATTERN);
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phonenr = req.getParameter("phonenr");
            String password = req.getParameter("password");
            String city = req.getParameter("city");
            String animal_type_filter = req.getParameter("animal_type_filter");
            String gender_filter = req.getParameter("gender_filter");
            String care_filter = req.getParameter("care_filter");
            String age_filter = req.getParameter("age_filter");
            String check = req.getParameter("check");
            user us = new user();
            us.setName(name);
            us.setEmail(email);
            us.setPhonenr(phonenr);
            us.setPassword(password);
            us.setCity(city);
            us.setAnimal_type_filter(animal_type_filter);
            us.setGender_filter(gender_filter);
            us.setCare_filter(care_filter);
            us.setAge_filter(age_filter);
            HttpSession session = req.getSession();
            if (check != null) {
                if (!validatePassword(password)) {
                    session.setAttribute("failedMsg", "Parola trebuie să conțină cel puțin 8 caractere și cel puțin o majusculă, o literă mică, o cifră și un caracter special.");
                    resp.sendRedirect("register.jsp");
                    return;
                }
                userDAOImpl dao = new userDAOImpl(DBConnect.getConn());
                boolean f2 = dao.checkUser(email);
                if (f2) {
                    boolean f = dao.userRegister(us);
                    if (f) {
                        session.setAttribute("sccMsg", "Te-ai înregistrat cu succes");
                        resp.sendRedirect("register.jsp");
                    } else {
                        session.setAttribute("failedMsg", "Something went wrong");
                        resp.sendRedirect("register.jsp");
                    }
                } else {
                    session.setAttribute("failedMsg", "Utilizatorul deja există. Încercați altă adresă email");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                session.setAttribute("checkedMsg", "Vă rugăm acceptați termenii");
                resp.sendRedirect("register.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }    // validarea parolei
    private boolean validatePassword(String password) {
        Matcher matcher = pattern.matcher(password);
        return matcher.matches();
    }
}
