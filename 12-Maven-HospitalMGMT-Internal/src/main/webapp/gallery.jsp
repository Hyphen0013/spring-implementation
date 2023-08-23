
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hyphen.conn.DBConnect"%>
<%@page import="java.util.List"%>
<%@page import="hyphen.entity.GalleryImage"%>
<%@page import="hyphen.dao.GalleryImageDAO"%>
<%@page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gallery List</title>
<%@include file="header_link.jsp"%>
<link rel="stylesheet" href="css/style.css">

<style type="text/css">
	.download-btn {
		color: grey !important;
	}
	
	.download-btn:hover {
		color: #fff !important;
	}
</style>
</head>
<body class="bg-light">
	<%@include file="navbar.jsp"%>

    <div class="container">
    
    
		<div class="media text-muted pt-3 mb-0">
			<img
				data-src="holder.js/32x32?theme=thumb&amp;bg=e83e8c&amp;fg=e83e8c&amp;size=1"
				alt="32x32" class="mr-2 rounded"
				src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_18945cb716a%20text%20%7B%20fill%3A%23e83e8c%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_18945cb716a%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23e83e8c%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E"
				data-holder-rendered="true" style="width: 32px; height: 32px;">
			
			<nav aria-label="breadcrumb" class="media-body mb-0 lh-125 border-bottom border-gray">
			  <ol class="breadcrumb" style="background: none; padding-bottom: 0;">
			    <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
			    <li class="breadcrumb-item active" aria-current="">Gallery Image</li>
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
		
		<header class="header mb-5">
			<h1 id="title" class="text-center">Gallery Image</h1>
			<p id="description" class="text-center">
				List of gallery images with their remarks!
				<code data-toggle="modal" data-target="#gallery_img" style="cursor: pointer;">
					Click Here To Add Image	
				</code>				
			</p>
		</header>		
    
    	<%
    		GalleryImageDAO dao = new GalleryImageDAO(DBConnect.getConnection());
    		List<GalleryImage> list = dao.getAllGalleryImage();
    		
			SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy"); 
		    formatter = new SimpleDateFormat("dd MMMM yyyy");   
		    int leftCount = 0;
		    int rightCount = 0;
    	%>    
    
        <div class="row mt-5 wrap-feature41-box">
            
            <div class="col-12 col-sm-12 col-md-12 col-lg-5 mb-5 box-shadow">
                <div class="carousel-vertical box-shadow">
                    <ul class="nav vtab f41-tab">
	                    <% for(GalleryImage image : list) {
	                    	leftCount++;
	                    %>
	                        <li class="nav-item">
	                            <a class="nav-link <% if(leftCount == 1) { %> active <% } %>" data-toggle="tab" href="#<%= image.getImg_heading() %>" style="display: block;">
	                                <div class="display-5 t-icon"><i class="icon-Structure"></i></div>
	                                <div>
	                                    <h5 class="m-b-0" style="color: #fff;">
											<span class="badge" style="font-size: 1.2rem; margin-left: 10px;  background-color: rgb(233,84,140)"><%= image.getImg_heading() %></span>                                    
	                                    </h5>
	                                    <h6 class="subtitle text-muted"><%= image.getRemarks() %>.</h6>
	                                </div>
	                            </a>
	                        </li>
                        <% } %>                   
                    </ul>
                </div>
            </div>

            <div class="col-lg-7 ml-auto">
                <div class="tab-content" id="myTabContent">
                
	                <% for(GalleryImage image : list) {
	                	rightCount++;
	                %>
						<div class="jumbotron bg-white rounded box-shadow tab-pane fade show <% if(rightCount == 1) { %> active <% } %>" style="padding: 2rem 0rem;" id="<%= image.getImg_heading() %>" role="tabpanel">
							<div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
								<h1 style="display: flex; justify-content: space-between; align-items: flex-end;">
									<%= image.getImg_heading() %>
									<a href="download-gal-image?fileName=<%= image.getImg_name() %>" class="badge edit-btn download-btn" style="cursor: pointer"><i class="fa fa-download"></i></a>
								</h1>
								<p>
									<%= image.getRemarks() %>			.
								</p>
								<% if(image.getImg_name().endsWith(".pdf")) { %>
							<img alt="" src="./images/pdf.png"
								class="img-fluid img-thumbnail rounded mx-auto d-block mb-2">
							<% } else if(image.getImg_name().endsWith(".docx") || image.getImg_name().endsWith(".doc")) { %>
									<img alt="" src="./images/doc.png" class="img-fluid img-thumbnail rounded mx-auto d-block mb-2">
								<% } else if(image.getImg_name().endsWith(".xlsx") || image.getImg_name().endsWith(".xls")) { %>
									<img alt="" src="./images/xlsx.png" class="img-fluid img-thumbnail rounded mx-auto d-block mb-2">
								<% } else  { %>
									<img alt="" src="gallery/<%= image.getImg_name() %>" class="img-fluid img-thumbnail rounded mx-auto d-block mb-2">
								<% } %>
								
								<h6 class="border-bottom border-gray pb-2 mb-0" style="display: flex; justify-content: space-between; align-items: baseline;">
									<small>Created on</small>
									<small class="d-block text-right mt-3">
									 - <code><%= formatter.format(image.getCreated_at()) %></code>
									</small>
								</h6>								
							</div>
						</div>				
					<% } %> 
					
				</div>
            </div>
            
        </div>



		<!-- EXTRA -->
<!-- 		<div class="row">
			<div class="col-12 col-sm-8 col-lg-5">
				<h6 class="text-muted">List Group with Images</h6>
				<ul class="list-group">
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Don Quixote
						<div class="image-parent">
							<img
								src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/don_quixote.jpg"
								class="img-fluid" alt="quixote">
						</div>
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						As I Lay Dying
						<div class="image-parent">
							<img
								src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/as_I_lay.jpg"
								class="img-fluid" alt="lay">
					</li>
					<li
						class="list-group-item d-flex justify-content-between align-items-center">
						Things Fall Apart
						<div class="image-parent">
							<img
								src="https://s3.eu-central-1.amazonaws.com/bootstrapbaymisc/blog/24_days_bootstrap/things_fall_apart.jpg"
								class="img-fluid" alt="things">
					</li>
				</ul>
			</div>
		</div> -->

	</div>
	
	
	
	<!-- MODAL GALLERY  -->
	<div class="modal fade bd-example-modal-xl" id="gallery_img" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
				
					<div class="media text-muted mb-0">
		          		<p class="media-body mb-0">
		          	  		<strong class="text-gray-dark" style="display: flex; gap: 15px;">Add Image</strong>
			          	</p>
			        </div>				
				
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
				
					<form method="POST" action="add_gallery_image" autocomplete="off" enctype="multipart/form-data">
						
						<div class="row">
							<div class="col-md-12 form-group">	
								<label for="img_name">Image </label>
								<div class="custom-file">
								  <input type="file" class="custom-file-input" name="img_name" id="img_name">
								  <label class="custom-file-label" for="customFile">Choose file</label>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="img_heading">Heading </label>
									<input type="text" name="img_heading" id="img_heading" class="form-control" placeholder="Enter heading of image">
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="remarks">Add Remarks <small class="text-muted">(optional)</small> </label>
									<textarea id="remarks" class="form-control" name="remarks"
										placeholder="Enter remarkds about image..."></textarea>
								</div>
							</div>
						</div>						
															
						
						<div class="modal-footer pr-0">
							<button type="submit" class="btn btn-primary">Add Image</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- MODAL GALLERY END -->	

	<%@include file="footer_link.jsp"%>
</body>
</html>