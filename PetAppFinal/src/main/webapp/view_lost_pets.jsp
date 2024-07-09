<%@page import="com.entity.petlostDtls"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsLostDAOImpl"%>
<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <%@include file="all_component/allCSS.jsp"%>
    <style>
        .pet-details {
            background-color: #f8f9fa;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            margin-top: 30px;
        }

        .pet-image {
            text-align: center;
            margin-bottom: 20px;
        }

        .pet-info h4 {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #333;
        }

        .pet-info span {
            font-size: 18px;
            font-weight: normal;
            color: #666;
        }

        .pet-actions {
            margin-top: 20px;
            text-align: center;
        }

        .pet-actions .btn {
            margin: 5px;
            font-size: 16px;
            padding: 10px 20px;
        }
    </style>
</head>
<body style="background-color: #f5f4f2;">
    <%@include file="all_component/navbar.jsp"%>
    <%
        int id = Integer.parseInt(request.getParameter("id"));
        PetsLostDAOImpl dao = new PetsLostDAOImpl(DBConnect.getConn());
        dao.getPetLostById(id);
        petlostDtls p = dao.getPetLostById(id);
    %>

    <div class="container">
        <div class="pet-details">
            <div class="row">
                <div class="col-md-6 pet-image">
                    <img src="animals/<%=p.getPhoto_url()%>" class="img-fluid rounded" alt="Pet Image" style="max-width: 300px; max-height: 250px;">
                </div>
                <div class="col-md-6 pet-info">
                    <h4>Animal: <span><%=p.getName()%></span></h4>
                    <h4>Specie: <span><%=p.getAnimal_type()%></span></h4>
                    <h4>Gen: <span><%=p.getGender()%></span></h4>
                    <h4>Rasa: <span><%=p.getBreed()%></span></h4>
                    <h4>Pierdut: <span><%=p.getLost_on()%></span></h4>
                    <div class="pet-actions">
                         <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#contactModal">Contacteaza</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
      
    <!-- Contact Modal -->
    <div class="modal fade" id="contactModal" tabindex="-1" role="dialog" aria-labelledby="contactModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="contactModalLabel">Contact me at:</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <h5><%=p.getEmail()%></h5>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
     <%@include file="all_component/footer.jsp"%>
    
    <script src="https://kit.fontawesome.com/your-font-awesome-kit.js"></script>
    <script>
        $(function() {
            $('[data-toggle="tooltip"]').tooltip();
        });
    </script>
</body>

</html>