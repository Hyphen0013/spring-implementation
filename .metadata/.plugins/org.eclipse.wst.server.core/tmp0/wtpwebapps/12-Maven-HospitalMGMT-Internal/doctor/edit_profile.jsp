<%@page import="hyphen.entity.Specalist"%>
<%@page import="hyphen.dao.SpecalistDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hyphen.helper.HelperFunction"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="hyphen.dao.DoctorDao"%>
<%@page import="hyphen.entity.Doctor"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doctor Page</title>
<%@include file="../header_link.jsp"%>
<link rel="stylesheet" href="../css/style.css">

</head>
<body class="bg-light">

	<%@include file="navbar.jsp"%>

	<c:if test="${empty doctorObj}">
		<c:redirect url="../doctor_logout"></c:redirect>
	</c:if>
	<div class="container pt-2">

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
			    <li class="breadcrumb-item active" aria-current="">Profile Page</li>
			  </ol>
			</nav>
			
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
							
		</div>
		
		<%
			Doctor doc = (Doctor) session.getAttribute("doctorObj");
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");  
		    formatter = new SimpleDateFormat("dd MMMM yyyy");
		    String date = formatter.format(doc.getCreatedAt());
		%>		
		
		<header class="header mb-5">
			<h1 id="title" class="text-center">Doctor Profile's</h1>
			<p id="description" class="text-center">Here you can change your password and Details!</p>
		</header>
	
		<!-- DOCTOR'S DETIALS  -->
		<div class="my-3 p-3 bg-white rounded box-shadow">
			<h6 class="border-bottom border-gray pb-2 mb-0" style="display: flex; justify-content: space-between; align-items: baseline;">
				Specialist - ${doctorObj.specialist}
				<small class="d-block text-right mt-3">
					Created on - <%= date  %>
				</small>
			</h6>
			<div class="media text-muted pt-3">
				<img
					data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1"
					alt="32x32" class="mr-2 rounded"
					src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18963a589ab%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18963a589ab%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
					data-holder-rendered="true" style="width: 32px; height: 32px;">
					
				<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Full Name</strong>
					</div>
					<span class="d-block">${doctorObj.name}</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<img
					data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1"
					alt="32x32" class="mr-2 rounded"
					src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18963a589ab%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18963a589ab%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
					data-holder-rendered="true" style="width: 32px; height: 32px;">
					
				<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Email</strong>
					</div>
					<span class="d-block">${doctorObj.email}</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<img
					data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1"
					alt="32x32" class="mr-2 rounded"
					src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18963a589ab%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18963a589ab%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
					data-holder-rendered="true" style="width: 32px; height: 32px;">
					
				<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Qualification</strong>
					</div>
					<span class="d-block">${doctorObj.qualification	}</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<img
					data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1"
					alt="32x32" class="mr-2 rounded"
					src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18963a589ab%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18963a589ab%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
					data-holder-rendered="true" style="width: 32px; height: 32px;">
					
				<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Mobile Number</strong>
					</div>
					<span class="d-block">${doctorObj.mobno}</span>
				</div>
			</div>
			<div class="media text-muted pt-3">
				<img
					data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1"
					alt="32x32" class="mr-2 rounded"
					src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18963a589ab%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18963a589ab%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
					data-holder-rendered="true" style="width: 32px; height: 32px;">
					
				<div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
					<div class="d-flex justify-content-between align-items-center w-100">
						<strong class="text-gray-dark">Date of Birth</strong>
					</div>
					<span class="d-block"><%= HelperFunction.formateDate(doc.getDob(), "-") %></span>
				</div>
			</div>			
										
	


			<small class="d-block text-right mt-3">
				<a href="javascript:void(0)" data-toggle="modal" data-target="#edit_profile">Edit Profile</a>
			</small>

		</div>
		
		<!-- PASSWROD SECTION  -->
		<div class="jumbotron bg-white rounded box-shadow" style="padding: 2rem 1rem;">
			<div class="col-sm-8 mx-auto">
				<h1>Change Password</h1>
				<p>
					Your masked password<code>. <%= HelperFunction.maskedPassword(doc.getPassword()) %></code>
					.
				</p>
				<p>
					<a class="btn btn-primary" href="javascript:void(0)" data-toggle="modal" data-target="#change_password">Click to open frame »</a>
				</p>
			</div>
		</div>

	</div>


	<!-- MODAL PASSWORD  -->
	<div class="modal fade" id="change_password" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
					<div class="media text-muted mb-0">
		          		<p class="media-body mb-0">
		          	  		<strong class="text-gray-dark" style="display: flex; gap: 15px;">Update Password</strong>
			          	</p>
			        </div>				
				
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form method="POST" action="../update_doc_password" autocomplete="off">
						<input type="hidden" name="doc_id" value="${doctorObj.doc_id}" />
						<input type="hidden" name="email" value="${doctorObj.email}" />
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="old_password">Enter Old Password </label>
									<input type="text" name="old_password" id="old_password" class="form-control" placeholder="Enter your current password">
								</div>
							</div>
	
							<div class="col-md-12">
								<div class="form-group">
									<label for="password">New Password </label>
									<input type="text" name="password" id="password" class="form-control" placeholder="Enter your new password">
								</div>
							</div>
	
							<div class="col-md-12">
								<div class="form-group">
									<label for="confirm_pass">Confirm Password </label>
									<input type="text" name="confirm_pass" id="confirm_pass" class="form-control" placeholder="Re-enter your password">
								</div>
							</div>
						</div>												
						
						<div class="modal-footer pr-0">
							<button type="submit" class="btn btn-primary">Uave Password</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL PASSWORD END -->
	
	<!-- MODAL PROFILE  -->
	<div class="modal fade bd-example-modal-xl" id="edit_profile" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
					<div class="media text-muted mb-0">
		          		<p class="media-body mb-0">
		          	  		<strong class="text-gray-dark" style="display: flex; gap: 15px;">Edit Profile</strong>
			          	</p>
			        </div>				
				
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
				
					<form method="POST" action="../edit_doc_profile" autocomplete="off">
						<input type="hidden" name="doc_id" value="${doctorObj.doc_id}" />
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">Full Name </label>
									<input type="text" name="name" id="name" value="${doctorObj.name}" class="form-control" placeholder="Enter full name">
								</div>
							</div>
	
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">Enter Email </label>
									<input type="text" name="email" id="email" value="${doctorObj.email}" class="form-control" placeholder="Enter your email">
								</div>
							</div>
						</div>
	
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="qualification">Specialist </label>
									<select class="form-control" name="specialist" id="specialist">
										<option vlaue="" disabled selected>Select</option>
										
									<% 
										SpecalistDao dao = new SpecalistDao(DBConnect.getConnection());
										List<Specalist> list = dao.getAllSpecialist();
										
										for(Specalist s : list) {
									%>
										<option vlaue="<%= s.getId() %>" 
											<% 
												if(s.getSpecialistName().equals(doc.getSpecialist() )) {
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
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="mobno">Mobile Number </label>
									<input type="text" name="mobno" id="mobno" value="${doctorObj.mobno}" class="form-control" placeholder="Enter your mobile number">
								</div>
							</div>							
						</div>						
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label for="qualification">Qualification </label>
									<input type="text" name="qualification" id="qualification" value="${doctorObj.qualification}"  class="form-control" placeholder="Enter your qualification">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="dob">Date Of Birth </label>
									<input type="date" name="dob" id="dob" value="${doctorObj.dob}"  class="form-control" placeholder="Enter your mobile number">
								</div>
							</div>							
						</div>										
						
						<div class="modal-footer pr-0">
							<button type="submit" class="btn btn-primary">Update Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL PROFILE END -->	
	
	<%@include file="../footer_link.jsp"%>
</body>
</html>


