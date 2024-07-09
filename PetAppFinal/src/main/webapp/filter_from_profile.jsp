<%@page import="com.entity.user"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Filter From Profile</title>
<%@include file="all_component/allCSS.jsp"%>
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

.form-container {
	background-color: white;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	position: relative;
}

.form-group label {
	font-weight: bold;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #0056b3;
}

body {
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
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

.container {
	flex: 1;
	padding: 20px;
	box-sizing: border-box;
}

.form-actions {
	position: absolute;
	top: 20px;
	right: 20px;
}
</style>
</head>
<body>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

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

		<%
		user u = (user) session.getAttribute("userobj");
		String animal_type_filter = u.getAnimal_type_filter();
		String gender_filter = u.getGender_filter();
		String location = u.getCity();
		String care_filter = u.getCare_filter();
		String age_filter = u.getAge_filter();
		%>

		<div class="container">
			<div class="form-container">
				<h3>Experiența de adopție personalizată</h3>
				<form action="FilterServlet" method="post" class="form-horizontal">
					<input type="hidden" value="${userobj.user_id}" name="user_id">
					<div class="form-actions p-2">
						<button type="submit" class="btn btn-primary">Vezi
							animalele potrivite pentru tine</button>
					</div>
					<div class="form-group row">
						<label for="userName" class="col-sm-2 col-form-label">Nume</label>
						<div class="col-sm-6">
							<input type="text" name="username" class="form-control"
								id="userName" value="${userobj.name}" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="userEmail" class="col-sm-2 col-form-label">Email</label>
						<div class="col-sm-6">
							<input type="email" name="email" class="form-control"
								id="userEmail" value="${userobj.email}" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="userPhone" class="col-sm-2 col-form-label">Număr
							de telefon</label>
						<div class="col-sm-6">
							<input type="text" name="phonenr" class="form-control"
								id="userPhone" value="${userobj.phonenr}" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="location" class="col-sm-2 col-form-label">Oraș</label>
						<div class="col-sm-6">
							<input type="text" name="location" class="form-control"
								id="location" value="${userobj.city}" required>
						</div>
					</div>

					<div class="form-group row">
						<label for="animal_type_filter" class="col-sm-2 col-form-label">Animalul
							pe care aș dori să adopt</label>
						<div class="col-sm-6">
							<input type="text" name="animal_type_filter" class="form-control"
								id="animal_type_filter" value="${userobj.animal_type_filter}"
								required>
						</div>
					</div>

					<div class="form-group row">
						<label for="gender_filter" class="col-sm-2 col-form-label">Genul
							animalului</label>
						<div class="col-sm-6">
							<input type="text" name="gender_filter" class="form-control"
								id="gender_filter" value="${userobj.gender_filter}" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="care_filter" class="col-sm-2 col-form-label">Dispus
							să adopt cu nevoi speciale</label>
						<div class="col-sm-6">
							<input type="text" name="care_filter" class="form-control"
								id="care_filter" value="${userobj.care_filter}" required>
						</div>
					</div>
					<div class="form-group row">
						<label for="age_filter" class="col-sm-2 col-form-label">Preferinte
							varsta</label>
						<div class="col-sm-6">
							<input type="text" name="age_filter" class="form-control"
								id="age_filter" value="${userobj.age_filter}" required>
						</div>
					</div>

				</form>
			</div>
		</div>
	</div>
</body>
</html>
