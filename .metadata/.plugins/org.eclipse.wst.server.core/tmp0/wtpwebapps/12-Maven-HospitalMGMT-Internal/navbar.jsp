
<%@page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #e3f2fd;">
	<a class="navbar-brand" href="#"> <i class="fa fa-home"></i> Hospital MGMT</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav ml-auto mb-2 mb-lg-0"> 
		
			<li class="nav-item">
				<a class="nav-link" href="gallery.jsp">Gallery</a>
			</li>			
			<c:if test="${empty userObj }">
				<li class="nav-item">
					<a class="nav-link" href="admin_login.jsp">Admin</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="doctor_login.jsp">Doctor</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="user_login.jsp">User</a>
				</li>	
				
				<li class="nav-item">
					<a class="nav-link" href="user_appointment.jsp">Appointment</a>
				</li>
							
							
				<li class="nav-item">
					<a class="nav-link" href="signup.jsp"><i class="fa fa-sign-in"></i> Signup</a>
				</li>
			</c:if>	
				
			<c:if test="${ not empty userObj }">		
				<li class="nav-item">
					<a class="nav-link" href="user_appointment.jsp">Appointment</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="view_appointment.jsp">View Appointment</a>
				</li>
								
	            <li class="nav-item dropdown ml-auto">
	                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle"></i> ${ userObj.name }</a>
	                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
	                    <a class="dropdown-item media-body mb-0 small lh-125 border-bottom border-gray" href="change_password.jsp"> <i class="fa fa-vcard" style="font-size: 1rem;"></i> Change password</a>
	                    <a class="dropdown-item" href="user_logout"><i class="fa fa-sign-out"></i> Logout</a>
	                </div>
	            </li>					
				
			</c:if>			
										

		</ul>	
		
	</div>
</nav>