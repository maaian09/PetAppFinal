<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FurreverHome: Login</title>
    <%@include file="all_component/allCSS.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f5f4f2;
            font-family: 'Arial', sans-serif;
        }
        .login-container {
            max-width: 400px;
            margin: 50px auto;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .card-body {
            padding: 30px;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            border-radius: 20px;
            padding: 10px 15px;
        }
        .btn-orange {
            background-color: #FFA500;
            border-color: #FFA500;
            border-radius: 20px;
            padding: 10px 20px;
            font-weight: bold;
            transition: all 0.3s;
        }
        .btn-orange:hover {
            background-color: #FF8C00;
            border-color: #FF8C00;
        }
        .forgot-password {
            font-size: 0.9em;
            text-align: right;
            display: block;
            margin-top: 10px;
        }
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp"%>
    <div class="container login-container">
        <div class="card">
            <div class="card-body">
                <h3 class="text-center mb-4">Autentificare</h3>

                <c:if test="${not empty failedMsg}">
                    <div class="alert alert-danger" role="alert">
                        ${failedMsg}
                    </div>
                    <c:remove var="failedMsg" scope="session" />
                </c:if>

                <c:if test="${not empty succMsg}">
                    <div class="alert alert-success" role="alert">
                        ${succMsg}
                    </div>
                    <c:remove var="succMsg" scope="session" />
                </c:if>

                <form action="LoginServlet" method="post">
                    <div class="form-group">
                        <label for="email"><i class="fas fa-envelope"></i> Adresă Email</label>
                        <input type="email" class="form-control" id="email" required name="email">
                    </div>
                    <div class="form-group">
                        <label for="password"><i class="fas fa-lock"></i> Parolă</label>
                        <input type="password" class="form-control" id="password" required name="password">
                    </div>
                    
                    <button type="submit" class="btn btn-orange btn-block mt-4">Autentificare</button>
                </form>
                <div class="register-link">
                    Nu ai cont? <a href="register.jsp">Înregistrează-te</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>