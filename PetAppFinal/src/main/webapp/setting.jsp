<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings Page</title>
<%@include file="all_component/allCSS.jsp"%>
<style>
body {
	background-color: #f5f4f2;
}

.container {
	max-width: 800px;
	margin: auto;
	margin-top: 30px; /* Adjusted margin to move container higher */
}

.card {
	padding: 20px;
}

.form-group label {
	margin-bottom: 5px;
}

.form-control {
	margin-bottom: 15px;
}

.btn-orange {
	background-color: #FFA500;
	border-color: #FFA500;
}

.text-center {
	text-align: center;
}

.form-check {
	margin-top: 10px;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center" style="color: orange;">Editează
							Profilul</h4>
						<c:if test="${not empty failedMsg}">
							<h5 class="text-center text-danger">${failedMsg}</h5>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form action="UpdateProfileServlet" method="post">
							<input type="hidden" value="${userobj.user_id}" name="id">
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="name">Nume Complet</label> <input type="text"
										class="form-control" id="name" required="required" name="name"
										value="${userobj.name}">
								</div>
								<div class="col-md-6 form-group">
									<label for="email">Adresa Email</label> <input type="email"
										class="form-control" id="email" required="required"
										name="email" value="${userobj.email}">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="phonenr">Număr de telefon</label> <input
										type="text" class="form-control" id="phonenr"
										required="required" name="phonenr" value="${userobj.phonenr}">
								</div>
								<div class="col-md-6 form-group">
									<label for="password">Parolă</label> <input type="password"
										class="form-control" id="password" required="required"
										name="password">
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="city">Oraș</label> <select class="form-control"
										id="city" required="required" name="city">
										<option value="Bucuresti"
											<c:if test="${userobj.city == 'București'}">selected</c:if>>București</option>
										<option value="Cluj-Napoca"
											<c:if test="${userobj.city == 'Cluj-Napoca'}">selected</c:if>>Cluj-Napoca</option>
										<option value="Timisoara"
											<c:if test="${userobj.city == 'Timișoara'}">selected</c:if>>Timișoara</option>
										<option value="Iasi"
											<c:if test="${userobj.city == 'Iași'}">selected</c:if>>Iași</option>
										<option value="Constanta"
											<c:if test="${userobj.city == 'Constanța'}">selected</c:if>>Constanța</option>
										<option value="Brasov"
											<c:if test="${userobj.city == 'Brașov'}">selected</c:if>>Brașov</option>
										<option value="Sibiu"
											<c:if test="${userobj.city == 'Sibiu'}">selected</c:if>>Sibiu</option>
										<option value="Oradea"
											<c:if test="${userobj.city == 'Oradea'}">selected</c:if>>Oradea</option>
										<option value="Arad"
											<c:if test="${userobj.city == 'Arad'}">selected</c:if>>Arad</option>
										<option value="Ploiesti"
											<c:if test="${userobj.city == 'Ploiești'}">selected</c:if>>Ploiești</option>
										<option value="Ploiesti"
											<c:if test="${userobj.city == 'Craiova'}">selected</c:if>>Craiova</option>
									</select>
								</div>
								<div class="col-md-6 form-group">
									<label for="animal_type_filter">As dori sa adopt</label> <select
										class="form-control" id="animal_type_filter"
										required="required" name="animal_type_filter">
										<option value="Caine"
											<c:if test="${userobj.animal_type_filter == 'Câine'}">selected</c:if>>Câine</option>
										<option value="Pisica"
											<c:if test="${userobj.animal_type_filter == 'Pisică'}">selected</c:if>>Pisică</option>
									</select>
								</div>
							</div>
							<div class="row">
								<div class="col-md-6 form-group">
									<label for="gender_filter">Gen</label> <select
										class="form-control" id="gender_filter" required="required"
										name="gender_filter">
										<option value="mascul"
											<c:if test="${userobj.gender_filter == 'mascul'}">selected</c:if>>Mascul</option>
										<option value="femela"
											<c:if test="${userobj.gender_filter == 'femela'}">selected</c:if>>Femelă</option>
									</select>
								</div>

								<div class="col-md-6 form-group">
									<label for="care_filter">Dispus să adopt animale cu
										nevoi speciale</label> <select class="form-control" id="care_filter"
										name="care_filter">
										<option value="nu"
											<c:if test="${userobj.care_filter == 'nu'}">selected</c:if>>Nu</option>
										<option value="da"
											<c:if test="${userobj.care_filter == 'da'}">selected</c:if>>Da</option>
									</select>
								</div>
								<div class="col-md-6 form-group">
									<label for="age_filter">Preferințe de vârstă</label>
									<select class="form-control" id="age_filter" name="age_filter">
										<option value="0-1" <c:if test="${userobj.age_filter == '0-1'}">selected</c:if>>0-1 ani</option>
										<option value="1-3" <c:if test="${userobj.age_filter == '1-3'}">selected</c:if>>1-3 ani</option>
										<option value="3-5" <c:if test="${userobj.age_filter == '3-5'}">selected</c:if>>3-5 ani</option>
										<option value="5-7" <c:if test="${userobj.age_filter == '5-7'}">selected</c:if>>5-7 ani</option>
										<option value="7+" <c:if test="${userobj.age_filter == '7+'}">selected</c:if>>7+ ani</option>
									</select>
								</div>
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-orange btm-sms">Actualizează</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>







