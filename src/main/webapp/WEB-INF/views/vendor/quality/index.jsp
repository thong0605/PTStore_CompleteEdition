<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<section class="content-header">
	<div class="mx-5">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>Star</h1>
			</div>
			<div class="col-sm-6">
				<ol class="breadcrumb float-sm-right">
					<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath }/vendor/quality">Home</a></li>
					<li class="breadcrumb-item active">Evaluate</li>
				</ol>
			</div>
		</div>
	</div>
</section>
<section class="content mx-5">
	<div class="row my-2">
		<div class="col-10">
			<div class="row">
				<div class="col-4 px-0">
					<form name="f1" method="post" action="${pageContext.request.contextPath }/vendor/quality/searchbyproductid"  onsubmit="return validate()">
						<input type="text" name="productid" placeholder="By ID Product" class="btn btn-outline-secondary" value="${productId }" required>
						<input type="submit" value="Search" class="btn btn-dark">
					</form>
				</div>
				<div class="col-4 px-0">
					
				</div>
			</div>
		</div>
		<div class="col-2 px-0">

		</div>
	</div>

	<div>
		<jsp:useBean id="pagedListHolder" scope="request"
			type="org.springframework.beans.support.PagedListHolder" />
		<c:url value="/vendor/quality" var="pagedLink">
			<c:param name="page" value="~" />
		</c:url>
		
		<table class="table table-hover">
			<thead class="thead-light">
				<tr style="text-align: center">
					<th>Symbol</th>
					<th>Product</th>
					<th>1 Star</th>
					<th>2 Star</th>
					<th>3 Star</th>
					<th>4 Star</th>
					<th>5 Star</th>
					<th>General(1 - 5)</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="r" items="${pagedListHolder.pageList }">
				<tr style="text-align: center">
					<td class="item-record"><img src="${pageContext.request.contextPath}/upload/vendor/product/${r.product.photo }"
						alt="${r.product.photo }" width="50" height="50" /></td>
					<td class="item-record">${r.product.name } (ID: ${r.product.id })</td>
					<td class="item-record">${r.star1 }</td>
					<td class="item-record">${r.star2 }</td>
					<td class="item-record">${r.star3 }</td>
					<td class="item-record">${r.star4 }</td>
					<td class="item-record">${r.star5 }</td>	
					<td class="item-record">
						<fmt:formatNumber type="number" maxIntegerDigits="1" maxFractionDigits="1"
						value="${(r.star1 + r.star2 * 2 + r.star3 * 3 + r.star4 * 4 + r.star5 * 5)
							/ (r.star1+r.star2+r.star3+r.star4+r.star5) }" />
					</td>	
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<tg:paging pagedListHolder="${pagedListHolder}"
			pagedLink="${pagedLink}" />
	</div>
	<div class="row my-3">
		<div class="col-md-6" style="color:pupil;">
			<p><b>Note : </b></p>
			<ul type="disc">
				<li> <b>1 - 2 : Low quality</b></li>
				<li> <b>3 : Medium</b></li>
				<li> <b>4 : Pretty good</b></li>
				<li> <b>5 : Great</b></li>
			</ul>		
		</div>
		<div class="col-md-6">	
		</div>
	</div>
</section>

<script type="text/javascript">
    
	function validate(){  
		var productid=document.f1.productid.value;       		  
		if(isNaN(productid)){  
			alert("product id not valid");  
			return false;    
		} else if(productid == "") {  
			alert("input must be filled out");  
			return false;  
		}  
	}  

     
</script>
