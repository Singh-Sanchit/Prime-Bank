<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sv" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Modification</title>
</head>
<body>
	<c:import url="header.jsp" />
	<h1>Welcome User Modification Page</h1>
	<div class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="header">
							<h4 class="title">Add New Users</h4>
							<p class="category">Adding the new users requires to fill all
								the information compulsory</p>
						</div>
						<div class="content">
							<sv:form method="post"
								action="${pageContext.request.contextPath }/cms/AddNewUser"
								modelAttribute="users">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Name:</label>
											<sv:input name="name" placeholder="New User Name" type="text"
												class="form-control border-input" path="name"
												style=" width: 400px" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Username</label>
											<sv:input name="username"
												placeholder="Username Alloted To User" type="text"
												class="form-control border-input" path="username"
												style=" width: 400px" />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>Password</label><BR>
											<sv:input type="text" placeholder="Password Alloted To User"
												name="password" class="form-control border-input"
												path="password" style=" width: 400px" />
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label>Permission</label> <BR>
											<sv:select path="enabled"
												class="btn btn-info btn-fill btn-wd">
												<sv:option value="true">True</sv:option>
												<sv:option value="false">False</sv:option>
											</sv:select>
										</div>
									</div>
								</div>
								<div class="text-center">
									<input type="submit" value="Add User"
										class="btn btn-info btn-fill btn-wd">
								</div>
							</sv:form>
							<div class="footer">
								<br>
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
							<h4 class="title">Modifiy Existing Users</h4>
							<p class="category">Modifiying the current user power should
								be informed about the changes made in their credentials</p>
						</div>
						<div class="content">
							<c:forEach var="u" items="${user_list}">
								<sv:form method="post"
									action="${pageContext.request.contextPath }/cms/ModifyUser"
									modelAttribute="users">
									<div class="row">
										<div class="col-md-3">
											<div class="form-group">
												<label>Name:</label> <input name="name"
													placeholder="New User Name" type="text"
													class="form-control border-input" path="name"
													value="<c:out value="${u.getName()}"/>"/>
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Username</label> <input name="username" type="text"
													class="form-control border-input" path="username"
													value="<c:out value="${u.getUsername()}"/>" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Password</label><BR> <input type="text"
													placeholder="Password Alloted To User" name="password"
													class="form-control border-input" path="password"
													value="<c:out value="${u.getPassword()}"/>" />
											</div>
										</div>
										<div class="col-md-3">
											<div class="form-group">
												<label>Permission</label> <BR>
												<sv:select path="enabled"
													class="btn btn-info btn-fill btn-wd">
													<sv:option value="true">True</sv:option>
													<sv:option value="false">False</sv:option>
												</sv:select>
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