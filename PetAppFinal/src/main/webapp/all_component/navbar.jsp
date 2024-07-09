<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!-- No contentType directive here to avoid conflicts -->
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    
    <style type="text/css">
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
<div class="container-fluid" style="height: 11px; background-color: #ffa726;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fa-solid fa-dog"></i> FurreverHome</h3>
        </div>
        <div class="col-md-9 d-flex justify-content-end">
            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn custom-login-btn"><i class="fa-solid fa-right-to-bracket"></i> Autentificare</a>
                <a href="register.jsp" class="btn custom-login-btn text-white"><i class="fa-solid fa-id-card"></i> &#206;nregistrare</a>
            </c:if>
            <c:if test="${not empty userobj}">
                <div class="username-container">
                    <a href="requestscart.jsp" class="btn custom-login-btn"><i class="fa-solid fa-star"></i></a>
                    <a href="filter_from_profile.jsp" class="btn custom-login-btn"><i class="fas fa-user-plus"></i> <span class="username">${userobj.name}</span></a>
                    <a href="LogoutServlet" class="btn custom-login-btn text-white"><i class="fa-solid fa-sign-in-alt"></i> Logout</a>
                </div>
            </c:if>
        </div>
    </div>
</div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<a class="navbar-brand" href="#"><i
		class="fa-solid fa-house-chimney"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="mainpage.jsp">Home</a><span class="sr-only">(current)</span></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_lost_pets.jsp"><i class="fa-solid fa-paw"></i> Animale
					Pierdute</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="all_found_pets.jsp"><i class="fa-solid fa-paw"></i>
					Animale G&#259;site</a></li>

			<li class="nav-item active"> <c:if test="${empty userobj}">
                    <a class="nav-link" href="all_pets_for_adoption.jsp"><i class="fa-solid fa-paw"></i> Adopt&#259; </a>
                </c:if>
                <c:if test="${not empty userobj}">
                    <a class="nav-link" href="all_pets_for_adoption.jsp"><i class="fa-solid fa-paw"></i> Adopt&#259; </a>
                </c:if>
			<li class="nav-item active"><a class="nav-link disabled"
				href="faq.jsp"><i class="fa-regular fa-comments"></i> FAQ</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">
 <c:if test="${not empty userobj}">
			<a href="setting.jsp" class="btn btn-light my-2-my-sm-0" type="submit">
			<i class="fas fa-cog"></i>Editare Profile
			 </a>
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="button" data-toggle="modal" data-target="#contactModaldon">
                    <i class="fa-solid fa-phone"></i> Contact 
                </button>
			</c:if>
			<c:if test="${empty userobj }">
			<button class="btn btn-light my-2 my-sm-0 ml-1" type="button" data-toggle="modal" data-target="#contactModaldon">
                    <i class="fa-solid fa-phone"></i> Contact 
                </button>
			</c:if>
		</form>
	</div>
</nav>
     <div class="modal fade" id="contactModaldon" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="contactModalLabel">Informații de Contact pentru Donații</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>Pentru donații, vă rugăm să ne contactați la:</p>
                <p>Email: <a href="mailto:furreverhome01@outlook.com">furreverhome01@outlook.com</a></p>
                
                <p>Vă mulțumim pentru sprijinul acordat!</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</html>