<%@page import="hyphen.entity.Specalist"%>
<%@page import="hyphen.dao.SpecalistDao"%>
<%@page import="hyphen.helper.HelperFunction"%>
<%@page import="hyphen.entity.Doctor"%>
<%@page import="hyphen.dao.DoctorDao"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="java.sql.Connection"%>

<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Doctor</title>
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

	<div class="container pt-2">

		<!-- OUR TEAMs  -->
		<div class="media text-muted pt-3 mb-0">
			<img
				data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
				alt="32x32" class="mr-2 rounded"
				src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
				data-holder-rendered="true" style="width: 32px; height: 32px;">

			<p class="media-body mb-0 lh-125 border-bottom border-gray">
				<strong class="text-gray-dark mb-3"
					style="display: flex; gap: 15px; font-size: 150%"> <a
					class="nav-link mb-0 badge-btn" href="index.jsp">Doctor's
						Details</a>
				</strong>

				<c:if test="${not empty successMsg}">
					<div
						style="z-index: 1; position: absolute; right: 0; margin-right: 5px;">
						<div class="alert-div" id="success-alert"
							style="position: relative">
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

			</p>
		</div>

		<div class="row">

			<!-- LEFT DIV  -->
			<div class="col-md-8 offset-md-2 mt-3">
				<div class="card">
					<div class="card-body">
						<div>
							<h1 class="badge badge-primary" style="font-size: x-large;">
								Add Doctor <span class="badge" style="font-size: x-large; margin-left: 10px; background-color: rgb(233,84,140)">Informations</span>
							</h1> 
						</div>
						
						<%
							int id = Integer.parseInt(request.getParameter("id"));
							DoctorDao doa2 = new DoctorDao(DBConnect.getConnection());
							Doctor doc2 = doa2.getDoctorById(id);
						%>
						<form method="POST" action="../update_doctor" autocomplete="off">
							<div class="form-group">
								<label for="name">Full Name</label> <input type="text"
									name="name" id="name" value="<%= doc2.getName() %>" class="form-control">
							</div>
							<div class="form-group">
								<label for="email">Enter Email</label> <input type="text"
									name="email" id="email" value="<%= doc2.getEmail() %>" class="form-control">
							</div>
							<div class="form-group">
								<label for="dob">Date Of Birth</label> <input type="date"
									name="dob" id="dob" value="<%= doc2.getDob() %>" class="form-control">
							</div> 
							<div class="form-group">
								<label for="qualification">Qualification</label> <input
									type="text" name="qualification" value="<%= doc2.getQualification() %>" id="qualification"
									class="form-control">
							</div>
							<div class="form-group">
								<label for="specialist">Specialist</label> <select
									class="form-control" name="specialist" id="specialist">
									<option vlaue="" disabled selected>Select</option>

									<% 
										SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
										List<Specalist> list = dao.getAllSpecialist();
										
										for(Specalist s : list) {
									%>
										
											<option vlaue="<%= s.getId() %>" 
												<% 
													if(s.getSpecialistName().equals(doc2.getSpecialist() )) {
												%>	
													selected
												<%
													} else {
												%>
													""
												<%	
													}
												%>
											>
													<%= s.getSpecialistName() %>
											</option>										
									<% } %>
								</select>
							</div>
							<div class="form-group">
								<label for="mobno">Mobile Number</label> <input type="text"
									name="mobno" id="mobno" value="<%= doc2.getMobno() %>" class="form-control">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input
									type="text" name="password" value="<%= doc2.getPassword() %>" id="password"
									class="form-control">
							</div>
							
							<input type="hidden" name="id" value="<%= doc2.getDoc_id() %>"/>
							<div
								class="bg-white rounded box-shadow border-top border-gray mb-0 pt-2">
								<button type="Update" class="btn btn-primary">Add
									Doctor</button>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- LEFT DIV END  -->

		</div>

	</div>


	<%@include file="../footer_link.jsp"%>


</body>
</html>