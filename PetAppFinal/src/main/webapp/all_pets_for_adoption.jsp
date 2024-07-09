<%@page import="com.DAO.RequestCartDAOImpl"%>
<%@page import="com.entity.user"%>
<%@page import="com.entity.petforadoptionDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Pets For Adoption</title>
<%@include file="all_component/allCSS.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #f7f1f0;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}

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


	<c:if test="${not empty addAdoptionRequest }">

		<div id="toast">${addAdoptionRequest}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>
		<c:remove var="addAdoptionRequest" scope="session" />
	</c:if>

	<%@include file="all_component/navbar.jsp"%>
	<hr>
	<%
	if (u != null) {
	%>
	<a href="user/adaugaAnuntadoptie.jsp" class="add-pet-btn"><i
		class="fa-solid fa-circle-plus "></i></a>
	<%
	}
	%>
	<!--  <form action="filter.jsp" method="post" class="form-inline justify-content-center">
    <div class="form-row align-items-center">
        <div class="col-auto">
            <label for="animal_type" class="mr-2">Specie:</label>
            <select id="animal_type" name="animal_type" class="form-control">
            <option value="">All</option>
                <option value="Caine">Caine</option>
                <option value="Pisica">Pisica</option>
            </select>
        </div>
        <div class="col-auto">
            <label for="gender" class="mr-2">Gen:</label>
            <select id="gender" name="gender" class="form-control">
                <option value="">All</option>
                <option value="Mascul">Mascul</option>
                <option value="Femela">Femela</option>
            </select>
        </div>
        <div class="col-auto">
            <label for="location" class="mr-2">Oras:</label>
            <select id="location" name="location" class="form-control">
            <option value="">All</option>
                <option value="Bucuresti">Bucuresti</option>
                <option value="Craiova">Craiova</option>
                 <option value="Cluj-Napoca">Cluj-Napoca</option>
                <option value="Timișoara">Timisoara</option>
                <option value="Iași">Iasi</option>
                <option value="Constanța">Constanta</option>
       
                <option value="Brașov">Brasov</option>
                <option value="Galați">Galati</option>
                <option value="Ploiești">Ploiesti</option>
                <option value="Oradea">Oradea</option>
            </select>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary">Apply Filters</button>
        </div>
    </div>
</form> -->
	<div class="container-fluid">
		<div class="row p-3">

			<%
			PetsDAOImpl dao2 = new PetsDAOImpl(DBConnect.getConn());
			List<petforadoptionDtls> list2 = dao2.getAvailablePets2();
			for (petforadoptionDtls p : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-2">
					<div class="card-body ">
						<img alt="" src="animals/<%=p.getPhoto_url()%>"
							style="width: 150px; height: 150px" class="img-thumblin mx-auto d-block">
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
							<strong>Varsta:</strong>
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

</body>
</html>