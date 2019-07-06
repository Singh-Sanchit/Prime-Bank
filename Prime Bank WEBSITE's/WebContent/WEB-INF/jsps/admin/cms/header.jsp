<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- Bootstrap core CSS     -->
<link href="../assets/css/bootstrap.min.css" rel="stylesheet" />

<!-- Animation library for notifications   -->
<link href="../assets/css/animate.min.css" rel="stylesheet" />

<!--  Paper Dashboard core CSS    -->
<link href="../assets/css/paper-dashboard.css" rel="stylesheet" />


<!--  CSS for Demo Purpose, don't include it in your project     -->
<link href="../assets/css/demo.css" rel="stylesheet" />


<!--  Fonts and icons     -->
<link href="../assests/fonts/font-awesome.css" rel="stylesheet">
<link href="../assets/css/themify-icons.css" rel="stylesheet">
</head>
<body>
	<!--   Core JS Files   -->
	<script src="../assets/js/jquery-1.10.2.js" type="text/javascript"></script>
	<script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>

	<!--  Checkbox, Radio & Switch Plugins -->
	<script src="../assets/js/bootstrap-checkbox-radio.js"></script>

	<!--  Charts Plugin -->
	<script src="../assets/js/chartist.min.js"></script>

	<!--  Notifications Plugin    -->
	<script src="../assets/js/bootstrap-notify.js"></script>

	<!--  Google Maps Plugin    -->
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js"></script>

	<!-- Paper Dashboard Core javascript and methods for Demo purpose -->
	<script src="../assets/js/paper-dashboard.js"></script>

	<!-- Paper Dashboard DEMO methods, don't include it in your project! -->
	<script src="../assets/js/demo.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							demo.initChartist();

							$
									.notify(
											{
												icon : 'ti-gift',
												message : "Welcome to <b>PRIME-BANK</b> - a Database Connected, Secured, SEO Friendly Project in JAVA SPRING."

											}, {
												type : 'success',
												timer : 2000
											});

						});
	</script>
	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="${pageContext.request.contextPath }/" class="simple-text">
						PRIME BANK </a>
				</div>

				<ul class="nav">
					<li class="active"><a
						href="${pageContext.request.contextPath }/cms/Dashboard"> <i
							class="ti-panel"></i>
							<p>Dashboard</p>
					</a></li>
					<li><a
						href="${pageContext.request.contextPath }/cms/UserModification"> <i
							class="ti-user"></i>
							<p>User Modification</p>
					</a></li>
					<li><a href="${pageContext.request.contextPath }/cms/AccountType">
							<i class="ti-settings"></i>
							<p>Account Type</p>
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
						<span class="icon-bar bar3"></span>
					</button>
					<a class="navbar-brand" href="${pageContext.request.contextPath }/">Welcome ADMIN</a>
				</div>
			</div>
			</nav>
</body>
</html>