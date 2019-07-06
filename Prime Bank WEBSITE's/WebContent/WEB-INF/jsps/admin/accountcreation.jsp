<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Creation - Welcome To Family</title>
<script type="text/javascript">
	function populate(value) {
		if (value == "none") {
			document.getElementById("msg").innerHTML = "Please select account type as savings or current";
			document.getElementById("content").style.display = "none"
			return false;
		}
		if (value != "none") {
			document.getElementById("content").style.display = "block"
			document.getElementById("msg").innerHTML = "";
		}
	}
</script>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome Account Creation</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<c:if test="${status == false }">
					<div class="col-lg-8 col-md-7">
						<div class="card">
							<div class="header">
								<h4 class="title">Set Customer Profile</h4>
							</div>
							<div class="content">
								<sv:form method="post"
									action="${pageContext.request.contextPath }/CustomerCreation"
									modelAttribute="customer">

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>First Name</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="Shawn" value="" path="fname" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Middle Name</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="Brad" value="" path="mname" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Last Name</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="Mathew" value="" path="lname" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Bank</label> <input type="text"
													class="form-control border-input" disabled
													placeholder="Bank Name" value="Prime Bank Inc." />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Contact</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="+918574869430" value="" path="contact" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="exampleInputEmail1">Email Address</label>
												<sv:input type="email" class="form-control border-input"
													placeholder="a@b.c" path="email" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Address</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="Home Address" value="" path="address" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>City</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="City" value="" path="city" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Country</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="Country" value="" path="country" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Postal Code</label>
												<sv:input type="number" class="form-control border-input"
													placeholder="ZIP Code" path="postalCode" />
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Pan Number</label>
												<sv:input type="text" class="form-control border-input"
													placeholder="PanCard Number" value="" path="panNumber" />
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<BR> <BR> <input type="checkbox"> I agree
												all terms and conditions
											</div>
										</div>
									</div>

									<div class="text-center">
										<input type="submit" value="Create Account"
											class="btn btn-info btn-fill btn-wd">
									</div>
									<div class="clearfix"></div>
								</sv:form>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${status == true }">
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
										<h4 class="title">
											<c:out value="${customer.getFname() }" />
											<c:out value="${customer.getMname() }" />
											<c:out value="${customer.getLname() }" />
											<br /> <small><c:out value="${customer.getEmail() }" /></small>
										</h4>
									</div>
									<hr>
									<p class="description text-center">
										"Welcome to the family of Prime Bank"" <br> MEET YOUR
										EXPECTATIONS <br> I LIVE YOUR DREAMS
									</p>
								</div>
							</div>
							<div class="card">
								<div class="header">
									<h4 class="title">Select Account Type</h4>
									<hr>
								</div>
								<div class="content">
									<ul class="list-unstyled team-members">
										<li>
											<div class="row">
												<div class="text-center">
													<sv:form method="post"
														action="${pageContext.request.contextPath }/FinalizeAccount"
														modelAttribute="accountType">
														<sv:select name="accounttype" path="type"
															onchange="populate(this.value)">
															<option value="none">--select account type--</option>
															<c:forEach var="c" items="${act_type_list }">
																<option value=<c:out value="${c.getType()}"/>><c:out
																		value="${c.getType()}"></c:out></option>
															</c:forEach>
														</sv:select>
														<BR>
														<BR>
														<div id="msg">
															<font color="red"></font>
														</div>
														<BR>
														<input type="submit" class="btn btn-info btn-fill btn-wd"
															value="Create Account">
													</sv:form>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="col-lg-8 col-md-7">
							<div class="card">
								<div class="header">
									<h4 class="title">Confirm Profile</h4>
								</div>
								<div class="content">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Name</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getFname() }"/> &nbsp; <c:out value="${customer.getMname() }"/> &nbsp; <c:out value="${customer.getLname() }"/>">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label>Contact</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getContact() }"/>">
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label>Email</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getEmail() }"/>">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<label>Address</label>
												<textarea rows="5" class="form-control border-input"
													disabled><c:out
														value="${customer.getAddress() }" />
<c:out value="${customer.getCity() }" />
<c:out value="${customer.getCountry() }" />
<c:out value="${customer.getPostalCode() }" /></textarea>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label>City</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getCity() }"/>">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Country</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getCountry() }"/>">
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label>Postal Code</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getPostalCode() }"/>">
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-5">
											<div class="form-group">
												<label>Pan Number</label> <input type="text"
													class="form-control border-input" disabled
													value="<c:out value="${customer.getPanNumber() }"/>">
											</div>
										</div>
									</div>
									<div class="clearfix"></div>
								</div>
							</div>
						</div>


					</div>
				</c:if>
			</div>

			<div class="row" id="content" style="display: none;">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Account Details And Preferences</h4>
							<p class="category">Depends On Account Type</p>
						</div>

						<div class="content">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>Minimum Balance</label> <input type="text"
											class="form-control border-input" disabled value="Rs.1000">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Interest Rate</label> <input type="text"
											class="form-control border-input" disabled value="6.0 pa.">
									</div>
								</div>
								<div class="col-md-4">
									<div class="form-group">
										<label>Overdraft</label> <input type="text"
											class="form-control border-input" disabled value="Rs.0">
									</div>
								</div>
							</div>

							<div class="footer">
								<hr>
								<div class="stats">
									<i class="ti-reload"></i> Can be changed as per bank policy.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="footer.jsp" />
</body>
</html>