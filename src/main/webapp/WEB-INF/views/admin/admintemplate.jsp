<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin PTStore</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- jsGrid -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/jsgrid/jsgrid.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/jsgrid/jsgrid-theme.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">

</head>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Tempusdominus Bbootstrap 4 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- iCheck -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- JQVMap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/jqvmap/jqvmap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/dist/css/adminlte.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
<!-- Daterange picker -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/daterangepicker/daterangepicker.css">
<!-- summernote -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/admin/plugins/summernote/summernote-bs4.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
	<div class="wrapper">

		<!-- Navbar -->
		<form method="get"
			action="${pageContext.request.contextPath }/adminaccount/logout">
			<nav
				class="main-header navbar navbar-expand navbar-white navbar-light">
				<!-- Left navbar links -->
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link"
						data-widget="pushmenu" href="#" role="button"><i
							class="fas fa-bars"></i></a></li>
				</ul>

				<!-- Right navbar links -->
				<ul class="navbar-nav ml-auto">
					<!-- Messages Dropdown Menu -->
					<li class="nav-item dropdown"><input type="submit"
						class="btn btn-block btn-outline-success" value="Logout">
				</ul>
			</nav>
		</form>
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<aside class="main-sidebar sidebar-dark-primary elevation-4">
			<!-- Brand Logo -->
			<a href="${pageContext.request.contextPath }/adminaccount/statistics" class="brand-link"> <img
				src="${pageContext.request.contextPath }/resources/admin/dist/img/AdminLTELogo.png"
				alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
				style="opacity: .8"> <span
				class="brand-text font-weight-light">Admin PTStore</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="${pageContext.request.contextPath }/resources/admin/dist/img/user2-160x160.jpg"
							class="img-circle elevation-2" alt="User Image">
					</div>
					<div class="info">
						<a  class="d-block">KenMjnnnn</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a
							href="${pageContext.request.contextPath }/adminaccount/statistics"
							class="nav-link"> <i class="nav-icon fas fa-tachometer-alt"></i>
								<p>Statistics</p>
						</a></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fas fa-table"></i>
								<p>
									Tables <i class="fas fa-angle-left right"></i>
								</p>

						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/admincategory"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Category</p>
								</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath }/adminaccount"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Account</p>
								</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/adminaccount/product"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Product</p>
								</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/adminaccount/rate"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Rating</p>
								</a></li>
								<li class="nav-item"><a
									href="${pageContext.request.contextPath}/adminaccount/orders"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Orders</p>
								</a></li>

							</ul></li>
					</ul>
				</nav>
				<!-- /.sidebar-menu -->
			</div>
			<!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<tiles:insertAttribute name="content">

		</tiles:insertAttribute>

		<!-- /.content-wrapper -->
		<footer class="main-footer">
			<strong>Copyright &copy; 2014-2019 <a
				href="http://adminlte.io">AdminLTE.io</a>.
			</strong> All rights reserved.
			<div class="float-right d-none d-sm-inline-block">
				<b>Version</b> 3.0.4
			</div>
		</footer>

		<!-- Control Sidebar -->
		<aside class="control-sidebar control-sidebar-dark">
			<!-- Control sidebar content goes here -->
		</aside>
		<!-- /.control-sidebar -->
	</div>
	<!-- ./wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/jquery/jquery.min.js"></script>
	<!-- jQuery UI 1.11.4 -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/jquery-ui/jquery-ui.min.js"></script>
	<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
	<script>
		$.widget.bridge('uibutton', $.ui.button)
	</script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- ChartJS -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/chart.js/Chart.min.js"></script>
	<!-- Sparkline -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/sparklines/sparkline.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/jqvmap/jquery.vmap.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
	<!-- jQuery Knob Chart -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/jquery-knob/jquery.knob.min.js"></script>
	<!-- daterangepicker -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/moment/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/daterangepicker/daterangepicker.js"></script>
	<!-- Tempusdominus Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
	<!-- Summernote -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/summernote/summernote-bs4.min.js"></script>
	<!-- overlayScrollbars -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/dist/js/adminlte.js"></script>
	<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/dist/js/pages/dashboard.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script
		src="${pageContext.request.contextPath }/resources/admin/dist/js/demo.js"></script>
</body>
</html>
