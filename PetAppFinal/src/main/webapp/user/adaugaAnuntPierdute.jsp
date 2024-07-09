<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User: Add Lost Pet</title>
<%@include file="allCSS.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<div class="container p-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card">
                <div class="card-body">
                    <h4 class="text-center mb-4">Adaugă anunț animal pierdut</h4>
                    
                    <c:if test="${not empty succMsg}">
                        <div class="alert alert-success text-center">${succMsg}</div>
                        <c:remove var="succMsg" scope="session"/>
                    </c:if>
                    
                    <c:if test="${not empty failedMsg}">
                        <div class="alert alert-danger text-center">${failedMsg}</div>
                        <c:remove var="failedMsg" scope="session"/>
                    </c:if>
                    
                    <form action="../PetsAddLostServlet" method="post" enctype="multipart/form-data">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="pet_name"><i class="fas fa-paw"></i>Numele animalului</label>
                                <input type="text" class="form-control" id="pet_name" name="name" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="animal_type"><i class="fas fa-dog"></i>Specie</label>
                                <select class="form-control" id="animal_type" name="animal_type" required>
                                    <option value="Caine">Câine</option>
                                    <option value="Pisica">Pisică</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="animal_gender"><i class="fas fa-venus-mars"></i>Gen</label>
                                <select class="form-control" id="animal_gender" name="gender" required>
                                    <option value="Mascul">Mascul</option>
                                    <option value="Femela">Femală</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="breed"><i class="fas fa-certificate"></i>Rasă</label>
                                <input type="text" class="form-control" id="breed" name="breed">
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="contact"><i class="fas fa-phone"></i>Contact</label>
                                <input type="number" class="form-control" id="contact" name="contact" required>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="lost-on"><i class="fas fa-calendar-alt"></i>Pierdut în data de</label>
                                <input type="date" class="form-control" id="lost-on" name="lost_on" required>
                            </div>
                        </div>
<div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="photo"><i class="fas fa-camera"></i>Adaugă o poză</label>
                            <input type="file" class="form-control-file" id="photo" name="photo_url" accept="image/*" required>
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
                        <button type="submit" class="btn btn-primary btn-block">Adaugă anunț</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
