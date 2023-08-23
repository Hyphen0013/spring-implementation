
<nav class="navbar navbar-expand-lg navbar-light"
	style="background-color: #e3f2fd;">
	<a class="navbar-brand" href="#"> <i class="fa fa-home"></i> Hospital MGMT</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNav" aria-controls="navbarNav"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNav">
		<ul class="navbar-nav mb-2 mb-lg-0 ml-auto"> 
		
			<li class="nav-item">
				<a class="nav-link" href="index.jsp">Home</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="patient.jsp">Patient</a>
			</li>	
									
		</ul>
		
		<ul class="navbar-nav ml-auto mb-2 mb-lg-0"> 
		
            <li class="nav-item dropdown ml-auto">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user-circle"></i> ${ doctorObj.name }</a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item media-body mb-0 small lh-125 border-bottom border-gray" href="edit_profile.jsp"><i class="fa fa-vcard" style="font-size: 1rem;"></i> Edit Profile</a>
                    <a class="dropdown-item" href="../doctor_logout"><i class="fa fa-sign-out"></i> Logout</a>
                </div>
            </li>								

		</ul>			
		
	</div>
</nav>