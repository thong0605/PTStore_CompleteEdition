<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<h3>Login</h3>
<hr class="soft">

<!-- Alert logout -->
<c:if test="${logout != null }">
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Announce: </strong> ${logout }
	</div>
</c:if>
<c:if test="${changepassword != null }">
	<div class="alert alert-success fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Announce: </strong> ${changepassword }
	</div>
</c:if>
<!-- <div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>-->
<c:if test="${error != null }">
	<div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Error: </strong> ${error }
	</div>
</c:if>

<c:if test="${notlogin != null }">
	<div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Announce: </strong> ${notlogin }
	</div>
</c:if>
<c:if test="${notexists != null }">
	<div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Announce: </strong> ${notexists }
	</div>
</c:if>

<table class="table table-bordered">
	<tbody>
		<tr>
			<th>LOGIN FORM</th>
		</tr>
		<tr>
			<td>
				<form class="form-horizontal" method="post"
					action="${pageContext.request.contextPath }/customer/processLogin">
					<div class="control-group">
						<label class="control-label" for="inputUsername">Username</label>
						<div class="controls">
							<input type="text" name="username" id="inputUsername" style="height:auto;"
								placeholder="Username" required>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label" for="inputPassword1">Password</label>
						<div class="controls">
							<input type="password" name="password" id="inputPassword1" style="height:auto;"
								placeholder="Password" required>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<button type="submit" class="btn">Sign in</button>
							OR <a
								href="${pageContext.request.contextPath }/customer/register"
								class="btn">Register Now!</a>
						</div>
					</div>
					<div class="control-group">
						<div class="controls">
							<a
								href="${pageContext.request.contextPath }/customer/forgetpassword"
								style="text-decoration: underline">Forgot password ?</a>
						</div>
					</div>
				</form>
			</td>
		</tr>
	</tbody>
</table>