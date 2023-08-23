<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page errorPage="error_page.jsp" %>
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Taglib Directive Example</h1>
	
	<c:set var="name" value="Hyphen Call"></c:set>
	
	<c:out value="${name}"></c:out>
	<%
		String firstName = null;
	%>
	<c:out value="${firstName.length()}"></c:out>
</body>
</html>