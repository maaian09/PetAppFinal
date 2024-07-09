<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Add Pet</title>
<%@include file="allCSS.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
    .form-group {
        margin-bottom: 10px;
    }
    .form-control, .form-control-file {
        height: calc(1.5em + .75rem + 2px);
        padding: .375rem .75rem;
        font-size: .875rem;
    }
    .btn-block {
        margin-top: 10px;
    }
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>

	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp" />
	</c:if>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center mb-4">Adaug&#259; un animal spre adop&#539;ie</h4>

						<c:if test="${not empty succMsg}">
							<div class="alert alert-success text-center">${succMsg}</div>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<c:if test="${not empty failedMsg}">
							<div class="alert alert-danger text-center">${failedMsg}</div>
							<c:remove var="failedMsg" scope="session" />
						</c:if>

						<form action="../PetsAddAdoptionServlet" method="post"
							enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="pet_name"><i class="fas fa-paw"></i>Numele animalului</label> 
									<input type="text" class="form-control" id="pet_name" name="name" required>
								</div>
								<div class="form-group col-md-6">
									<label for="animal_type"><i class="fas fa-dog"></i>Specie</label> 
									<select class="form-control" id="animal_type" name="animal_type" required>
										<option value="Caine">Caine</option>
										<option value="Pisica">Pisica</option>
									</select>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="animal_gender"><i class="fas fa-venus-mars"></i>Gen</label> 
									<select class="form-control" id="animal_gender" name="gender" required>
										<option value="Mascul">Mascul</option>
										<option value="Femela">Femela</option>
									</select>
								</div>
								<div class="form-group col-md-6">
									<label for="breed"><i class="fas fa-certificate"></i> Ras&#259;</label> 
									<input type="text" class="form-control" id="breed" name="breed">
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="pet_age"><i class="fas fa-birthday-cake"></i> Vârsta</label> 
									<input type="number" class="form-control" id="pet_age" name="age" required>
								</div>
								<div class="form-group col-md-6">
									 <label for="location"><i class="fas fa-map-marker-alt"></i>Oraș</label>
                            <select class="form-control" id="location" required name="location">
                                <option value="Bucuresti">București</option>
                                <option value="Cluj-Napoca">Cluj-Napoca</option>
                                <option value="Timisoara">Timișoara</option>
                                <option value="Iasi">Iași</option>
                                <option value="Constanta">Constanța</option>
                                <option value="Brasov">Brașov</option>
                                <option value="Sibiu">Sibiu</option>
                                <option value="Oradea">Oradea</option>
                                <option value="Arad">Arad</option>
                                <option value="Ploiesti">Ploiești</option>
                                <option value="Ploiesti">Craiova</option>
                            </select>
								</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="photo"><i class="fas fa-camera"></i> Incarc&#259; o poz&#259;</label> 
									<input type="file" class="form-control-file" id="photo" name="photo_url" accept="image/*" required>
								</div>
								<div class="form-group col-md-6">
									<label for="special_care"><i class="fas fa-heart"></i>Nevoi speciale</label> 
									<select class="form-control" id="special_care" name="special_care" required>
										<option value="da">Da</option>
										<option value="nu">Nu</option>
									</select>
								</div>
							</div>
							
							<div class="form-group">
								<label for="description"><i class="fas fa-info-circle"></i>Descriere</label>
								<textarea class="form-control" id="description" name="description" rows="2" required></textarea>
							</div>

							<div class="form-row">
								<div class="form-group col-md-12">
									<button type="submit" class="btn btn-primary btn-block">Adaug&#259; anun&#539;</button>
								</div>
							</div>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>

