<%@ page language="java" contentType="text/html; UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adoption Request Successful</title>
    <%@include file="all_component/allCSS.jsp"%>
    <!-- Include any CSS or Bootstrap styles here -->
    
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #edb553;
            color: #fff;
        }
        .text-success {
            font-weight: bold;
        }
   
    </style>
</head>
<body style="background-color: #f5f4f2;">
<%@include file="all_component/navbar.jsp"%>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-6 offset-md-3">
                <div class="card">
                    <div class="card-header">
                        <h3 class="text-center">Cerere de adopție trimisă</h3>
                    </div>
                    <div class="card-body">
                        <p class="text-success text-center">Cererea (cererile) dumneavoastră de adopție a fost depusă cu succes!</p>
                        <p>Vă mulțumim pentru interesul dumneavoastră de a adopta un animal de companie. Fiecare proprietar va analiza cererea (cererile) dumneavoastră separat și vă va contacta în curând.</p>
                        <p>Între timp, vă rugăm să vă asigurați că ați furnizat informații de contact corecte și o descriere detaliată a situației dumneavoastră locative, experiența cu animalele de companie și orice alte informații relevante.</p>
                        <p>Odată ce cererea dumneavoastră va fi aprobată, proprietarul va lua legătura cu dumneavoastră pentru a programa o întâlnire și a finaliza procesul de adopție.</p>
                        <div class="text-center">
                            <a href="mainpage.jsp" class="btn btn-primary">Back to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

    </html>