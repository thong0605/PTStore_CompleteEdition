<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h3>Profile</h3>
<div class="well">
	<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>-->
	<c:if test="${error != null }">
		<div class="alert alert-block alert-error fade in">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<strong>Error: </strong> ${error }
		</div>
	</c:if>
	<s:form class="form-horizontal" method="post" modelAttribute="customer"
		action="${pageContext.request.contextPath }/customer/profile"
		enctype="multipart/form-data">
		<h4>Hi ${sessionScope.customer.username }, how are you today ?</h4>
		<div class="control-group">
			<div class="controls">
				<img
					src="${pageContext.request.contextPath }/upload/customer/${sessionScope.customer.photo}"
					alt="${sessionScope.customer.photo}"
					style="border: 1; width: 300px; height: 300px">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Sex <sup>*</sup></label>
			<div class="controls">
				<s:select path="gender" class="span1">
					<s:option value="1">Male</s:option>
					<s:option value="0">Female</s:option>
				</s:select>
				<s:errors path="gender"></s:errors>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputFname1">Fullname <sup>*</sup></label>
			<div class="controls">
				<s:input type="text" path="fullname" id="inputFname1" />
				<s:errors path="fullname"></s:errors>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="input_email">Email <sup>*</sup></label>
			<div class="controls">
				<s:input path="email" id="input_email" />
				<s:errors path="email"></s:errors>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<a href="${pageContext.request.contextPath }/customer/changepassword">Change password</a>
			</div>

		</div>
		<div class="control-group">
			<label class="control-label" for="birthday">Date of Birth <sup>*</sup></label>
			<div class="controls">
				<input type="text" name="birth" id="birthday"
					placeholder="${sessionScope.customer.birthday }" />
				<fmt:formatDate var="birthday"
					value="${sessionScope.customer.birthday }" pattern="MM/dd/yyyy" />
				<s:errors path="birthday"></s:errors>

				<!--
		
				 
					<select class="span1" name="months">
						<option value="">-</option>
						<option value="1">1&nbsp;&nbsp;</option>
						<option value="2">2&nbsp;&nbsp;</option>
						<option value="3">3&nbsp;&nbsp;</option>
						<option value="4">4&nbsp;&nbsp;</option>
						<option value="5">5&nbsp;&nbsp;</option>
						<option value="6">6&nbsp;&nbsp;</option>
						<option value="7">7&nbsp;&nbsp;</option>
					</select> <select class="span1" name="days">
						<option value="">-</option>
						<option value="1">1&nbsp;&nbsp;</option>
						<option value="2">2&nbsp;&nbsp;</option>
						<option value="3">3&nbsp;&nbsp;</option>
						<option value="4">4&nbsp;&nbsp;</option>
						<option value="5">5&nbsp;&nbsp;</option>
						<option value="6">6&nbsp;&nbsp;</option>
						<option value="7">7&nbsp;&nbsp;</option>
					</select> <select class="span1" name="years">
						<option value="">-</option>
						<option value="1">2000&nbsp;&nbsp;</option>
						<option value="2">2001&nbsp;&nbsp;</option>
					</select>-->
			</div>
		</div>



		<div class="control-group">
			<label class="control-label" for="mobile">Mobile Phone </label>
			<div class="controls">
				<s:input type="text" path="phone" name="mobile" id="mobile" />
				<s:errors path="phone"></s:errors>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="address">Address </label>
			<div class="controls">
				<s:input type="text" path="address" name="address" id="address"
					placeholder="0000-000-000" />
				<s:errors path="address"></s:errors>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Photo </label>
			<div class="controls">
				<input type="file" name="file">
			</div>
		</div>
		<p>
			<sup>*</sup>Required field
		</p>

		<div class="control-group">
			<div class="controls">
				<input type="hidden" name="email_create" value="1"> <input
					type="hidden" name="is_new_customer" value="1"> <input
					class="btn btn-large btn-success" type="submit" value="Update">
				<s:hidden path="id" />
				<s:hidden path="username" />
				<s:hidden path="password" />
				<s:hidden path="status" />
				<s:hidden path="activated" />
				<s:hidden path="photo" />
				<s:hidden path="created" />
				<s:hidden path="birthday" />
			</div>
		</div>
	</s:form>
	<a href="${pageContext.request.contextPath }/customer/delete"
		onclick="return confirm('Are you sure?')">Delete your account!</a>
</div>