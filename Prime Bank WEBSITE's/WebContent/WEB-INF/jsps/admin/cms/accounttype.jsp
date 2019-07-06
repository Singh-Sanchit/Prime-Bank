<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Account Type</title>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome Account Type Page</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Add New Account Type</h4>
							<p class="category">This Account type will be given as a
								option to the new joining customer.</p>
						</div>
						<div class="content">
							<sv:form method="post"
								action="${pageContext.request.contextPath }/cms/AddNewAccountType"
								modelAttribute="accountType">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Type:</label>
											<sv:input name="type" placeholder="New Account Type"
												type="text" class="form-control border-input" path="type"
												style=" width: 400px" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Minimum Balance</label>
											<sv:input name="minBalance" placeholder="In Numbers"
												type="text" class="form-control border-input"
												path="minBalance" style=" width: 400px" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Interest Rate</label><BR>
											<sv:input type="text" placeholder="rate p.a"
												name="interestRate" class="form-control border-input"
												path="interestRate" style=" width: 400px" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Overdraft</label> <BR>
											<sv:input type="text" placeholder="In Numbers"
												name="overdraft" class="form-control border-input"
												path="overdraft" style=" width: 400px" />
										</div>
									</div>
								</div>
								<div class="text-center">
									<input type="submit" value="Add Account Type"
										class="btn btn-info btn-fill btn-wd">
								</div>
							</sv:form>
							<div class="footer">
								<hr>
								<div class="stats">
									<i class="ti-reload"></i> Updated Every Time You Logged In.
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Modifiy Account Type</h4>
							<p class="category">Modifiying any details will be reflected
								back on the existing as well as new joining customer.</p>
						</div>
						<div class="content">
							<c:forEach var="a" items="${act_type_list}">
								<sv:form method="post"
									action="${pageContext.request.contextPath }/cms/ModifyAccountType"
									modelAttribute="accountType">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label>Type:</label> <input name="type"
													placeholder="New Account Type" type="text"
													class="form-control border-input" path="type"
													value="<c:out value="${a.getType()}"/>"/>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Minimum Balance</label> <input name="minBalance" type="text"
													class="form-control border-input" path="minBalance"
													value="<c:out value="${a.getMinBalance()}"/>" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Interest Rate</label><BR> <input type="text"
													placeholder="In Numbers" name="interestRate"
													class="form-control border-input" path="interestRate"
													value="<c:out value="${a.getInterestRate()}"/>" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Overdraft</label> <BR>
												<input type="text"
													placeholder="In Numbers" name="overdraft"
													class="form-control border-input" path="overdraft"
													value="<c:out value="${a.getOverdraft()}"/>" />
											</div>
										</div>
									</div>
									<div class="text-center">
										<input type="submit" value="Save Changes"
											class="btn btn-info btn-fill btn-wd">
									</div>
								</sv:form>
							</c:forEach>
							<div class="footer">
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