<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PetsDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<%@ page import="com.entity.petforadoptionDtls" %>
<%@ page import="java.util.List" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Adoption Posts</title>
<%@include file="allCSS.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>
<c:if test="${empty userobj}">
   <c:redirect url="../login.jsp"/>
  </c:if>
<h3 class="text-center">Hello Admin</h3>

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
     <th scope="col">ID</th>
      <th scope="col">Imagine</th>
      <th scope="col">Specie</th>
      <th scope="col">Nume</th>
      <th scope="col">Stăpân</th>
      <th scope="col">Acțiune</th>
      
    </tr>
  </thead>
  <tbody>
  <%
  PetsDAOImpl dao=new PetsDAOImpl(DBConnect.getConn());
  List<petforadoptionDtls> list=dao.getAvailablePets2();
  for(petforadoptionDtls p:list)
  {%>
     <tr>
      <td><%=p.getId() %></td>
      <td><img alt="" src="../animals/<%=p.getPhoto_url()%>"
							style="width: 50px; height: 50px;"
							class="img-thumblin mx-auto d-block">
						<p class="text-center"></td>
      <td><%=p.getAnimal_type() %></td>
      <td><%=p.getName() %></td>
      <td><%=p.getEmail() %></td>
      <td>
      <a href="../view_pets.jsp?id=<%=p.getId()%>" class="btn btn-sm btn-warning">Vizualizează anunț</a>
      <a href="../delete?id=<%=p.getId() %>" class="btn btn-sm btn-secondary">Sterge</a>
      </td>
    </tr>
	  
  <%}
  
  %>
  
 
  </tbody>
</table>
<div style="margin-top: 40px;">
<%@include file="footer.jsp" %></div>
</body>
</html>
