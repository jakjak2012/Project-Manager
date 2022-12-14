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
   <h1> Project Details</h1>
	 <table class="table">
		<tbody>
			<tr>
				<td>Project</td>
				<td><c:out value="${project.title}"/></td>
			</tr>
			<tr>
				<td> Team Lead</td>
				<td><c:out value="${project.teamlead.userName }"/></td>
			</tr>
			<tr>
				<td> Due Date</td>
				<td><fmt:formatDate value="${project.dueDate }"/></td>
			</tr>
			<tr>
				<td> Description </td>
				<td> ${project.description }</td>
			</tr>
		</tbody>
	</table>
	<a href="/dashboard"> Back to Dashboard </a>
	<form action="/projects/delete/${project.id }" method="post">
	<input type="hidden" name="_method" value="delete"/>
	<button type="submit" class="btn btn-danger"> Delete</button>
	</form>
	</div>
</body>
</html>