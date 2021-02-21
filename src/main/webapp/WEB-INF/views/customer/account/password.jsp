<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- forget password -->
<c:if test="${forgetpassword == true }">
	<h3>FORGET YOUR PASSWORD?</h3>
	<hr class="soft">

	<div class="row">
		<div class="span9" style="min-height: 900px">
			<c:if test="${error != null }">
				<div class="alert alert-block alert-error fade in">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>Error: </strong> ${error }
				</div>
			</c:if>
			<c:if test="${success != null }">
				<div class="alert alert-block alert-success fade in">
					<button type="button" class="close" data-dismiss="alert">×</button>
					<strong>Notice: </strong> ${success }
				</div>
			</c:if>
			<div class="well">
				<h5>Reset your password</h5>
				<br> Please enter the email address for your account. A
				verification code will be sent to you. Once you have received the
				verification code, you will be able to choose a new password for
				your account.<br> <br> <br>
				<form name="myForm"
					action="${pageContext.request.contextPath }/customer/forgetpassword"
					onsubmit="return validateForm()" method="post">
					<div class="control-group">
						<label class="control-label" for="inputEmail1">E-mail
							address</label>
						<div class="controls">
							<input class="span3" type="email" id="inputEmail1" name="email"
								placeholder="example@gmail.com">
						</div>
					</div>
					<div class="controls">
						<button type="submit" class="btn block">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>
function validateForm() {
  var x = document.forms["myForm"]["email"].value;
  if (x == "") {
    alert("Input your email !");
    return false;
  }
}
</script>
</c:if>

<!-- reset password -->
<c:if test="${resetpassword == true }">
	<h3>Reset PASSWORD?</h3>
	<hr class="soft">

	<div class="row">
		<div class="span9" style="min-height: 900px">
			<div class="well">
				<h5>Reset your password</h5>
				<form
					action="${pageContext.request.contextPath }/customer/resetpassword"
					onsubmit="return matchPassword()" method="post">
					<div class="control-group">
						<label class="control-label" for="newpassword">New
							Password</label>
						<div class="controls">
							<input class="span3" type="password" id="newpassword"
								name="newpassword" placeholder="123456789"> <span
								id="message" style="color: red"> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="repassword">Re-type new
							Password</label>
						<div class="controls">
							<input class="span3" type="password" id="repassword"
								name="repassword" placeholder="987456321"> <span
								id="message" style="color: red"> </span>
						</div>
					</div>
					<div class="controls">
						<button type="submit" class="btn block">Submit</button>
					</div>
					<div class="controls">
						<button type="reset" class="btn block">Reset</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>  
function matchPassword() {  
  var pw = document.getElementById("newpassword").value;  
  var pw2 = document.getElementById("repassword").value;  
  //check empty password field  
  if(pw == "") {  
     document.getElementById("message").innerHTML = "**Fill the password please!";  
     return false;  
  }  
   if(pw2 == "") {  
     document.getElementById("message").innerHTML = "**Fill the retype password please!";  
     return false;  
  }  
 //minimum password length validation  
  if(pw.length < 8) {  
     document.getElementById("message").innerHTML = "**Password length must be atleast 8 characters";  
     return false;  
  }  
  
//maximum length of password validation  
  if(pw.length > 15) {  
     document.getElementById("message").innerHTML = "**Password length must not exceed 15 characters";  
     return false;  
  } else {  
     alert("Password is correct");  
  }  
}  
//confirmpassword  
  if(pw != pw2)  
  {   
    alert("Passwords did not match");  
  } else {  
    alert("Password match");  
  }  
</script>
</c:if>

<!-- change password -->
<c:if test="${changepassword == true }">
	<h3>CHANGE PASSWORD</h3>
	<hr class="soft">

	<div class="row">
		<div class="span9" style="min-height: 900px">
			<div class="well">
				<h5>Change your password</h5>
				<c:if test="${wrongpassword != null }">
					<div class="alert alert-block alert-error fade in">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<strong>Alert: </strong> ${wrongpassword }
					</div>
				</c:if>
				<form
					action="${pageContext.request.contextPath }/customer/changepassword"
					onsubmit="return matchPassword()" method="post">
					<div class="control-group">
						<label class="control-label" for="newpassword">Old
							Password</label>
						<div class="controls">
							<input class="span3" type="password" id="oldpassword"
								name="oldpassword" placeholder="123456789"> <span
								id="message" style="color: red"> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="newpassword">New
							Password</label>
						<div class="controls">
							<input class="span3" type="password" id="newpassword"
								name="newpassword" placeholder="123456789"> <span
								id="message" style="color: red"> </span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="repassword">Re-type new
							Password</label>
						<div class="controls">
							<input class="span3" type="password" id="repassword"
								name="repassword" placeholder="987456321"> <span
								id="message" style="color: red"> </span>
						</div>
					</div>
					<div class="controls">
						<button type="submit" class="btn block">Submit</button>
					</div>
					<div class="controls">
						<button type="reset" class="btn block">Reset</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<script>  
function matchPassword() {  
  var pw = document.getElementById("newpassword").value;  
  var pw2 = document.getElementById("repassword").value;  
  //check empty password field  
  if(pw == "") {  
     document.getElementById("message").innerHTML = "**Fill the password please!";  
     return false;  
  }  
   if(pw2 == "") {  
     document.getElementById("message").innerHTML = "**Fill the retype password please!";  
     return false;  
  }  
 //minimum password length validation  
  if(pw.length < 8) {  
     document.getElementById("message").innerHTML = "**Password length must be atleast 8 characters";  
     return false;  
  }  
  
//maximum length of password validation  
  if(pw.length > 15) {  
     document.getElementById("message").innerHTML = "**Password length must not exceed 15 characters";  
     return false;  
  } else {  
     alert("Password is correct");  
  }  
//confirmpassword  
  if(pw != pw2)  
  {   
    alert("Passwords did not match");  
  } else {  
    alert("Password match");  
  } 
}  
</script>
</c:if>