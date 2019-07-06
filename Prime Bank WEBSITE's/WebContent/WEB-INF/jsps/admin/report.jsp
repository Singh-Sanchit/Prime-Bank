<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Get Your Report Generated</title>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome Report Page</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Sort By</h4>
							<p class="category">All the existing user will be displayed
								according to selected display type.</p>
						</div>
						<div class="content">
							<div class="row">
								<div class="col-md-12">
									<sv:form method="post"
										action="${pageContext.request.contextPath }/GenerateReport"
										modelAttribute="customer">
										<center>
											<sv:radiobutton name="r" value="fname" path="report" />
											By First Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<sv:radiobutton name="r" value="mname" path="report" />
											By Middle Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<sv:radiobutton name="r" value="lname" path="report" />
											By Last Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<sv:radiobutton name="r" value="balance" path="report" />
											By Balance <BR> <br> <input type="submit"
												value="Generate Report" class="btn btn-info btn-fill btn-wd">
										</center>
									</sv:form>
									<c:if test='${customer.getReport() != "" }'>
										<div class="content">
											<div class="container-fluid">
												<div class="row">
													<div class="col-md-12">
														<div class="card">
															<div class="content table-responsive table-full-width">
																<table class="table table-striped">
																	<thead>
																		<th>Account Number</th>
																		<th>Name</th>
																		<th>Contact</th>
																		<th>Email</th>
																		<th>Address</th>
																		<th>City</th>
																		<th>Country</th>
																		<th>Postal Code</th>
																		<th>Pan Number</th>
																		<th>Balance</th>
																	</thead>
																	<tbody>
																		<c:forEach var="c" items="${list }">
																			<tr>
																				<td><c:out value="${c.getAccountNumber() }" /></td>
																				<td><c:out value="${c.getFname() }" /> <c:out
																						value="${c.getMname() }" /> <c:out
																						value="${c.getLname() }" /></td>
																				<td><c:out value="${c.getContact() }" /></td>
																				<td><c:out value="${c.getEmail() }" /></td>
																				<td><c:out value="${c.getAddress() }" /></td>
																				<td><c:out value="${c.getCity() }" /></td>
																				<td><c:out value="${c.getCountry() }" /></td>
																				<td><c:out value="${c.getPostalCode() }" /></td>
																				<td><c:out value="${c.getPanNumber() }" /></td>
																				<td>Rs.<c:out value="${c.getBalance() }" /></td>
																			<tr>
																		</c:forEach>
																	</tbody>
																</table>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</c:if>
								</div>
							</div>
							<div class="footer">
								<div class="chart-legend">
									<i class="fa fa-circle text-info"></i> Information <i
										class="fa fa-circle text-danger"></i> Relevant <i
										class="fa fa-circle text-warning"></i> To User Is Displayed
								</div>
								<hr>
								<div class="stats">
									<i class="ti-reload"></i> Updated Every Time You Logged In.
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