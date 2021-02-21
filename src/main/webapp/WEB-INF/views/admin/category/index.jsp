<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>

<!-- Content Wrapper. Contains page content -->

<jsp:useBean id="pagedListHolder" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/admincategory" var="pagedLinkcategory">
	<c:param name="p" value="~" />
</c:url>

<jsp:useBean id="pagedListHolderBrand" scope="request"
	type="org.springframework.beans.support.PagedListHolder" />
<c:url value="/admincategory" var="pagedLinkbrand">
	<c:param name="c" value="~" />
</c:url>

<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Category</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Category</li>
					</ol>

				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<section class="content">

		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<s:form method="post" modelAttribute="category"
						action="${pageContext.request.contextPath }/admincategory/add">
						<div class="card">
							<div class="card-header">
								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 350px;">
										<s:input path="name"
											class="form-control float-right" placeholder="Add Category" />
										<div class="input-group-append">
											<input type="submit" class="btn btn-default" value="Add">
										</div>
									</div>
					</s:form>
				</div>
				<form method="post"
					action="${pageContext.request.contextPath }/admincategory/searchcategory">
					<div class="input-group input-group-sm" style="width: 150px;">
						<input type="text" name="keyword" value="${keyword}"
							class="form-control float-right" placeholder="Search Category">

						<div class="input-group-append">
							<button type="submit" class="btn btn-default">
								<i class="fas fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th width="5px">#</th>
							<th>Name Category</th>
							<th>Action</th>
						</tr>
					</thead>
					<c:forEach var="c" items="${pagedListHolder.pageList}">
						<tbody>
							<tr>
								<td width="5px">${c.id}</td>
								<td>${c.name}</td>
								<td><a onclick="return confirm('Are you sure?')"
									href="${pageContext.request.contextPath }/admincategory/delete/${c.id }"><i
										class="fas fa-trash-alt"></i></a> | <a
									href="${pageContext.request.contextPath }/admincategory/edit/${c.id }"><i
										class="fas fa-edit"></i></a></td>

							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<!-- /.card-body -->
			<div class="card-footer clearfix">

				<ul class="pagination pagination-sm m-0 float-right">
					<tg:paging pagedListHolder="${pagedListHolder}"
						pagedLink="${pagedLinkcategory}" />
				</ul>
			</div>
		</div>
		<!-- /.card -->
</div>



</div>
<div class="container-fluid">
	<div class="row mb-2">
		<div class="col-sm-6">
			<h1>Brand</h1>
		</div>
		<div class="col-sm-6"></div>
	</div>
</div>
<section class="content">
	<div class="row">
		<div class="col-12">
			<form method="get"
				action="${pageContext.request.contextPath }/admincategory/addbrand">
				<div class="card">
					<div class="card-header">
						<div class="card-tools">
							<div class="input-group input-group-sm">
								<div class="input-group-append">
									<input type="submit" class="btn btn-default" value="Add Brand">
								</div>
							</div>
			</form>
		</div>
		<form method="post"
			action="${pageContext.request.contextPath }/admincategory/searchbrand">
			<div class="input-group input-group-sm" style="width: 150px;">
				<input type="text" name="keyword" value="${keyword2}"
					class="form-control float-right" placeholder="Search Brand">

				<div class="input-group-append">
					<button type="submit" class="btn btn-default">
						<i class="fas fa-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<!-- /.card-header -->
	<div class="card-body">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th width="5px">#</th>
					<th>Name Brand</th>
					<th>Photo</th>
					<th>Action</th>
				</tr>
			</thead>

			<c:forEach var="brand" items="${pagedListHolderBrand.pageList }">

				<tbody>
					<tr>
						<td width="5px">${brand.id }</td>
						<td>${brand.name }</td>
						<td><img src="${pageContext.request.contextPath }/upload/admin/brand/${brand.logo }"
							height="50" width="50"></td>
						<td><a onclick="return confirm('Are you sure?')"
							href="${pageContext.request.contextPath }/admincategory/deletebrand/${brand.id }"><i
								class="fas fa-trash-alt"></i></a> | <a
							href="${pageContext.request.contextPath }/admincategory/editbrand/${brand.id }"><i
								class="fas fa-edit"></i></a></td>

					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
	<!-- /.card-body -->
	<div class="card-footer clearfix">
		<ul class="pagination pagination-sm m-0 float-right">
					<tg:paging pagedListHolder="${pagedListHolderBrand}"
						pagedLink="${pagedLinkbrand}" />
		</ul>
	</div>
	</div>
	</form>
	<!-- /.card -->
	</div>
	</div>
	<!-- /.row -->
</section>
<!-- /.row -->

<!-- /.content-wrapper -->