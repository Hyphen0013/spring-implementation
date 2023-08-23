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
<%-- 	<% 
		Connection conn = DBConnect.getConnection();
		out.print(conn);
	%> --%>

	<div class="container pt-2">

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

		<div class="card mb-4 box-shadow h-md-250">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="./images/anonymous_mask_2-wallpaper-1920x1200.jpg"
							alt="First slide" height="500px;">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" src="./images/anonymous-dark.jpg"
							alt="Second slide" height="500px;">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="./images/anonymous-quotes-wallpaper-1.jpg" alt="Third slide"
							height="500px;">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>


		<div class="row" style="display: flex; flex-direction: row;">

			<!-- LEFT DIV  -->
			<div class="col-sm col-md-8 mt-3">
				<div class="media text-muted pt-3 mb-0">
					<img
						data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
						alt="32x32" class="mr-2 rounded"
						src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
						data-holder-rendered="true" style="width: 32px; height: 32px;">

					<p class="media-body mb-0 lh-125 border-bottom border-gray">
						<strong class="text-gray-dark mb-3"
							style="display: flex; gap: 15px; font-size: 150%"> <a
							class="nav-link mb-0 badge-btn" href="index.jsp">Key Features
								of Hospital</a>
						</strong>
					</p>
				</div>

				<div class="col-md-12 mt-3 p-0">

					<div class="row">
						<div class="col-sm col-md-6 mt-3">
							<div class="card flex-md-row mb-4 box-shadow">
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-primary">World</strong>
									<h3 class="mb-0">
										<a class="text-dark" href="#">Featured post</a>
									</h3>
									<div class="mb-1 text-muted">Nov 12</div>
									<p class="card-text mb-auto">This is a wider card with
										supporting text below as a natural lead-in to additional
										content.</p>
									<a href="#">Continue reading</a>
								</div>
							</div>
						</div>
						<div class="col-sm col-md-6 mt-3">
							<div class="card flex-md-row mb-4 box-shadow">
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-primary">World</strong>
									<h3 class="mb-0">
										<a class="text-dark" href="#">Featured post</a>
									</h3>
									<div class="mb-1 text-muted">Nov 12</div>
									<p class="card-text mb-auto">This is a wider card with
										supporting text below as a natural lead-in to additional
										content.</p>
									<a href="#">Continue reading</a>
								</div>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-sm col-md-6 mt-3">
							<div class="card flex-md-row mb-4 box-shadow">
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-primary">World</strong>
									<h3 class="mb-0">
										<a class="text-dark" href="#">Featured post</a>
									</h3>
									<div class="mb-1 text-muted">Nov 12</div>
									<p class="card-text mb-auto">This is a wider card with
										supporting text below as a natural lead-in to additional
										content.</p>
									<a href="#">Continue reading</a>
								</div>
							</div>
						</div>
						<div class="col-sm col-md-6 mt-3">
							<div class="card flex-md-row mb-4 box-shadow">
								<div class="card-body d-flex flex-column align-items-start">
									<strong class="d-inline-block mb-2 text-primary">World</strong>
									<h3 class="mb-0">
										<a class="text-dark" href="#">Featured post</a>
									</h3>
									<div class="mb-1 text-muted">Nov 12</div>
									<p class="card-text mb-auto">This is a wider card with
										supporting text below as a natural lead-in to additional
										content.</p>
									<a href="#">Continue reading</a>
								</div>
							</div>
						</div>
					</div>

				</div>

				<div class="media text-muted pt-3 mb-2">
					<img
						data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
						alt="32x32" class="mr-2 rounded"
						src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
						data-holder-rendered="true" style="width: 32px; height: 32px;">

					<p class="media-body mb-0 lh-125 border-bottom border-gray">
						<strong class="text-gray-dark mb-3"
							style="display: flex; gap: 15px; font-size: 150%"> <a
							class="nav-link mb-0 badge-btn" href="index.jsp">Key Features
								of Hospital</a>
						</strong>
					</p>
				</div>
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
				</div>
			</div>
			<!-- LEFT DIV END  -->

			<!-- RIGHT DIV  -->
			<div class="col-sm col-md-4 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<img class="card-img-right flex-auto d-md-block"
						data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]"
						style="width: 100%; height: 100%;"
						src="./images/anonymous-quotes-wallpaper-1.jpg"
						data-holder-rendered="true">
				</div>
				<div class="card flex-md-row mb-4 box-shadow">
					<img class="card-img-right flex-auto d-md-block"
						data-src="holder.js/200x250?theme=thumb" alt="Thumbnail [200x250]"
						style="width: 100%; height: 100%;"
						src="./images/anonymous-quotes-wallpaper-1.jpg"
						data-holder-rendered="true">
				</div>
			</div>
			<!-- RIGHT DIV END -->

		</div>


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
					class="nav-link mb-0 badge-btn" href="index.jsp">Key Features
						of Hospital</a>
				</strong>
			</p>
		</div>

		<div class="row">
			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3  mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3  mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-6 col-md-4 col-lg-3  mt-3">
				<div class="card flex-md-row mb-4 box-shadow">
					<div class="card-body d-flex flex-column align-items-start">
						<strong class="d-inline-block mb-2 text-primary">World</strong>
						<h3 class="mb-0">
							<a class="text-dark" href="#">Featured post</a>
						</h3>
						<div class="mb-1 text-muted">Nov 12</div>
						<p class="card-text mb-auto">This is a wider card with
							supporting text below as a natural lead-in to additional content.</p>
						<a href="#">Continue reading</a>
					</div>
				</div>
			</div>

		</div>

	</div>

	<%@include file="footer_link.jsp"%>
</body>
</html>