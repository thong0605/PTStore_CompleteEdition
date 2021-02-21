<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">


	<div class="container-fluid">
		<div class="row mb-2">
			<div class="col-sm-6">
				<h1>Add Brand</h1>
			</div>
			<div class="col-sm-6"></div>
		</div>
	</div>
	<section class="content">
		<div class="row">
			<div class="col-12"></div>
		</div>
		<!-- /.card-header -->
		<div class="card-body" style="background-color: white;">
			<s:form method="post" modelAttribute="brand"
				action="${pageContext.request.contextPath }/admincategory/addbrand"
				enctype="multipart/form-data">
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>Name Brand</th>
							<th>Photo</th>
							<th>Action</th>
						</tr>
						<tr>
							<td>
							<s:input path="name" />
							<br>
							<a>${failed }</a>
							</td>
							<td>
							<input type="file" name="file">
							</td>
							<td>
								<div class="input-group-append">
									<input type="submit" class="btn btn-default" value="Save">
								</div>
							</td>
						</tr>

					</thead>
				</table>
			</s:form>
		</div>
</div>
<!-- /.card -->
<!-- /.row -->
</section>
<!-- /.row -->

<!-- /.content-wrapper -->