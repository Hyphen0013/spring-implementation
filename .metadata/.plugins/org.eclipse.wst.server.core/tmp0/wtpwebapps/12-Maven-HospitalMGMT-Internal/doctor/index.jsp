<%@page import="hyphen.entity.Doctor"%>
<%@page import="hyphen.dao.TableHelpers"%>
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
	<title>Doctor Page</title>
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

.circle_card {
	position: absolute;
	top: 40%;
	left: 42%;
	padding: 5px;
	width: 50px;
	height: 50px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	background: rgba( 255, 255, 255, 0.25 );
	box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
	backdrop-filter: blur( 4px );
	-webkit-backdrop-filter: blur( 4px );
	border: 1px solid rgba( 255, 255, 255, 0.18 );	
}
</style>
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
			    <li class="breadcrumb-item active" style="display: flex;">Doctor's Dashboard </li>
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

		<% 
			TableHelpers dao = new TableHelpers(DBConnect.getConnection());
			Doctor docId = (Doctor) session.getAttribute("doctorObj");
		%>

		<div class="row">
		
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start" style="position: relative;">
						<div class="circle_card">
							<strong class="d-inline-block mb-2" style="font-size: 2rem; color: #000000b0;"><%= dao.countRowFromTable("appointment", "appointment", docId.getDoc_id()) %></strong>
						</div>

						<h3 class="mb-0">
							<a class="text-dark" href="javascript:void(0)" style="font-size: x-large;">Doctor</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 6rem; align-self: center;">
							<i class="fa fa-user-md"></i>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start" style="position: relative;">
						<div class="circle_card">
							<strong class="d-inline-block mb-2" style="font-size: 2rem; color: #000000b0;"><%= dao.countRowFromTable("appointment", "doctor", docId.getDoc_id()) %></strong>
						</div>

						<h3 class="mb-0">
							<a class="text-dark" href="javascript:void(0)" style="font-size: x-large;">Total Appointment</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 6rem; align-self: center;">
							<i class="fa fa-calendar-check-o"></i>
						</div>

					</div>
				</div>
			</div>

		</div>

	</div>


	<%@include file="../footer_link.jsp"%>
	
	
</body>
</html>