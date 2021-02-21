<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Vendor | Log in</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/vendor/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/vendor/css/ACE.css" rel="stylesheet" />
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a
				href=""><b>Vendor</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign in to start your session</p>
				<p class="login-box-msg" style="color:red;font-size:20px">${msg }</p>
				<form name="f1" method="post" action="${pageContext.request.contextPath}/vendor/processLogin" onsubmit="return validate()">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Username" name="username" value="hongson123" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<input type="password" class="form-control" placeholder="Password" name="password" value="son123" required>
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-8">
							<div class="icheck-primary">
								<input type="checkbox" id="remember"> <label
									for="remember"> Remember Me </label>
							</div>
						</div>
						<div class="col-4">
							<button type="submit" class="btn btn-primary btn-block btn-login">Sign
								In</button>
						</div>
					</div>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> 
				</form>



				<p class="mb-1">
					<a href="forgot-password.html">I forgot my password</a>
				</p>
				<p class="mb-0">
					<a href="${pageContext.request.contextPath}/vendor/register" class="text-center">Register a new
						membership</a>
				</p>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/plugins/jquery/jquery.min.js"></script>
	<!-- Bootstrap 4 -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- AdminLTE App -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/dist/js/adminlte.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/js/sweetalert2@9.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/js/ACE.js"></script>
	<script type="text/javascript">
    
		function validate(){  
			var username=document.f1.username.value;   
			var pw=document.f1.password.value;
		   		  
			if(username == "" || pw == ""){  
				alert("input must be filled out");  
				return false;    
			} else if(username == null || pw == null) {
				alert("input must be filled out");  
				return false;  
			} 
		}  

     
	</script>
</body>

</html>

