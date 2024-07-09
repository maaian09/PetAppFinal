<%@page import="com.DAO.RequestCartDAOImpl"%>
<%@page import="com.entity.user"%>
<%@page import="com.entity.petforadoptionDtls"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pet Details</title>
    <%@include file="all_component/allCSS.jsp"%>
    <style>
        .pet-details {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            max-width: 900px;
            margin-left: auto;
            margin-right: auto;
        }
        
        .pet-image {
            text-align: center;
            margin-bottom: 20px;
        }
        
        .pet-info h4 {
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }
        
        .pet-info span {
            font-size: 14px;
            font-weight: normal;
            color: #666;
        }
        
        .pet-description h1 {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin-bottom: 10px;
            text-align: left;
        }
        
        .pet-description h4 {
            font-size: 14px;
            font-weight: normal;
            color: #666;
            text-align: left;
        }
        
        .pet-actions {
            margin-top: 10px;
            margin-bottom: 10px;
            text-align: center;
        }
        
        .pet-actions .btn {
            margin: 5px;
            font-size: 14px;
        }

        .pet-info, .pet-description {
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
    </style>
</head>
<body style="background-color: #f5f4f2;">
    <%
        user u = (user) session.getAttribute("userobj");
    %>
    <%@include file="all_component/navbar.jsp"%>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        PetsDAOImpl dao = new PetsDAOImpl(DBConnect.getConn());
        dao.getPetById(id);
        petforadoptionDtls p = dao.getPetById(id);
    %>
    
    <div class="container">
        <div class="pet-details">
            <div class="row">
                <div class="col-md-5 pet-image">
                    <img src="animals/<%=p.getPhoto_url()%>" class="img-fluid rounded" alt="Pet Image">
                </div>
                <div class="col-md-7">
                    <div class="pet-info">
                        <h4>Nume: <span><%=p.getName()%></span></h4>
                        <h4>Specie: <span><%=p.getAnimal_type()%></span></h4>
                        <h4>Gen: <span><%=p.getGender()%></span></h4>
                        <h4>Rasă: <span><%=p.getBreed()%></span></h4>
                        <h4>Vârstă: <span><%=p.getAge()%></span></h4>
                        <h4>Are nevoie speciale: <span><%=p.getSpecial_care()%></span></h4>
                        <div class="pet-actions">
                           <%
                                boolean petAlreadyInCart = false;
                                if (u != null) {
                                    RequestCartDAOImpl requestCartDAO = new RequestCartDAOImpl(DBConnect.getConn());
                                    petAlreadyInCart = requestCartDAO.isPetAlreadyInCart(u.getUser_id(), p.getId());
                                }
                                %>

                                <div class="row d-flex justify-content-center">
                                    <%
                                    if (u == null) {
                                    %>
                                    <a href="login.jsp" class="btn btn-info ml-1">Adaugă</a>
                                    <%
                                    } else {
                                    %>
                                    <%
                                    if (!petAlreadyInCart) {
                                    %>
                                    <a
                                        href="AdoptionRequestCartServlet?pet_id=<%=p.getId()%>&&user_id=<%=u.getUser_id()%>"
                                        class="btn btn-info ml-1">Adaugă</a>
                                    <%
                                    } else {
                                    %>
                                    <button class="btn btn-info ml-1" disabled>Adăugat</button>
                                    <%
                                    }
                                    %>
                                    <%
                                    }
                                    %>
                           
                        </div>
                    </div>
                    <div class="pet-description">
                        <h1><%=p.getName()%></h1>
                        <h4><%=p.getDescription()%></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
