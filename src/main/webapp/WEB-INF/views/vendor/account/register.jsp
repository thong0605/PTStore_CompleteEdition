<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
   <%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %> 
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Vendor | Sign Up</title>
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

</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a
				href=""><b>Sign up</b></a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Sign up to join my team</p>
				<p class="login-box-msg" style="color: red">
				${msg }
				</p>
				<s:form name="f1" modelAttribute="vendor" action="${pageContext.request.contextPath }/vendor/register"
					method="post" onsubmit="return validate()">
					<div class="input-group mb-3">
						<s:input type="text" path="fullname" class="form-control" placeholder="Full Name" name="ipFullname"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-signature"></span>
							</div>
						</div>
						
					</div><s:errors path="fullname" style="color:red;"></s:errors>
					<div class="input-group mb-3">
						<s:input type="text" path="username" class="form-control" placeholder="Username" name="ipUsername"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div><s:errors path="username" style="color:red;"></s:errors>
					<div class="input-group mb-3">
						<s:input type="password" path="password" class="form-control" placeholder="Password" name="ipPw"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div><s:errors path="password" style="color:red;"></s:errors>
	
					<div class="input-group mb-3">
						<s:input type="email" path="email" class="form-control" placeholder="Gmail" name="ipGmail"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-mail-bulk"></span>
							</div>
						</div>
					</div><s:errors path="email" style="color:red;"></s:errors>
					
					<div class="input-group mb-3">
						<s:input type="text" path="phone" class="form-control" placeholder="Phone" name="ipPhone"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-phone"></span>
							</div>
						</div>
					</div><s:errors path="phone" style="color:red;"></s:errors>
					<div class="input-group mb-3">
						<s:input type="text" path="address" class="form-control" placeholder="Address" name="ipAddress"
							/>
							
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-map-marker"></span>
							</div>
						</div>
					</div><s:errors path="address" style="color:red;"></s:errors>
					
					<div class="input-group mb-3">
						<div class="icheck-primary">
								<s:checkbox path="activated" id="agree" checked="checked" /> <label
									for="agree"> I agree with terms and policies</label>
						</div>
					</div>
					<div class="row">
						<div class="col-4"></div>
						<div class="col-4">
							<input type="submit" class="btn btn-primary btn-block btn-login" value="Sign Up">
						</div>
						<div class="col-4"></div>
					</div>
					
				</s:form>



				<p class="mb-1">
					<a href="${pageContext.request.contextPath}/vendor/login">Sign In</a>
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
	<script type="text/javascript">
		
	    function validate(){  
			var username=document.f1.ipUsername.value; 
			var usernameRgex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$/;  //new RegExp()
			var pw=document.f1.ipPw.value; 
			var pwRgex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{8,}$/;
			var email=document.f1.ipGmail.value; 
			var emailRgex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-] + @ [a-zA-Z0-9 -] + (?: \. [ a-zA-Z0-9 -] +) * $ /;
			 
			var phone=document.f1.ipPhone.value; 
			var address=document.f1.ipAddress.value; 			
    		  
			if(username == "" || pw == "" || email == "" || phone == "" || address == "") {  
				alert("Input must be filled out");  
				return false;  
			} else if(username == null || pw == null || email == null || phone == null || address == null) {  
				alert("Input must be filled out");  
				return false;  	  
			} else if(usernameRgex.test(username)) {  
				alert("Please enter a valid username");  
				return false;  
			} else if(pwRgex.test(pw)) {  
				alert("Please enter a valid password");  
				return false;  
			} else if(emailRgex.test(email)) {  
				alert("Please enter a valid email");  
				return false;  	  
			} else if(phone.length <10) {  
				alert("Phone must be at least 10 characters long.");  
				return false;  
			}

		}  
		
	</script>
</body>
</html>