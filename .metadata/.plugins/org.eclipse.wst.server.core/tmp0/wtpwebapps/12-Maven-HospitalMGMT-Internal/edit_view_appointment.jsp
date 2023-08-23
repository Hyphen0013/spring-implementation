<%@page import="java.util.Arrays"%>
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
<title>User - Edit View Appointment</title>
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
	
	<c:if test="${empty userObj}">
		<c:redirect url="user_login.jsp"></c:redirect>
	</c:if>
		
	<div class="container pt-2 mb-5"> 

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



		<header class="header mb-5">
			<h1 id="title" class="text-center">Take Appointment</h1>
			<p id="description" class="text-center">Thank you for Appointment, we will connect you shortly</p>
		</header>
		
		<div class="custom-form">
			<div class="form-wrap">
			
			<%
				int id = Integer.parseInt(request.getParameter("id"));
				AppointmentDAO apponDao = new AppointmentDAO(DBConnect.getConnection());
				Appointment appon = apponDao.getAllAppointmentByApponID(id, "appointment");
			%>
			
				<form id="take-appontment" action="edit_user_appointment" method="POST">
					
					<input type="hidden" name="userId" value="${userObj.id}" />
					<div class="row">	
						<div class="col-md-6">
							<div class="form-group">
								<label for="name">Full Name</label>
								<input type="text" name="name" id="name" value="<%= appon.getName() %>" placeholder="Enter your name" class="form-control" required>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="gender">Gender</label>
								<select id="gender" name="gender" class="form-control" required>
								<%
									String[] genderArr = {"Male", "Female", "Other"};
								%>
									<option disabled selected>Select</option>
								<%
									for(String gender : genderArr) {
								%>
									<option value="<%= gender %>" <% 
										if(gender.equals(appon.getGender())) {
									%> selected
									<%
										}
									%>>
									<%= gender %></option>
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
								<label for="age">Age </label>
								<input type="text" name="age" id="age" value="<%= appon.getAge() %>" min="10" max="99" class="form-control" placeholder="Age">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="appon_date">Appointment Date
								<input type="date" name="appon_date" id="appon_date" value="<%= appon.getAppon_date() %>" class="form-control">
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Email
								<input type="email" name="email" id="email" value="<%= appon.getEmail() %>" class="form-control" placeholder="Enter Email">
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<label for="mobno">Phone Number
								<input type="text" name="mobno" id="mobno" value="<%= appon.getMobno() %>" class="form-control" placeholder="Enter phone number">
							</div>
						</div>
					</div>
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="disease">Diseases
								<input type="text" name="disease" id="disease" value="<%= appon.getDisease() %>" class="form-control" placeholder="Enter type of disease">
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
										<option value="<%= doc.getDoc_id() %>"
											<% if(doc.getDoc_id() == appon.getDoc_id()) { %>
												selected
											<% } %>
										>
										
										<%= doc.getName() %> (<%= doc.getSpecialist() %>)</option>
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
									<input type="radio" id="definitely" value="Definitely" name="survey_recom" class="custom-control-input"
										<% if(appon.getSurvey_recom().equals("Definitely")) { %>
											checked
										<% } %>
									>
									<label class="custom-control-label" for="definitely">Definitely</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="maybe" value="Maybe" name="survey_recom" class="custom-control-input"
										<% if(appon.getSurvey_recom().equals("Maybe")) { %>
											checked
										<% } %>									
									>
									<label class="custom-control-label" for="maybe">Maybe</label>
								</div>
								<div class="custom-control custom-radio custom-control-inline">
									<input type="radio" id="not_sure" value="Not sure" name="survey_recom" class="custom-control-input"
										<% if(appon.getSurvey_recom().equals("Not sure")) { %>
											checked
										<% } %>									
									>
									<label class="custom-control-label" for="not_sure">Not
										sure</label>
								</div>
							</div>
						</div>
	
						<div class="col-md-6">
							<div class="form-group">
								<label>How you get this know about this hospital?</label>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Friends" id="by_friends"
										<% 
											String frndInfo = appon.getAppon_info();
							      		  	String[] frndInfoArr = frndInfo.split(",");
								        	boolean frndCheck = Arrays.asList(frndInfoArr).contains("Friends");
											if(frndCheck) { %>
												checked
										<% 	} %>									
									>
									<label class="custom-control-label" for="by_friends">Friends</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Relatives" id="by_relatives"
										<% 
											String reltvsInfo = appon.getAppon_info();
							      		  	String[] reltvsInfoArr = reltvsInfo.split(",");
								        	boolean reltvsCheck = Arrays.asList(reltvsInfoArr).contains("Relatives");
											if(reltvsCheck) { %>
												checked
										<% 	} %>									
									>
									<label class="custom-control-label" for="by_relatives">Relatives</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Online" id="by_online"
										<% 
											String onlineInfo = appon.getAppon_info();
							      		  	String[] onlineInfoArr = onlineInfo.split(",");
								        	boolean onlineCheck = Arrays.asList(onlineInfoArr).contains("Online");
											if(onlineCheck) { %>
												checked
										<% 	} %>									
									>
									<label class="custom-control-label" for="by_online">Online</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Newspapers" id="by_news"
										<% 
											String newsInfo = appon.getAppon_info();
							      		  	String[] newsInfoArr = newsInfo.split(",");
								        	boolean newsCheck = Arrays.asList(newsInfoArr).contains("Newspapers");
											if(newsCheck) { %>
												checked
										<% 	} %>									
									>
									<label class="custom-control-label" for="by_news">Newspapers</label>
								</div>
								<div class="custom-control custom-checkbox custom-control-inline">
									<input type="checkbox" class="custom-control-input" name="appon_info" value="Advertisements" id="by_adds"
										<% 
											String advInfo = appon.getAppon_info();
							      		  	String[] adInfoArr = advInfo.split(",");
								        	boolean adCheck = Arrays.asList(adInfoArr).contains("Advertisements");
											if(adCheck) { %>
												checked
										<% 	} %>									
									>
									<label class="custom-control-label" for="by_adds">Advertisements</label>
								</div>								
							</div>
						</div>
						
					</div>	
					
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<label for="email">Address
								<input type="text" name="address" id="address" value="<%= appon.getAddress() %>" class="form-control" placeholder="Enter address">
							</div>
						</div>
					</div>														
	
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="comments">Leave Message <small class="text-muted">(optional)</small> </label>
								<textarea id="comments" class="form-control" name="comments"
									placeholder="Enter your comment here..."><%= appon.getComments()%></textarea>
							</div>
						</div>
					</div>
	
					<div class="row">
						<div class="col-md-4">
							<c:if test="${ empty userObj }">
								<a href="user_login.jsp" style="text-decoration: none;">
									<button type="submit" id="submit" class="btn btn-primary btn-block">Update Appointment</button>
								</a>
							</c:if>
							<c:if test="${not empty userObj }">
								<a href="index.jsp" style="text-decoration: none;">
									<button type="submit" id="submit" class="btn btn-primary btn-block">Update Appointment</button>
								</a>
							</c:if>							
						</div>
					</div>
					
					<input type="hidden" name="id" value="<%= appon.getAppon_id() %>" />
				</form>
			</div>
		</div>


	</div>

	<%@include file="footer_link.jsp"%>
</body>
</html>