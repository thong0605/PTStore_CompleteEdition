<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h3>There are ${countVendors } for result: "${keyword }"</h3>
<hr class="soft">

<c:forEach var="v" items="${vendors}">
	<div class="span9">
		<img
			src="${pageContext.request.contextPath}/upload/vendor/account/${v.photo}"
			alt="${v.photo}">
		<h5>${v.fullname }</h5>
		<br>
		<p>Contact: ${v.phone }</p>
		<p>Address: ${v.address }</p>
	</div>
	<div class="span3">
		<a class="btn"
			href="${pageContext.request.contextPath }/product/listByVendor/${v.fullname}">Go
			to shop</a>
	</div>
	<br>
	<hr class="soft">
</c:forEach>