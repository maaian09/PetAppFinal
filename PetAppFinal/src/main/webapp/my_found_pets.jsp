<!DOCTYPE html>
<%@page import="com.entity.petfoundDtls"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsFoundDAOImpl"%>
<%@page import="com.entity.user"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Found Pets</title>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<style>
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

.sidebar .text-primary, .sidebar .text-warning {
	color: white !important;
}
.main-container {
	display: flex;
	min-height: 100vh;
}

.sidebar {
	width: 250px;
	background-color: #343a40;
	padding-top: 50px;
}
.profile-header {
	background-color: #ffa726;
	padding: 20px;
	border-radius: 8px;
	color: #fff;
	margin-bottom: 20px;
	text-align: center;
}

.profile-header h1 {
	margin: 0;
}

.profile-content {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin-bottom: 20px;
}
 th {
            background-color: #ffc107;}
.found-pet-card {
	margin-bottom: 20px;
}

.found-pet-card img {
	border-radius: 8px;
	max-height: 200px;
	object-fit: cover;
}

.found-pet-details {
	padding: 15px;
}

.btn-primary {
	background-color: #ff8c00;
	border-color: #ff8c00;
}

.btn-primary:hover {
	background-color: #ffae42;
	border-color: #ffae42;
}
</style>
<%@include file="all_component/allCSS.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<div class="main-container">
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
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg}">
	<div class="alert alert-succes text-center">${succMsg}</div>
    <c:remove var="succMsg" scope="session"/>
</c:if>
	<div class="container mr-5">
		<div class="profile-header mt-4">
			<h1>Animale găsite de mine</h1>
			<p>Iată o listă a animalelor declarate găsite de tine.</p>
		</div>
		<div class="profile-content ">
			<div class="row">
				<%
				user u=(user)session.getAttribute("userobj");
				  String email=u.getEmail();
				  PetsFoundDAOImpl dao=new PetsFoundDAOImpl(DBConnect.getConn());
				  List<petfoundDtls> list=dao.getPetFoundByEmail(email);
				  for(petfoundDtls p:list){
				%>
				<div class="col-md-4 found-pet-card">
					<div class="card">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 100%; height: 200px; object-fit: cover;"
							class="img-thumblin ">
						<div class="card-body found-pet-details">
							<p class="card-text">
								<strong>Găsit în data de:</strong>
								<%=p.getFound_on()%></p>
							<p class="card-text">
								<strong>Oraș:</strong>
								<%=p.getLocation()%></p>
							<a href="UserDeleteFoundPetServlet?email=<%=email%>&&id=<%=p.getId()%>" class="btn btn-primary">Sterge Anunt</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		</div>
</body>
</html>
