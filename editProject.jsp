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
	<form:form action="/projects/edit/${project.id }" method="POST" 
	modelAttribute="project" class="form-control">
	<input type="hidden" name="_method" value="PUT"/>
	<h1>Edit Project</h1>
		<div>
			<form:label path="title" class="form-label">Project Title: </form:label>
			<form:input path="title" type="text" class="form-control"/>
			<form:errors path="title" class="text-danger"/>
		</div>
		<div>
			<form:label path="description" class="form-label">Description:</form:label>
			<form:textarea path="description" class="form-control"/>
			<form:errors path="description" class="text-danger"/>
		</div>
		<div>
			<form:label path="dueDate" class="form-label">Due Date:</form:label>
			<form:input path="dueDate" type="date" class="form-control"/>
			<form:errors path="dueDate" class="text-danger"/>
		</div>
		<form:hidden path="teamlead"/>
		<button type="submit" class="btn btn-success">Edit the Project</button>
	</form:form>
	</div>
</body>
</html>