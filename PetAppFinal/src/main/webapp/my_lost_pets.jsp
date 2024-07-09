<%@page import="com.Db.DBConnect"%>
<%@page import="com.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.PetsLostDAOImpl"%>
<%@page import="com.entity.petlostDtls"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Found Pets</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<%@include file="all_component/allCSS.jsp"%>
<style>
body {
	background-color: #f5f4f2;
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
.profile-header {
	background-color: #ffa726;
	padding: 20px;
	border-radius: 8px;
	color: #fff;
	text-align: center;
	margin-bottom: 20px;
}

.profile-header h1 {
	margin: 0;
}

.profile-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.table th, .table td {
	vertical-align: middle;
}
 th {
            background-color: #ffc107;}
.btn-info {
	background-color: #ff8c00;
	border-color: #ff8c00;
}

.btn-info:hover {
	background-color: #ffae42;
	border-color: #ffae42;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
<div class="sidebar">
		<h3 class="text-center text-white">Buna, ${userobj.name}</h3>
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
	<c:if test="${not empty succMsg}">
	<div class="alert alert-succes text-center">${succMsg}</div>
    <c:remove var="succMsg" scope="session"/>
</c:if>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<div class="container mr-5">
		<div class="profile-header mt-4">
			<h1>Animalele mele pierdute</h1>
			<p>Iată o listă a animalelor declarate pierdute de tine.</p>
		</div>

		<div class="profile-content">
			<table class="table adoption-table table-hover mt-4">
				<thead>
					<tr>
						<th>Nume Animal</th>
						<th>Poză</th>
						<th>Oraș</th>
						<th>Acțiune</th>
					</tr>
				</thead>
				<tbody>
					<%
					user u=(user)session.getAttribute("userobj");
					  String email=u.getEmail();
					  PetsLostDAOImpl dao=new PetsLostDAOImpl(DBConnect.getConn());
					  List<petlostDtls> list=dao.getPetLostByEmail(email);
					  for(petlostDtls p:list){
					%>
					<tr>
						<td><%=p.getName()%></td>
						<td><img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 150px; height: 200px; "
							class="img-thumblin ">
						</td>
						<td><%=p.getLocation()%></td>
						<td><a href="UserDeleteLostPetServlet?email=<%=email%>&&id=<%=p.getId()%>"
							class="btn btn-sm btn-info">Șterge anuntul</a></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
