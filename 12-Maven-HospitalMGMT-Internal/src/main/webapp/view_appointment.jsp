
<%@page import="hyphen.helper.HelperFunction"%>
<%@page import="hyphen.entity.Student"%>
<%@page import="hyphen.entity.Appointment"%>
<%@page import="hyphen.dao.AppointmentDAO"%>
<%@page import="hyphen.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.dao.DoctorDao"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Appointment List</title>
<%@include file="header_link.jsp"%>
<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="css/style.css">
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
	<%@include file="navbar.jsp"%>

	<div class="container pt-2"> 
	
		<c:if test="${empty userObj}">
			<c:redirect url="user_login.jsp"></c:redirect>
		</c:if>

		<div class="media text-muted pt-3 mb-0">
			<img
				data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
				alt="32x32" class="mr-2 rounded"
				src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
				data-holder-rendered="true" style="width: 32px; height: 32px;">
			
			<nav aria-label="breadcrumb" class="media-body mb-0 lh-125 border-bottom border-gray">
			  <ol class="breadcrumb" style="background: none; padding-bottom: 0;">
			    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="">Appointment List</li>
			  </ol>
			</nav>
			<c:if test="${not empty successMsg}">
				<div
					style="z-index: 1; position: absolute; right: 0; margin-right: 5px;">
					<div class="alert-div" id="success-alert" style="position: relative">
						<div class="alert alert-success alert-dismissible fade show"
							role="alert">
							<strong>${successMsg}</strong>
	
							<hr>
							<p class="mb-0">Close the message box by clicking X to right.</p>
	
							<button type="button" class="close" data-dismiss="alert"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
					</div>
				</div>
				<c:remove var="successMsg" />
			</c:if>
		</div>

		<c:if test="${not empty errorMsg}">
			<div style="z-index: 1; position: absolute; right: 0;">
				<div class="alert-div" id="error-alert">
					<div class="alert alert-danger alert-dismissible fade show"
						role="alert">
						<strong>${errorMsg}</strong>

						<hr>
						<p class="mb-0">Close the message box by clicking X to right.</p>
						<button type="button" class="close" data-dismiss="alert"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
				</div>
			</div>
			<c:remove var="errorMsg" />
		</c:if>



		<header class="header mb-5">
			<h1 id="title" class="text-center">List of Appointments</h1>
			<p id="description" class="text-center">Here all list of appointments</p>
		</header>

			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 mt-3">

				<div class="card">
					<div class="card-body table-responsive">
							<h1 class="badge badge-primary" style="font-size: xx-large;"> 
								  Appointments <span class="badge" style="font-size: 1.2rem; margin-left: 10px;  background-color: rgb(233,84,140)">List of Appointments</span>				
							</h1>					
							
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">#id</th>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appointment Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
								</tr>
							<tbody>
								<%
									Student stud = (Student) session.getAttribute("userObj");
									AppointmentDAO dao = new AppointmentDAO(DBConnect.getConnection());
									DoctorDao docDao = new DoctorDao(DBConnect.getConnection());
									
									List<Appointment> list = dao.getAllAppointmentByLoginUser(stud.getId());
									
									for(Appointment appon : list) {
										Doctor doc = docDao.getDoctorById(appon.getDoc_id());
								%>
									<tr>
										<td><%= appon.getAppon_id() %></td>
										<td><%= appon.getName() %></td>
										<td><%= appon.getGender() %></td>
										<td><%= appon.getAge() %></td>
										<td><%= HelperFunction.formateDate(appon.getAppon_date(), "-") %></td>
										<td><%= appon.getDisease() %></td>
										<td>
											<%= doc.getName() %> <br>
											(<small><%= doc.getSpecialist() %></small>)
										</td>
										<td>
											<%
												if(appon.getStatus_updateAt() == null) {
											%>
												<%= HelperFunction.buttonFormat(appon.getAppon_status(), "small", "pending", "yes") %>
											<% } else { %>
												<%= HelperFunction.buttonFormat(appon.getAppon_status(), "small", "ok", "yes") %>
											<% } %>
											
											
										</td>
										
										<td style="display: flex; gap: 6px;">
											<a class="custom-btn edit-btn" href="edit_view_appointment.jsp?id=<%= appon.getAppon_id() %>" style="padding: 0px 8px;">
												<i class="fa fa-edit fa-btn"></i>
											</a>
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

	<%@include file="footer_link.jsp"%>
</body>
</html>