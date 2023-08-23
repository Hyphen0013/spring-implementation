<%@page import="hyphen.entity.Specalist"%>
<%@page import="hyphen.dao.SpecalistDao"%>
<%@page import="hyphen.helper.HelperFunction"%>
<%@page import="hyphen.entity.Doctor"%>
<%@page import="hyphen.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Doctor List - Add doctor</title>
	<%@include file="../header_link.jsp"%>
	
	<link rel="stylesheet" href="../css/style.css">
	
<style type="text/css">
	.badge-btn {
		padding: 4px 6px;
		border: 1px solid #ddcccc;
		display: flex;
		border-radius: 4px;
		cursor: pointer;
	}
</style>
</head>
<body class="bg-light">

	<%@include file="admin_navbar.jsp"%>
	
	<c:if test="${empty adminObj}">
		<c:redirect url="../admin_logout"></c:redirect>
	</c:if>

	<div class="container-fluid pt-2"> 
	
		<!-- OUR TEAMs  -->
		<div class="media text-muted pt-3 mb-0">
			<img
				data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
				alt="32x32" class="mr-2 rounded"
				src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
				data-holder-rendered="true" style="width: 32px; height: 32px;">
			
			<nav aria-label="breadcrumb" class="media-body mb-0 lh-125 border-bottom border-gray">
			  <ol class="breadcrumb" style="background: none; padding-bottom: 0;">
			    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
			    <li class="breadcrumb-item active" style="display: flex;">Add Doctors - 
			   		<small class="nav-link mb-0 badge-btn" style="margin-left 5px;"> list of doctors </small>
			    </li>
			  </ol>
			</nav>

			<c:if test="${not empty successMsg}">
				<div style="z-index: 1; position: absolute; right: 0; margin-right: 5px;">
					<div class="alert-div" id="success-alert" style="position: relative">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							<strong>${successMsg}</strong>

							<hr>
							<p class="mb-0">Close the message box by clicking X to
								right.</p>

							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</div>
					<c:remove var="successMsg" />
			</c:if>

			<c:if test="${not empty errorMsg}">
				<div style="z-index: 1; position: absolute; right: 0;">
					<div class="alert-div" id="error-alert">
						<div class="alert alert-danger alert-dismissible fade show"
							role="alert">
							<strong>${errorMsg}</strong>

							<hr>
							<p class="mb-0">Close the message box by clicking X to
								right.</p>
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</div>
				<c:remove var="errorMsg" />
			</c:if>
		</div>

		<div class="row">

			<!-- LEFT DIV  -->
			<div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 mt-3"> 
					<div class="card">
						<div class="card-body">
							<div>
								<h1 class="badge badge-primary" style="font-size: x-large;">
									  Add Doctor
								</h1>

							</div>

							<form method="POST" action="../add_doctor" autocomplete="off">
								<div class="form-group">
									<label for="name">Full Name</label>
									<input type="text" name="name" id="name" class="form-control">
								</div>								
								<div class="form-group">
									<label for="email">Enter Email</label>
									<input type="text" name="email" id="email" class="form-control">
								</div>
								<div class="form-group">
									<label for="password">Enter Password</label>
									<input type="text" name="password" id="password" class="form-control">
								</div>								
								<div class="form-group">
									<label for="dob">Date Of Birth</label>
									<input type="date" name="dob" id="dob" class="form-control">
								</div>								
								<div class="form-group">
									<label for="qualification">Qualification</label>
									<input type="text" name="qualification" id="qualification" class="form-control">
								</div>
								<div class="form-group">
									<label for="specialist">Specialist</label>
									<select class="form-control" name="specialist" id="specialist">
										<option vlaue="" disabled selected>Select</option>
										
									<% 
										SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
										List<Specalist> list = dao.getAllSpecialist();
										
										for(Specalist s : list) {
									%>
										<option vlaue="<%= s.getId() %>"><%= s.getSpecialistName() %></option>
									<% } %>
									</select>
								</div>	
								<div class="form-group">
									<label for="mobno">Mobile Number</label>
									<input type="text" name="mobno" id="mobno" class="form-control">
								</div>

								<div class="bg-white rounded box-shadow border-top border-gray mb-0 pt-2">
									<button type="submit" class="btn btn-primary">Add Doctor</button>						
								</div>
							</form>						
							
						</div>
					</div>				
			</div>
			<!-- LEFT DIV END  -->

			<!-- RIGHT DIV  -->
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 mt-3">

				<div class="card">
					<div class="card-body table-responsive">
							<h1 class="badge badge-primary" style="font-size: xx-large;">
								  All Doctors's Details <span class="badge" style="font-size: x-large; margin-left: 10px;  background-color: rgb(233,84,140)">list</span>				
							</h1>					
							
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#id</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Specialist</th>
									<th scope="col">Qualification</th>
									<th scope="col">DOB</th>
									<th scope="col">Mobile</th>
									<th scope="col">Edit</th>
								</tr>
							<tbody>
							
								<%
									DoctorDao docDao = new DoctorDao(DBConnect.getConnection());
									List<Doctor> docList = docDao.getAllDoctors();
									
									for(Doctor doc : docList) {
									String date = HelperFunction.formateDate(doc.getDob(), "-");
								%>
									<tr>
										<td><%= doc.getDoc_id() %></td>
										<td><%= doc.getName() %></td>
										<td><%= doc.getEmail() %></td>
										<td><%= doc.getSpecialist() %></td>
										<td><%= doc.getQualification() %></td>
										<td><%= date %> </td>
										<td><%= doc.getMobno() %></td>
										<td style="display: flex; gap: 6px;">
											<a class="custom-btn edit-btn" href="edit_doctor.jsp?id=<%= doc.getDoc_id()%>"><i class="fa fa-edit fa-btn"></i></a>
											<a class="custom-btn delete-btn" href="../delete_doctor?id=<%= doc.getDoc_id()%>"><i class="fa fa-trash fa-btn"></i></a>
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
			<!-- RIGHT DIV END -->

		</div>

	</div>


	<%@include file="../footer_link.jsp"%>
	
	
</body>
</html>