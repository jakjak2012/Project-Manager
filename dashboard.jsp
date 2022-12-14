<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
</head>
<body>
   <div class="container mt-5">
	 <h5> Welcome, ${userName}</h5>
	 <p> 
	 <a href="/projects/new">Add a new project </a> |
	 <a href="/logout"> Logout</a></p>
	<h1>All Projects</h1>
	<table class="table">
		<thead>
			<tr>
				<th> Project</th>
				<th> Team Lead </th>
				<th> Due Date </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="eachProject" items="${ projectList}">
			<c:if test="${!eachProject.teamlead.id.equals(userId) }">
			<tr>
				<td>
					<a href="/projects/${eachProject.id }"> <c:out value="${eachProject.title}"/></a>
				</td>
				<td>
					<c:out value="${eachProject.teamlead.userName }"/>
				</td>
				<td>
					<fmt:formatDate value="${eachProject.dueDate }"/>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	<h1>Your Projects</h1>
	<table class="table">
		<thead>
			<tr>
				<th> Project</th>
				<th> Team Lead </th>
				<th> Due Date </th>
				<th> Actions </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="eachProject" items="${ projectList}">
			<c:if test="${eachProject.teamlead.id.equals(userId) }">
			<tr>
				<td>
					<a href="/projects/${eachProject.id }"> <c:out value="${eachProject.title}"/></a>
				</td>
				<td>
					<c:out value="${eachProject.teamlead.userName }"/>
				</td>
				<td>
					<fmt:formatDate value="${eachProject.dueDate }"/>
				</td>
				<td>
					<a href="/projects/edit/${eachProject.id}">Edit</a>
				</td>
			</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>