<%@page import="com.entity.Request_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.RequestOrderDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Complex Table</title>
    <%@include file="all_component/allCSS.jsp"%>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        /* General styles */
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #343a40;
            padding-top: 50px;
        }

        .sidebar a {
            text-decoration: none;
            color: white;
            display: block;
            padding: 15px;
            transition: background-color 0.3s;
        }

        .sidebar a:hover {
            background-color: #007bff;
        }

        .sidebar .card {
            border: none;
            border-radius: 0;
            margin-bottom: 0;
            box-shadow: none;
            background-color: #343a40;
        }

        .sidebar .card-body {
            padding: 0;
            text-align: left;
        }

        .sidebar .text-primary,
        .sidebar .text-warning {
            color: white !important;
        }

        .container {
            margin-left: 270px;
            padding: 30px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
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
            background-color: #ffc107;
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
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
    <%@include file="all_component/navbar.jsp"%>
   <div class="sidebar">
		<h3 class="text-center text-white">Bună, ${userobj.name}</h3>
		<a href="my_requests.jsp">
			<div class="card">
				<div class="card-body">
					<i class="fa-solid fa-box-archive"></i> <span>Cererile mele
						de adopție</span>
				</div>
			</div>
		</a> <a href="my_pets_for_adoption.jsp">
			<div class="card">
				<div class="card-body">
					<i class="fa-solid fa-dog"></i> <span>Anunțuri adopție
						postate</span>
				</div>
			</div>
		</a> <a href="my_applications.jsp">
			<div class="card">
				<div class="card-body">
					<i class="fa-solid fa-cat"></i> <span>Aplicări</span>
				</div>
			</div>
		</a> <a href="my_lost_pets.jsp">
			<div class="card">
				<div class="card-body">
					<i class="fa-solid fa-person-circle-question"></i> <span>Animalele
						mele pierdute</span>
				</div>
			</div>
		</a> <a href="my_found_pets.jsp">
			<div class="card">
				<div class="card-body">
					<i class="fa-solid fa-person-circle-exclamation"></i> <span>Animale
						găsite de mine</span>
				</div>
			</div>
		</a>

	</div>
    <div class="container">
        <h2 style="text-align: center; margin-bottom: 20px;">Cererile tale de adoptie</h2>
        <table>
            <thead>
                <tr>
                    <th scope="col">Request ID</th>
                    <th scope="col">Nume</th>
                    <th scope="col">Nume animal</th>
                    <th scope="col">Email Stăpân</th>
                    <th scope="col">Status</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                user u = (user) session.getAttribute("userobj");
                RequestOrderDAOImpl dao = new RequestOrderDAOImpl(DBConnect.getConn());
                List<Request_Order> rlist = dao.getPet(u.getEmail());
                for (Request_Order o : rlist) {
                %>
                <tr>
                    <th scope="row"><%=o.getRequest_id() %></th>
                    <td><%=o.getUserName() %></td>
                    <td><%=o.getPet_name() %></td>
                    <td><%=o.getOwner_email() %></td>
                    <td><%=o.getStatus() %></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>

