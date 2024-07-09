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
<title>Filter</title>
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

	<div class="container-fluid">
        <div class="row p-3">
            <c:forEach var="p" items="${sessionScope.filteredPets}">
                <div class="col-md-3">
                    <div class="card crd-ho mt-2">
                        <div class="card-body text-center">
                            <img alt="" src="animals/${p.photo_url}" style="width: 150px; height: 150px" class="img-thumblin">
                            <p>${p.name}</p>
                            <p><strong>Specie:</strong> ${p.animal_type}</p>
                            <p><strong>Gen:</strong> ${p.gender}</p>
                            <p><strong>Vârstă:</strong> ${p.age}</p>

                            <div class="row d-flex justify-content-center">
                                <%
                                if (u != null) {
                                %>
                                <a href="AdoptionRequestCartServlet?pet_id=${p.id}&user_id=<%= u.getUser_id() %>" class="btn btn-info ml-1">Aplica</a>
                                <%
                                } else {
                                %>
                                <a href="login.jsp" class="btn btn-info ml-1">Login to Apply</a>
                                <%
                                }
                                %>
                                <a href="view_pets.jsp?id=${p.id}" class="btn btn-warning mr-1">Detalii</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

</body>
</html>
