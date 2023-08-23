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
<title>User - Take Appointment</title>
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

	<div class="container mb-5"> 
	
		<div class="media text-muted pt-3 mb-0">
			<img
				data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
				alt="32x32" class="mr-2 rounded"
				src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
				data-holder-rendered="true" style="width: 32px; height: 32px;">
			
			<nav aria-label="breadcrumb" class="media-body mb-0 lh-125 border-bottom border-gray">
			  <ol class="breadcrumb" style="background: none; padding-bottom: 0;">
			    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="">Take Appointment</li>
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
		</div>

		<header class="header mb-5">
			<h1 id="title" class="text-center">Take Appointment</h1>
			<p id="description" class="text-center">Thank you for Appointment, we will connect you shortly</p>
		</header>
		
		<div class="custom-form">
			<div class="form-wrap">
			<c:if test="${not empty userObj }">
				<form id="take-appontment" action="add_user_appointment" method="POST">
			</c:if>	
			<c:if test="${ empty userObj }">
				<form id="take-appontment">
			</c:if>	
					<input type="hidden" name="userId" value="${userObj.id}" />
					<div class="row">	
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Full Name</label>
								<input type="text" name="name" id="name" placeholder="Enter your name" class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="gender">Gender</label>
								<select id="gender" name="gender"
									class="form-control" required>
									<option disabled selected value>Select</option>
									<option value="Male">Male</option>
									<option value="Female">Female</option>
									<option value="other">Other</option>
								</select>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="age">Age </label>
								<input type="text" name="age" id="age" min="10" max="99" class="form-control" placeholder="Age">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="appon_date">Appointment Date
								<input type="date" name="appon_date" id="appon_date" class="form-control">
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Email
								<input type="email" name="email" id="email" class="form-control" placeholder="Enter Email">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="mobno">Phone Number
								<input type="text" name="mobno" id="mobno" class="form-control" placeholder="Enter phone number">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="disease">Diseases
								<input type="text" name="disease" id="disease" class="form-control" placeholder="Enter type of disease">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="doc_id">Doctor</label>
								<select name="doc_id" id="doc_id" class="form-control" required>
									<option disabled selected value>Select</option>
									<%
										DoctorDao dao = new DoctorDao(DBConnect.getConnection());
										List<Doctor> docList = dao.getAllDoctors();
										
										for(Doctor doc : docList) {
									%>
										<option value="<%= doc.getDoc_id() %>"><%= doc.getName() %> (<%= doc.getSpecialist() %>)</option>
									<%
										}
									%>	
									
								</select>
							</div>
						</div>
					</div>		
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label>Would you recommend survey to a friend?</label>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="definitely" value="Definitely"
										name="survey_recom" class="custom-control-input"
										checked="">
									<label class="custom-control-label" for="definitely">Definitely</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="maybe" value="Maybe"
										name="survey_recom" class="custom-control-input">
									<label class="custom-control-label" for="maybe">Maybe</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="not_sure" value="Not sure"
										name="survey_recom" class="custom-control-input">
									<label class="custom-control-label" for="not_sure">Not
										sure</label>
								</div>
							</div>
						</div>
	
						<div class="col-md-6">
							<div class="form-group">
								<label>How you get this know about this hospital?</label>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Friends" id="by_friends" checked="">
									<label class="custom-control-label" for="by_friends">Friends</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Relatives" id="by_relatives">
									<label class="custom-control-label" for="by_relatives">Relatives</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Online" id="by_online">
									<label class="custom-control-label" for="by_online">Online</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Newspapers" id="by_news">
									<label class="custom-control-label" for="by_news">Newspapers</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Advertisements" id="by_adds">
									<label class="custom-control-label" for="by_adds">Advertisements</label>
								</div>								
							</div>
						</div>
						
					</div>	
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Address
								<input type="text" name="address" id="address" class="form-control" placeholder="Enter address">
							</div>
						</div>
					</div>														
	
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="comments">Leave Message <small class="text-muted">(optional)</small> </label>
								<textarea id="comments" class="form-control" name="comments"
									placeholder="Enter your comment here..."></textarea>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-4">
							<c:if test="${ empty userObj }">
								<a href="user_login.jsp" class="btn btn-primary btn-block" style="text-decoration: none;">
									Submit Appointment
								</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<a href="index.jsp" style="text-decoration: none;">
									<button type="submit" id="submit" class="btn btn-primary btn-block">Submit Appointment</button>
								</a>
							</c:if>							
						</div>
					</div>
	
				</form>
			</div>
		</div>


	</div>

	<%@include file="footer_link.jsp"%>
</body>
</html>