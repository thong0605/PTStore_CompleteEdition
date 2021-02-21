<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1>Brand</h1>
				</div>
				<div class="col-sm-6"></div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<s:form method="post" modelAttribute="brand"
						action="${pageContext.request.contextPath }/admincategory/addbrand">
						<div class="card">
							<div class="card-header">
								<div class="card-tools">
									<div class="input-group input-group-sm" style="width: 350px;">
										<s:input path="name" class="form-control float-right"
											placeholder="Add Brand" />

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
				<s:form method="post" modelAttribute="brand"
					action="${pageContext.request.contextPath }/admincategory/editbrand"
					enctype="multipart/form-data">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th style="width: 10px">#</th>
								<th>Name Brand</th>
								<th>Logo</th>
								<th>Action</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${brand.id}</td>
								<td>
									<div class="input-group input-group-sm" style="width: 150px;">
										<s:input path="name" class="form-control float-right" />
									</div> <s:hidden path="id" />
								</td>
								<td><input type="text" name="logo" hidden=""
									value="${brand.logo }"> <input type="file" name="file"></td>
								<td>
									<div class="input-group-append">
										<input type="submit" class="btn btn-default" value="Save">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</s:form>
			</div>
			<!-- /.card-body -->
		</div>
		<a href="${pageContext.request.contextPath }/admincategory/cancel">--->
			Cancel <--</a>
		<!-- /.card -->
</div>




<!-- /.row -->

<!-- /.row -->
</div>
<!-- /.container-fluid -->
</section>

</div>
<!-- /.content-wrapper -->