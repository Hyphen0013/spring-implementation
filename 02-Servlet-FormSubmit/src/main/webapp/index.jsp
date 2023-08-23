<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
		<head>
			<meta charset="UTF-8">
			<title>Register Page</title>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
		</head>
	<body class="bg-light">
		
		<div class="container">
			<div class="row">
				<div class="col-md-6 offset-md-3 mt-5">
					<div class="card">
						<div class="card-body">
							<h1 class="badge badge-primary" style="font-size: xx-large;">
								  Register Form<span class="badge badge-light" style="font-size: x-large; margin-left: 10px;">user</span>
								  <span class="sr-only">unread messages</span>							
							</h1>
							<form method="POST" action="register" autocomplete="off">
							
								<div class="form-group">
									<label>Enter Name</label>
									<input type="text" name="user_name" class="form-control" placeholder="Enter user name" aria-autocomplete="none" autocomplete=false>
								</div>
								
								<div class="form-group">
									<label>Enter Email</label>
									<input type="text" name="user_email" class="form-control" data-description="dummyUsername" autocomplete="false">
								</div>
								
								<div class="form-group">
									<label>Enter Password</label>
									<input type="password" name="password" class="form-control">
								</div>
								
								<div class="form-group">
									<label>Cource</label>
									<select class="form-control" name="course">
										<option vlaue="" disabled selected>Select</option>
										<option vlaue="B.tect">B.Tech</option>
										<option vlaue="BCA">BCA</option>
										<option vlaue="MCA">MCA</option>
									</select>
								</div>	
								
								<button type="submit" class="btn btn-primary">Submit</button>																					
								
							</form>
							
							<div class="my-3 bg-white rounded box-shadow">
								<h6 class="border-bottom border-gray pb-2 mb-0">If Already Login</h6>
								
								<div class="media text-muted pt-3">
							          <img data-src="holder.js/32x32?theme=thumb&amp;bg=007bff&amp;fg=007bff&amp;size=1" alt="32x32" class="mr-2 rounded" style="width: 32px; height: 32px;" src="data:image/svg+xml;charset=UTF-8,%3Csvg%20width%3D%2232%22%20height%3D%2232%22%20xmlns%3D%22http%3A%2F%2Fwww.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%2032%2032%22%20preserveAspectRatio%3D%22none%22%3E%3Cdefs%3E%3Cstyle%20type%3D%22text%2Fcss%22%3E%23holder_1892be63b85%20text%20%7B%20fill%3A%23007bff%3Bfont-weight%3Abold%3Bfont-family%3AArial%2C%20Helvetica%2C%20Open%20Sans%2C%20sans-serif%2C%20monospace%3Bfont-size%3A2pt%20%7D%20%3C%2Fstyle%3E%3C%2Fdefs%3E%3Cg%20id%3D%22holder_1892be63b85%22%3E%3Crect%20width%3D%2232%22%20height%3D%2232%22%20fill%3D%22%23007bff%22%3E%3C%2Frect%3E%3Cg%3E%3Ctext%20x%3D%2212.134963274002075%22%20y%3D%2217.09129664897919%22%3E32x32%3C%2Ftext%3E%3C%2Fg%3E%3C%2Fg%3E%3C%2Fsvg%3E" data-holder-rendered="true">
							          <a href="login.jsp" class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
							            <strong class="d-block text-gray-dark">click for login</strong>
							          </a>
						        </div>								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"></script>
	</body>
</html>