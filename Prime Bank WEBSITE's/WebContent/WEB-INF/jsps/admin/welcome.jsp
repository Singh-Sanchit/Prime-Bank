<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Created Successfully..</title>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome Page</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 col-md-5">
					<div class="card card-user">
						<div class="image">
							<img src="assets/img/background.jpg" alt="..." />
						</div>
						<div class="content">
							<div class="author">
								<img class="avatar border-white"
									src="assets/img/faces/profile.png" alt="..." />
								<p class="title">
									<c:out value="${customer.getFname() }" />
									<c:out value="${customer.getMname() }" />
									<c:out value="${customer.getLname() }" />
									<br /> <a href="#"><small><c:out
												value="${customer.getEmail() }" /></small></a>
								</p>
							</div>
							<p class="text-center">Your Account Number:</p>
							<hr>
							<p class="text-warning">
								<c:out value="${customer.getAccountNumber() }" />
							</p>
						</div>


					</div>
					<div class="card">
						<div class="header">
							<h4 class="title">Welcome User</h4>
						</div>
						<div class="content"></div>
					</div>
				</div>
				<div class="col-lg-8 col-md-7">
					<div class="card">
						<div class="header">
							<h2 class="title">Your Profile</h2>
						</div>
						<div class="content">
							<form>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Name</label>
											<p class="text-danger">
												<c:out value="${customer.getFname() }" />
												&nbsp;
												<c:out value="${customer.getMname() }" />
												&nbsp;
												<c:out value="${customer.getLname() }" />
											</p>
											<hr>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Contact</label>
											<p class="text-danger">
												<c:out value="${customer.getContact() }" />
											</p>
										</div>
										<hr>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Email</label>
											<p class="text-danger">
												<c:out value="${customer.getEmail() }" />
											</p>
										</div>
										<hr>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label>Address</label>
											<p class="text-danger">
												<c:out value="${customer.getAddress() }" />
												<br>
												<c:out value="${customer.getCity() }" />
												<br>
												<c:out value="${customer.getCountry() }" />
												<br>
												<c:out value="${customer.getPostalCode() }" />
												<br>
											</p>
										</div>
										<hr>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label>City</label>
											<p class="text-danger">
												<c:out value="${customer.getCity() }" />
											</p>
										</div>
										<hr>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Country</label>
											<p class="text-danger">
												<c:out value="${customer.getCountry() }" />
											</p>
										</div>
										<hr>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label>Postal Code</label>
											<p class="text-danger">
												<c:out value="${customer.getPostalCode() }" />
											</p>
										</div>
										<hr>
									</div>
								</div>

								<div class="row">
									<div class="col-md-5">
										<div class="form-group">
											<label>Pan Number</label>
											<p class="text-danger">
												<c:out value="${customer.getPanNumber() }" />
											</p>
										</div>
										<hr>
									</div>
								</div>
								<div class="clearfix"></div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>

	<c:import url="footer.jsp" />
</body>
</html>