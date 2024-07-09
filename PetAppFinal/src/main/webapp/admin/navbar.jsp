<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
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
</head><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<div class="container-fluid"
	style="height: 11px; background-color: #ffa726;"></div>

<div class="container-fluid" style="height: 11px; background-color: #ffa726;"></div>

<div class="container-fluid p-3 bg-light">
    <div class="row">
        <div class="col-md-3">
            <h3><i class="fa-solid fa-dog"></i> FurreverHome</h3>
        </div>
        <div class="col-md-9 d-flex justify-content-end">
            <c:if test="${empty userobj}">
                <a href="login.jsp" class="btn custom-login-btn"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
                <a href="register.jsp" class="btn custom-login-btn text-white"><i class="fa-solid fa-id-card"></i> Register</a>
            </c:if>
            <c:if test="${not empty userobj}">
                <div class="username-container">
                   
                    <a href="home.jsp" class="btn custom-login-btn"><i class="fas fa-user-plus"></i> <span class="username">${userobj.name}</span></a>
                    <a href="../LogoutServlet" class="btn custom-login-btn text-white"><i class="fa-solid fa-sign-in-alt"></i> Logout</a>
                </div>
            </c:if>
        </div>
    </div>
</div>
<!-- logout modal -->






<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-backdrop="static"
	data-keyboard="false" tabindex="-1"
	aria-labelledby="staticBackdropLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="staticBackdropLabel"></h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="text-center">
					<h4>Do you want to logout?</h4>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<a href="../LogoutServlet" type="button" class="btn btn-warning">Logout</a>

				</div>


			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>














<!-- end logout modal -->



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
			<!--  <li class="nav-item active"><a class="nav-link"
				href="../mainpage.jsp">Home</a><span class="sr-only">(current)</span></li>
-->


			</form>
	</div>
</nav>
</html>