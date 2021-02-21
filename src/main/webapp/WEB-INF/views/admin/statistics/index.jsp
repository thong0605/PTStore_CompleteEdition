<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Statistics</h1>
				</div>
				<!-- /.col -->
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Statistics</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<section class="content">
		<div class="container-fluid">
			<!-- Small boxes (Stat box) -->
			<div class="row">
				<div class="col-lg-4 col-8">
					<!-- small box -->
					<div class="small-box bg-info">
						<div class="inner">
							<h3>${neworders }</h3>

							<p>New Orders</p>
						</div>
						<div class="icon">
							<i class="ion ion-bag"></i>
						</div>
						<a href="${pageContext.request.contextPath}/adminaccount/orders" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-4 col-8">
					<!-- small box -->
					<div class="small-box bg-success">
						<div class="inner">
							<h3>
								${newproducts }
							</h3>

							<p>New Products</p>
						</div>
						<div class="icon">
							<i class="fab fa-product-hunt"></i>
						</div>
						<a href="${pageContext.request.contextPath}/adminaccount/product" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
				<!-- ./col -->
				<div class="col-lg-4 col-8">
					<!-- small box -->
					<div class="small-box bg-warning">
						<div class="inner">
							<h3>${totalnewaccount }</h3>

							<p>User Registrations</p>
						</div>
						<div class="icon">
							<i class="ion ion-person-add"></i>
						</div>
						<a href="${pageContext.request.contextPath }/adminaccount" class="small-box-footer">More info <i
							class="fas fa-arrow-circle-right"></i></a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid -->
	</section>
</div>