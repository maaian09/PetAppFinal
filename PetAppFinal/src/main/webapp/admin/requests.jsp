<%@ page import="com.entity.Request_Order"%>
<%@ page import="java.util.List"%>
<%@ page import="com.entity.user"%>
<%@ page import="com.Db.DBConnect"%>
<%@ page import="com.DAO.RequestOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complex Table</title>
    <%@ include file="allCSS.jsp" %>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        
        /* Container styles */
        .container {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        
        /* Table styles */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 16px;
        }
        
        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #ffa500;
            color: #fff;
            font-weight: bold;
            text-transform: uppercase;
        }
        
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        
        tr:hover {
            background-color: #ffdab9;
        }
    </style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp" />
    </c:if>

    <%@ include file="navbar.jsp" %>

    <div class="container">
        <h2 style="text-align: center; margin-bottom: 20px;">Cereri de adopție înregistrare</h2>
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nume</th>
                    <th scope="col">Oraș</th>
                    <th scope="col">Descriere</th>
                    <th scope="col">Nume animal</th>
                    <th scope="col">Email Stăpân</th>
                    <th scope="col">Status</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    user u = (user) session.getAttribute("userobj");
                    RequestOrderDAOImpl dao = new RequestOrderDAOImpl(DBConnect.getConn());
                    List<Request_Order> rlist = dao.getAllRequest();
                    for (Request_Order r : rlist) {
                %>
                    <tr>
                        <th scope="row"><%= r.getRequest_id() %></th>
                        <td><%= r.getUserName() %></td>
                        <td><%= r.getCity() %></td>
                        <td><%= r.getDescription() %></td>
                        <td><%= r.getPet_name() %></td>
                        <td><%= r.getOwner_email() %></td>
                        <td><%= r.getStatus() %></td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
