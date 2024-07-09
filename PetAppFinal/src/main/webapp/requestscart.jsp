<%@page import="java.util.List"%>
<%@page import="com.entity.user"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.RequestCartDAOImpl"%>
<%@page import="com.entity.adoptionRequestCart"%>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="all_component/allCSS.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adoption Requests</title>
<style>
body {
	background-color: #f5f4f2;
	font-family: Arial, sans-serif;
}
.adoption-table {
	border-collapse: collapse;
	width: 100%;
	margin-top: 20px;
}
.adoption-table th, .adoption-table td {
	padding: 10px;
	text-align: left;
	border: 1px solid #ddd;
}
.adoption-table tr:nth-child(even) {
	background-color: #f2f2f2;
}
.adoption-table th {
	background-color: #f0b154;
	color: white;
}
.pet-image {
	width: 50px;
	height: 50px;
	object-fit: cover;
}
.card {
	margin-top: 20px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}
.card-body {
	padding: 20px;
}
.table-hover tbody tr:hover {
	background-color: #f1f1f1;
}
.alert {
	margin-top: 20px;
}
.form-group label {
	font-weight: bold;
}
</style>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty failedMsg}">
		<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		<c:remove var="failedMsg" scope="session" />
	</c:if>
	    <div class="container">
		<div class="row">
			<div class="col-md-6 ">
				<h3 class="text-center">Coșul tău de cereri</h3>
				<table class="table adoption-table table-hover mt-4">
					<thead><tr>
							<th>Nume animal</th>
							<th>Email Stăpân</th>	
							<th>Acțiune</th></tr>
					</thead>
					<tbody><%
						user u = (user) session.getAttribute("userobj");
						RequestCartDAOImpl dao = new RequestCartDAOImpl(DBConnect.getConn());
						List<adoptionRequestCart> adoptionrequest = dao.getPetByUser(u.getUser_id());
						for (adoptionRequestCart r : adoptionrequest) {%>
						<tr><td><%=r.getPet_name()%></td>
						<td><%=r.getOwner_email()%></td>	
						<td><a href="WithdrawRequestServlet?pet_id=<%=r.getPet_id()%>&user_id=<%=r.getUser_id()%>"
						class="btn btn-sm btn-info">Șterge din listă</a></td>
						</tr><%}%></tbody></table></div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">Detalii Utilizator</h4>
						<form action="AdoptionRequestOrderServlet" method="post">
						 <input type="hidden" value="${userobj.user_id}" name="id">
							<div class="form-group">
								<label for="userName">Nume</label> <input type="text" name="username"
									class="form-control" id="userName" value="${userobj.name }" required
									>
							</div>
							<div class="form-group">
								<label for="userEmail">Email</label> <input type="email" name="email"
									class="form-control" id="userEmail" value="${userobj.email }" required
									>
							</div>
							<div class="form-group">
								<label for="userPhone">Număr de telefon</label> <input type="text" name="phonenr"
									class="form-control" id="userPhone" value="${userobj.phonenr }" required
									>
							</div>
							<div class="form-group">
								<label for="userCity">Oraș</label> <input type="text" name="city"
									class="form-control" id="userCity" value="${userobj.city }" required
									>
							</div>
							<div class="form-group">
								<label for="exampleFormControlTextarea1">Descriere - explică proprietarului de ce ești candidatul potrivit</label>
								<textarea class="form-control" id="exampleFormControlTextarea1" name="description" value="${userobj.description }"
									rows="3" required></textarea>
							</div>

							<div class="d-flex justify-content-center">
								<button class="btn btn-warning">Trimite Cererile</button>
								<a href="mainpage.jsp" class="btn btn-success">Continuă Navigarea</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="mt-5">
		<%@include file="all_component/footer.jsp"%>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
