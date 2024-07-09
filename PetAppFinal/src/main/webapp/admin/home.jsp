<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: Home</title>
    <%@include file="allCSS.jsp" %>
    <style type="text/css">
        a {
            text-decoration: none;
            color: black;
        }
        a:hover {
            text-decoration: none;
            color: black;
        }
        .card {
            transition: transform 0.3s;
        }
        .card:hover {
            transform: scale(1.05);
        }
        .modal-content .modal-body h4 {
            margin-bottom: 20px;
        }
        .container {
            margin-top: 50px;
        }
        .card i {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%@include file="navbar.jsp" %>
    <c:if test="${empty userobj}">
        <c:redirect url="../login.jsp"/>
    </c:if>
  
    <div class="container">
        <div class="row p-5">
            <div class="col-md-3 mb-4">
                <a href="spreadoptie.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-dog fa-3x text-warning"></i><br>
                            <h4>Postări Adopție</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a href="pierdute.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-paw fa-3x"></i><br>
                            <h4>Postări Pierdute</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a href="gasite.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-shield-dog fa-3x text-warning"></i><br>
                            <h4>Postări Găsite</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-md-3 mb-4">
                <a href="requests.jsp">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-regular fa-user fa-3x"></i><br>
                            <h4>Cereri de adopție</h4>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-12 d-flex justify-content-center mb-4">
                <a data-toggle="modal" data-target="#staticBackdrop">
                    <div class="card">
                        <div class="card-body text-center">
                            <i class="fa-solid fa-shield-cat fa-3x"></i><br>
                            <h4>Logout</h4>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
  
    <!-- Modal -->
    <div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="text-center">
                        <h4>Do you want to logout?</h4>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a href="../LogoutServlet" type="button" class="btn btn-warning">Logout</a>
                    </div>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

    <div style="margin-top: 280px;">
        <%@include file="footer.jsp" %>
    </div>
</body>
</html>

