<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>First Dynamci Project</title>
</head>
<body>
	<h1>3 Ways to create Servlet </h1>
	<p>Using ServletInterface</p>
	<a href="app">Click for ServletInterface</a>
	
	<p>Using GenericServlet</p>
	<a href="app2">Click for GenericServlet</a>
	
	<p>Using HttpServlet</p>
	<a href="app3">Click for HttpServlet</a>	
	<form action="app3" method="POST">
		<button type="submit">Submit POST</button>
	</form>
</body>
</html>