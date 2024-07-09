<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.entity.petfoundDtls" %>
<%@ page import="java.util.List" %>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsFoundDAOImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Found Posts</title>
<%@include file="allCSS.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<h3 class="text-center">Hello Admin</h3>
<c:if test="${empty userobj}">
   <c:redirect url="../login.jsp"/>
  </c:if>
<c:if test="${not empty succMsg }">
<p class="text-center text-success">${succMsg }</p>
<c:remove var="succMsg" scope="session" />
</c:if>

<c:if test="${not empty failedMsg }">
<p class="text-center text-danger">${failedMsg }</p>
<c:remove var="failedMsg" scope="session" />
</c:if>

<table class="table table-striped ">
  <thead class="bg-warning text-white">
    <tr>
      <th scope="col">Id</th>
      <th scope="col">Imafine</th>
      <th scope="col">Specie</th>
      <th scope="col">Email</th>
      <th scope="col">Număr de telefon</th>
      <th scope="col">Oraș</th>
      <th scope="col">Acțiune</th>
    </tr>
  </thead>
  <tbody>
  <tbody>
    <%
  PetsFoundDAOImpl dao=new PetsFoundDAOImpl(DBConnect.getConn());
  List<petfoundDtls> list=dao.getPetsFound();
  for(petfoundDtls p:list)
  {%>
     <tr>
      <td><%=p.getId() %></td>
      <td><img alt="" src="../animals/<%=p.getPhoto_url()%>"
							style="width: 50px; height: 50px;"
							class="img-thumblin mx-auto d-block">
						<p class="text-center"></td>
      <td><%=p.getAnimal_type() %></td>
      <td><%=p.getEmail() %></td>
      <td><%=p.getContact() %></td>
      <td><%=p.getLocation() %></td>
      
      <td>
      <a href="../view_found_pets.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-warning">Vizualizare Anunț</a>
      <a href="../PetsFoundDeleteServlet?id=<%=p.getId() %>" class="btn btn-sm btn-secondary">Sterge</a>
      </td>
    </tr>
	  
  <%}
  
  %>


  </tbody>
</table>
<div style="margin-top: 280px;">
<%@include file="footer.jsp" %></div>
</body>
</html>