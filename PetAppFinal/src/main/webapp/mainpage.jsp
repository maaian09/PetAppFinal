<%@page import="com.entity.user"%>
<%@page import="com.DAO.PetsDAOImpl"%>
<%@page import="com.DAO.PetsDAO"%>
<%@page import="com.DAO.PetsLostDAO"%>
<%@page import="com.DAO.PetsLostDAOImpl"%>
<%@page import="com.DAO.PetsFoundDAO"%>
<%@page import="com.DAO.PetsFoundDAOImpl"%>
<%@page import="com.DAO.RequestCartDAO"%>
<%@page import="com.DAO.RequestCartDAOImpl"%>
<%@page import="com.entity.petforadoptionDtls"%>
<%@page import="com.entity.petfoundDtls"%>
<%@page import="com.entity.petlostDtls"%>
<%@page import="com.entity.adoptionRequestCart"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.List"%>
<%@page import="com.Db.*"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Main page</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
.back-img {
	background: url("img/6.jpg");
	height: 50vh;
	background-size: cover;
	display: flex;
	align-items: center;
	justify-content: center;
	text-align: center;
	color: #fff;
}

.card {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	transition: box-shadow 0.3s ease;
}

.card:hover {
	box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.btn {
	background-color: #ff8c00;
	color: #fff;
	border: none;
	border-radius: 20px;
	padding: 8px 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
	margin-right: 10px;
}

.btn:hover {
	background-color: #ffae42;
}
</style>
</head>

<body style="background-color: #f5f4f2;">

	<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img">
		<!--  <h2 class="text-center ">Furrever Home</h2> -->

	</div>
	<hr>

	<!-- Start PENTRU ADOPTIE Added mainpage -->
	<div class="container ">
		<h3 class="text-center">Animale pentru Adopție</h3>
		<div class="row">
			<%
			PetsDAOImpl dao = new PetsDAOImpl(DBConnect.getConn());
			List<petforadoptionDtls> list = dao.getAvailablePets();
			for (petforadoptionDtls p : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body ">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 170px; height: 200px;"
							class="img-thumblin mx-auto d-block">
						<p class="text-center">
							<strong><%=p.getName()%></strong>
						</p>
						<p>
							<strong>Specie:</strong>
							<%=p.getAnimal_type()%></p>
						<p>
							<strong>Gen:</strong>
							<%=p.getGender()%></p>
						<p>
							<strong>Vârstă:</strong>
							<%=p.getAge()%></p>
						<div class="row d-flex justify-content-center">
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
								<a href="view_pets.jsp?id=<%=p.getId()%>"
									class="btn btn-warning mr-1">Detalii</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<div class="text-center mt-1">
		<%
		if (u == null) {
		%>
		<a href="all_pets_for_adoption.jsp"
			class="btn btn-dark btn-sm text-white">Vizionează toate</a>
		<%
		} else {
		%>
		<a href="all_pets_for_adoption.jsp" class="btn btn-dark btn-sm text-white">Vizionează toate</a>
		<%
		}
		%>	</div>
<!-- End For Adoption -->
	<hr>
	<!-- Start Recently Lost -->

	<div class="container ">
		<h3 class="text-center">Pierdute Recent</h3>
		<div class="row">

			<%
			PetsLostDAOImpl dao2 = new PetsLostDAOImpl(DBConnect.getConn());
			List<petlostDtls> list2 = dao2.getPetsLost2();
			for (petlostDtls p : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 170px; height: 200px"
							class="img-thumblin mx-auto d-block">
						<p class="text-center">
							<strong><%=p.getName()%></strong>
						</p>
						<p>
							<strong>Specie:</strong>
							<%=p.getAnimal_type()%></p>
						<p>
							<strong>Gen:</strong>
							<%=p.getGender()%></p>
						<p>
							<strong>Oraș:</strong>
							<%=p.getLocation()%></p>


						<div class="row d-flex justify-content-center">
							<a href="view_lost_pets.jsp?id=<%=p.getId()%>"
								class="btn btn-warning mr-1">Detalii</a>
							<!--  <a href=""
								class="btn btn-info ml-1">Aplica</a>-->
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

	</div>
	<div class="text-center mt-1">
		<a href="all_lost_pets.jsp" class="btn btn-dark btn-sm text-white">Vizionează toate</a>
	</div>

	<hr>
	<!-- End Recently Lost -->

	<div class="container">
		<h3 class="text-center">Găsite Recent</h3>
		<div class="row">

			<%
			PetsFoundDAOImpl dao3 = new PetsFoundDAOImpl(DBConnect.getConn());
			List<petfoundDtls> list3 = dao3.getPetsFound2();
			for (petfoundDtls p : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body r">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 170px; height: 200px"
							class="img-thumblin mx-auto d-block">

						<p class="text-center">
							<strong>Necunoscut</strong>
						</p>
						<p>
							<strong>Specie:</strong>
							<%=p.getAnimal_type()%></p>
						<p>
							<strong>Gen:</strong>
							<%=p.getGender()%></p>
						<p>
							<strong>Oraș:</strong>
							<%=p.getLocation()%></p>


						<div class="row d-flex justify-content-center">
							<a href="view_found_pets.jsp?id=<%=p.getId()%>"
								class="btn btn-warning mr-1">Detalii</a>
							<!--  <a href=""
								class="btn btn-info ml-1">Aplica</a>-->
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>

	</div>
	<div class="text-center mt-1">
		<a href="all_found_pets.jsp" class="btn btn-dark btn-sm text-white">Vizionează toate</a>
	</div>



	<!-- end Recently Found -->







	<%@include file="all_component/footer.jsp"%>

</body>
</html>