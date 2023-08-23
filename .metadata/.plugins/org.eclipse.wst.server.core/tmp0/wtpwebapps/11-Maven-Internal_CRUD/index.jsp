<%@page import="hyphen.helper.HelperFunction"%>
<%@page import="hyphen.entity.Student"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.dao.StudentDao"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="java.sql.Connection"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home Page</title>
	<%@include file="header_link.jsp"%>
</head>
<body class="bg-light">

	<%@include file="navbar.jsp"%>


	<div class="container">
		<div class="row">
			<div class="col-md-10 mt-5">
				<div class="card">
					<div class="card-body table-responsive">
							<h1 class="badge badge-primary" style="font-size: xx-large;">
								  All Student Details <span class="badge" style="font-size: x-large; margin-left: 10px;  background-color: rgb(233,84,140)">list</span>				
							</h1>
							
							<c:if test="${not empty successMsg}">
								<div class="alert-div">
									<div class="alert alert-success alert-dismissible fade show" role="alert">
									  <strong>${successMsg}</strong>
									  
									  <hr>
									  <p class="mb-0">Close the message box by clicking X to right.</p>
									  
									  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
									    <span aria-hidden="true">&times;</span>
									  </button>
									</div>									
								</div>
								<c:remove var="successMsg"/>							
							</c:if>
							
							<c:if test="${not empty errorMsg}">
								<div class="alert-div">
									<div class="alert alert-danger alert-dismissible fade show" role="alert">
									  <strong>${errorMsg}</strong>
									  
									  <hr>
									  <p class="mb-0">Close the message box by clicking X to right.</p>										  
									  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
									    <span aria-hidden="true">&times;</span>
									  </button>
									</div>									
								</div>
								<c:remove var="errorMsg"/>							
							</c:if>						
							
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#id</th>
									<th scope="col">Name</th>
									<th scope="col">Level</th>
									<th scope="col">Email</th>
									<th scope="col">Password</th>
									<th scope="col">DOB</th>
									<th scope="col">Edit</th>
								</tr>
							</thead>
							<tbody>
							
								<%
									StudentDao dao = new StudentDao(DBConnect.getConnection());
									List<Student> list = dao.getAllStudent();
									
									for(Student stud : list) {
									String date = HelperFunction.formateDate(stud.getDob(), "-");
								%>
									<tr>
										<td><%= stud.getId() %></td>
										<td><%= stud.getName() %></td>
										<td><%= stud.getLevel() %></td>
										<td><%= stud.getEmail() %></td>
										<td><%= stud.getPassword() %></td>
										<td><%= date %></td>
										<td style="display: flex; gap: 6px;">
											<a class="custom-btn edit-btn" href="edit_student.jsp?id=<%= stud.getId()%>"><i class="fa fa-edit fa-btn"></i></a>
											<a class="custom-btn delete-btn" href="delete?id=<%= stud.getId()%>"><i class="fa fa-trash fa-btn"></i></a>
										</td>
									</tr>								
								<% 
									}
								%>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>		
		</div>
	</div>

	<%@include file="footer_link.jsp"%>
</body>
</html>