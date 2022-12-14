<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
</head>
<body>
	<div class="container mt-5">
	 <h1>Register</h1>
		<form:form action="/register" method="POST" modelAttribute="newUser">
		<div class="form-group">
	  				<form:label path="userName">User Name:</form:label><br>
	  				<form:input path="userName" class="form-control"/>
	  				<form:errors path="userName" class="text-danger"/>
	  		</div>
	  		<div class="form-group">
	  				<form:label path="email">Email:</form:label><br>
	  				<form:input path="email" class="form-control"/>
	  				<form:errors path="email" class="text-danger"/>
	  		</div>
	  		<div class="form-group">
	  				<form:label path="password">Password:</form:label><br>
	  				<form:input path="password" class="form-control" type="password"/>
	  				<form:errors path="password" class="text-danger"/>
	  		</div>
	  		<div class="form-group">
	  				<form:label path="confirm">Confirm password:</form:label><br>
	  				<form:input path="confirm" class="form-control" type="password"/>
	  				<form:errors path="confirm" class="text-danger"/>
	  		</div>
	  			<input type="submit" class="btn btn-primary" value="Register"/>
		</form:form>
	
	</div>
	<div class="container mt-5">		
			<h1>Login</h1>
			<form:form action="/login" method="POST" modelAttribute="newLogin">
				<div class="form-group">
	   				<form:label path="email">Email:</form:label><br>
	   				<form:input path="email" class="form-control"/>
	   				<form:errors path="email" class="text-danger"/>
	   			</div>
	   			<div class="form-group">
	   				<form:label path="password">Password:</form:label><br>
	   				<form:input path="password" class="form-control" type="password"/>
	   				<form:errors path="password" class="text-danger"/>
	   			</div>
	   			<input type="submit" class="btn btn-success" value="Login"/>
			</form:form>
	</div>
</body>
</html>