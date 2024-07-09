<%@page import="com.entity.petforadoptionDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FurreverHome: Login</title>
<%@include file="all_component/allCSS.jsp"%>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
<style>
body {
    font-family: 'Roboto', sans-serif;
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
.sidebar .text-primary, .sidebar .text-warning {
    color: white !important;
}
.container-custom {
    margin-left: 270px;
    padding: 30px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.table-custom {
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.table-custom thead {
    background-color: #ffc107;
    color: #fff;
}
.table-custom th, .table-custom td {
    padding: 12px 15px;
    border: 1px solid #dee2e6;
}
.table-custom tbody tr:hover {
    background-color: #f1f1f1;
}
.table-custom .btn {
    background-color: #ff8c00;
    border-color: #ff8c00;
    color: #fff;
}
.table-custom .btn:hover {
    background-color: #ffae42;
    border-color: #ffae42;
}
</style>
</head>
<body>
    <c:if test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:if>
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
        <c:remove var="succMsg" scope="session" />
    </c:if>
    <div class="container-custom">
        <h3 style="text-align: center; margin-bottom: 20px;">Animalele pe care le-ai pus pentru adopție</h3>
        <table class="table table-striped table-custom">
            <thead>
                <tr>
                    <th scope="col">Nume</th>
                    <th scope="col">Specie</th>
                    <th scope="col">Gen</th>
                    <th scope="col">Rasă</th>
                    <th scope="col">Acțiune</th>
                </tr>
            </thead>
            <tbody>
                <%
                user u = (user) session.getAttribute("userobj");
                String email = u.getEmail();
                PetsDAOImpl dao = new PetsDAOImpl(DBConnect.getConn());
                List<petforadoptionDtls> list = dao.getPetsForAdoption(email);
                for (petforadoptionDtls p : list) {
                %>
                <tr>
                    <td><%=p.getName()%></td>
                    <td><%=p.getAnimal_type()%></td>
                    <td><%=p.getGender()%></td>
                    <td><%=p.getBreed()%></td>
                    <td><a href="UserDeletePetServlet?email=<%=email%>&&id=<%=p.getId()%>" class="btn btn-sm">Sterge</a></td>
                </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>

