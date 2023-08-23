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
	<title>Admin Page</title>
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
<%-- 	<% 
		Connection conn = DBConnect.getConnection();
		out.print(conn);
	%> --%>
	
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
			
			<nav aria-label="breadcrumb" class="media-body mb-0 lh-125 border-bottom border-gray">
			  <ol class="breadcrumb" style="background: none; padding-bottom: 0;">
			    <li class="breadcrumb-item active" style="display: flex;">Admin Dashboard &nbsp;
			    	<small class="nav-link mb-0 badge-btn" style="margin-left 5px;"> All related details of hospital </small>
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

		<% 
			TableHelpers dao = new TableHelpers(DBConnect.getConnection());
		%>

		<div class="row">
		
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary"><%= dao.countRowFromTable("doctor", null, 0) %></strong>

						<h3 class="mb-0">
							<a class="text-dark" href="#" style="font-size: x-large;">Doctor</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 5rem; align-self: center;">
							<i class="fa fa-user-md"></i>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary"><%= dao.countRowFromTable("student", null, 0) %></strong>

						<h3 class="mb-0">
							<a class="text-dark" href="#" style="font-size: x-large;">User</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 5rem; align-self: center;">
							<i class="fa fa-user-circle-o"></i>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary"><%= dao.countRowFromTable("appointment", null, 0) %></strong>

						<h3 class="mb-0">
							<a class="text-dark" href="#" style="font-size: x-large;">Total Appointment</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 5rem; align-self: center;">
							<i class="fa fa-calendar-check-o"></i>
						</div>

					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 mt-3" data-toggle="modal"
				data-target="#addSpecialist">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary"><%= dao.countRowFromTable("specialist", null, 0) %></strong>

						<h3 class="mb-0">
							<a class="text-dark" href="#" style="font-size: x-large;">Specialist</a>
						</h3>

						<div class="mb-1 text-muted"
							style="display: flex; font-size: 5rem; align-self: center;">
							<i class="fa fa-user-plus"></i>
						</div>

					</div>
				</div>
			</div>


		</div>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="addSpecialist" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
								<div class="media text-muted mb-0">
					          		<img data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1" alt="32x32" class="mr-2 rounded" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true" style="width: 32px; height: 32px;">
						          	<p class="media-body mb-0">
					          	  		<strong class="text-gray-dark" style="display: flex; gap: 15px;">@Add Specialist</strong>
					            		
					            		<span style="display: flex; gap: 5px;">
						            		<a class="nav-link mb-0 pb-0" style="padding: 0;" href="javascript:void(0)">Modal Title</a>
					            		</span>
						          	</p>
						        </div>				
				
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<form method="POST" action="../add_specialist" autocomplete="off">

						<div class="form-group">
							<label for="specName">Add Specialist Name</label>
							<input type="text" name="specName" id="specName"class="form-control">
						</div>
						
						<div class="modal-footer pr-0">
							<button type="submit" class="btn btn-primary">Save changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<%@include file="../footer_link.jsp"%>
	
	
</body>
</html>