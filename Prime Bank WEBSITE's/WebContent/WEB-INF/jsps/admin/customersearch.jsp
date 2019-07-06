<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Your Need</title>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome Customer Search Page</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Search Account by Account Number</h4>
							<p class="category">Users added in this session will not be
								reflected in search.</p>
						</div>
						<div class="row">
						<div class="text-center">
							<div class="col-md-4">
								<div class="form-group">
								<BR><BR>
									<label>Enter Account Number</label>
									<sv:form method="post"
										action="${pageContext.request.contextPath }/SearchByAccountNumber"
										modelAttribute="customer">
										<sv:input type="text" path="accountNumber" list="data"
											class="form-control border-input" />
											<BR>
										<input type="submit" value="Search" class="btn btn-info btn-fill btn-wd">
									</sv:form>
								</div>
							</div>
							</div>
						</div>
						<datalist id="data"> <c:forEach items="${list }"
							var="cus">
							<option
								value="<c:out value="${cus.getAccountNumber() }"></c:out>">
								<c:out value="${cus.getFname() }"></c:out>
								<c:out value="${cus.getLname() }"></c:out>
							</option>
						</c:forEach> </datalist>

						<c:if test='${customer.getAccountNumber() != "" }'>
							<div class="content table-responsive table-full-width">
								<table class="table table-striped">
									<thead>
										<th>Customer Info from Search for Account Number :</th>
										<th><c:out value="${customer.getAccountNumber() }" /></th>
									</thead>
									<tbody>
										<tr>
											<td>Full Name -</td>
											<td><c:out value="${customer.getFname() }" /> <c:out
													value="${customer.getMname() }" /> <c:out
													value="${customer.getLname() }" /></td>
										</tr>

										<tr>
											<td>Contact -</td>
											<td><c:out value="${customer.getContact() }" /></td>
										</tr>

										<tr>
											<td>Email -</td>
											<td><c:out value="${customer.getEmail() }" /></td>
										</tr>
										<tr>
											<td>Address -</td>
											<td><c:out value="${customer.getAddress() }" /></td>
										</tr>
										<tr>
											<td>City -</td>
											<td><c:out value="${customer.getCity() }" /></td>
										</tr>
										<tr>
											<td>Country -</td>
											<td><c:out value="${customer.getCountry() }" /></td>
										</tr>
										<tr>
											<td>Postal Code -</td>
											<td><c:out value="${customer.getPostalCode() }" /></td>
										</tr>
										<tr>
											<td>Pan Number -</td>
											<td><c:out value="${customer.getPanNumber() }" /></td>
										</tr>
										<tr>
											<td>Balance -</td>
											<td>Rs.<c:out value="${customer.getBalance() }" /></td>
										</tr>
										<tr>
											<td>Account Type -</td>
											<td><c:out value="${customer.getAccountType().getType() }" /></td>
										</tr>
										<tr>
											<td>Interest -</td>
											<td><c:out value="${customer.getAccountType().getInterestRate() }" />% p.a</td>
										</tr>
										<tr>
											<td>Overdraft -</td>
											<td>Rs.<c:out value="${customer.getAccountType().getOverdraft() }" /></td>
										</tr>
									</tbody>
								</table>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="footer.jsp" />
</body>
</html>