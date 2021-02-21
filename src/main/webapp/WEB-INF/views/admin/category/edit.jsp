<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!-- EDIT CATEGORY -->
<html>
<head>
<script>
	
</script>
</head>

<!-- Content Wrapper. Contains page content -->
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
										<s:input path="name" class="form-control float-right"
											placeholder="Add Category" />

										<div class="input-group-append">
											<input type="submit" class="btn btn-default" value="Add">
										</div>
									</div>
					</s:form>
				</div>
				<h3 class="card-title">Category</h3>


			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<s:form method="post" modelAttribute="category"
					action="${pageContext.request.contextPath }/admincategory/edit">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 10px">#</th>
								<th>Name Category</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${category.id}</td>
								<td>
									<div class="input-group input-group-sm" style="width: 150px;">
										<s:input path="name" class="form-control float-right" />

										<div class="input-group-append">
											<input type="submit" class="btn btn-default" value="Save">
										</div>
									</div> <a>${failed }</a>
								</td>
								<s:hidden path="id" />
								<td><a onclick="return confirm('Are you sure?')"
									href="${pageContext.request.contextPath }/admincategory/delete/${category.id }"><i
										class="fas fa-trash-alt"></i></a>
							</tr>
						</tbody>
					</table>
				</s:form>
			</div>
		</div>
		<a href="${pageContext.request.contextPath }/admincategory/cancel">---> Cancel <--</a>
		<!-- /.card -->
</div>




<!-- /.row -->

<!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>

</div>
</html>
<!-- /.content-wrapper -->