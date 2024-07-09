<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="ro">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FurreverHome: Înregistrare</title>
    <%@include file="all_component/allCSS.jsp"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background-color: #f5f4f2;
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 800px;
            margin: auto;
            margin-top: 30px;
            margin-bottom: 30px;
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
            margin-bottom: 5px;
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
        .text-center {
            text-align: center;
        }
        .form-check {
            margin-top: 15px;
        }
        .section-title {
            border-bottom: 2px solid #FFA500;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .input-group-text {
            background-color: #FFA500;
            border-color: #FFA500;
            color: white;
        }
    </style>
</head>
<body>
    <%@include file="all_component/navbar.jsp" %>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <h2 class="text-center mb-4">Creează Cont</h2>

                <c:if test="${not empty sccMsg}">
                    <div class="alert alert-success" role="alert">${sccMsg}</div>
                    <c:remove var="sccMsg" scope="session"/>
                </c:if>
                <c:if test="${not empty failedMsg}">
                    <div class="alert alert-danger" role="alert">${failedMsg}</div>
                    <c:remove var="failedMsg" scope="session"/>
                </c:if>
                <c:if test="${not empty checkedMsg}">
                    <div class="alert alert-warning" role="alert">${checkedMsg}</div>
                    <c:remove var="checkedMsg" scope="session"/>
                </c:if>

                <form action="RegisterServlet" method="post" id="registerForm">
                    <h4 class="section-title">Informații Personale</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="name"><i class="fas fa-user"></i> Nume Complet</label>
                            <input type="text" class="form-control" id="name" required name="name">
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="email"><i class="fas fa-envelope"></i> Adresă Email</label>
                            <input type="email" class="form-control" id="email" required name="email">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="phonenr"><i class="fas fa-phone"></i> Număr de telefon</label>
                            <input type="tel" class="form-control" id="phonenr" required name="phonenr">
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="password"><i class="fas fa-lock"></i> Parolă</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" required name="password">
                                <div class="input-group-append">
                                    <span class="input-group-text" id="togglePassword">
                                        <i class="fas fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                     <div class="col-md-6 form-group">
    <label for="city"><i class="fas fa-city"></i> Oraș</label>
    <select class="form-control" id="city" required name="city">
        <option value="">Selectează orașul</option>
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
        <option value="Craiova">Craiova</option>
    </select>
</div>
                    </div>

                    <h4 class="section-title mt-4">Preferințe de Adopție</h4>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="animal_type_filter"><i class="fas fa-paw"></i> Aș prefera să adopt</label>
                            <select class="form-control" id="animal_type_filter" required name="animal_type_filter">
                                <option value="Caine">Câine</option>
                                <option value="Pisica">Pisică</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="gender_filter"><i class="fas fa-venus-mars"></i> Genul preferat</label>
                            <select class="form-control" id="gender_filter" required name="gender_filter">
                                <option value="Mascul">Mascul</option>
                                <option value="Femela">Femelă</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 form-group">
                            <label for="care_filter"><i class="fas fa-heart"></i> Ai fi dispus/ă să adopți un animal cu nevoi speciale?</label>
                            <select class="form-control" id="care_filter" name="care_filter">
                                <option value="nu">Nu</option>
                                <option value="da">Da</option>
                            </select>
                        </div>
                        <div class="col-md-6 form-group">
                            <label for="age_filter"><i class="fas fa-birthday-cake"></i> Preferințe de vârstă</label>
                            <select class="form-control" id="age_filter" name="age_filter">
                                <option value="0-1">0-1 ani</option>
                                <option value="1-3">1-3 ani</option>
                                <option value="3-5">3-5 ani</option>
                                <option value="5-7">5-7 ani</option>
                                <option value="7+">7+ ani</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" name="check" id="exampleCheck1" required>
                        <label class="form-check-label" for="exampleCheck1">Accept termenii și condițiile</label>
                    </div>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-orange btn-lg">Înregistrare</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%@include file="all_component/footer.jsp" %>

    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#togglePassword').click(function() {
                const passwordField = $('#password');
                const passwordFieldType = passwordField.attr('type');
                if (passwordFieldType === 'password') {
                    passwordField.attr('type', 'text');
                    $(this).find('i').removeClass('fa-eye').addClass('fa-eye-slash');
                } else {
                    passwordField.attr('type', 'password');
                    $(this).find('i').removeClass('fa-eye-slash').addClass('fa-eye');
                }
            });

            $('#registerForm').submit(function(e) {
                const password = $('#password').val();
                if (password.length < 8) {
                    e.preventDefault();
                    alert('Parola trebuie să aibă cel puțin 8 caractere.');
                }
            });
        });
    </script>
</body>
</html>


