<%@page import="com.entity.user"%>
<%@page import="com.entity.petfoundDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsFoundDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Found Pets</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f1f0;
}
.add-pet-btn {
	position: fixed; 
	right: 20px; 
	bottom: 20px; 
	z-index: 9999;
	font-size: 30px; 
	color: white; 
	background-color: #ed9a1c;
	border: none; 
	border-radius: 50%; 
	padding: 10px; 
	cursor: pointer;
	
}
</style>
</head>
<body style="background-color: #f5f4f2;">
<%
	user u = (user) session.getAttribute("userobj");
	%>

	<%@include file="all_component/navbar.jsp"%>
	<hr>
	<%
					if(u != null){
						%>
						<a href="user/adaugaAnuntGasit.jsp" class="add-pet-btn"><i class="fa-solid fa-circle-plus " ></i></a>
					<% }
					
					%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			PetsFoundDAOImpl dao2 = new PetsFoundDAOImpl(DBConnect.getConn());
			List<petfoundDtls> list2 = dao2.getAllPetsFound();
			for (petfoundDtls p : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body ">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 150px; height: 200px"
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
							<strong>Oras:</strong>
							<%=p.getLocation()%></p>


						<div class="row d-flex justify-content-center">
							<a href="view_found_pets.jsp?id=<%=p.getId()%>"
								class="btn btn-warning mr-1">Detalii</a> <a href=""
								class="btn btn-info ml-2">Contact</a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
	</div>

</body>
</html>