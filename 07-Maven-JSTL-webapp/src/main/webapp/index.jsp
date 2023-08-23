<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="navbar.jsp"></c:import>
	
	<h1>Hello Hyphen</h1>
	<c:out value="Hello Hyphen"></c:out>
	<br>
	
	<c:import url="dataprint.jsp" var="data"></c:import>
	<c:out value="${data}"></c:out>
	<hr>
	
	<c:set var="result" value="${5 * 3}" scope="session"></c:set>
	<c:out value="${result}"></c:out>
</body>
</html>