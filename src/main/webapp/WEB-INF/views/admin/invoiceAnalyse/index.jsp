<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<div class="content-wrapper">
	<div class="col-12">
		<div class="card">
			<div class="card-header">
				<h3 class="card-title">Invoice Analyse</h3>
				<div class="card-tools">
					<form method="post" action="/adminaccount/searchproduct">
						<div class="input-group input-group-sm" style="width: 150px;">
							<input type="text" name="keyword" value=""
								class="form-control float-right" placeholder="Search Product">

							<div class="input-group-append">
								<button type="submit" class="btn btn-default">
									<i class="fas fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- /.card-header -->
			<div class="card-body">
				<div id="example2_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6"></div>
						<div class="col-sm-12 col-md-6"></div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table id="example2"
								class="table table-bordered table-hover dataTable dtr-inline"
								role="grid" aria-describedby="example2_info">
								<thead>
									<tr role="row">
										<th class="sorting_asc" tabindex="0" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Rendering engine: activate to sort column descending">ID</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="Browser: activate to sort column ascending">Order Date</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="Platform(s): activate to sort column ascending">Address</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="Engine version: activate to sort column ascending">Description</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">Phone</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">Status</th>
										<th class="sorting" tabindex="0" rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">Account Id</th>
										<th style="text-align: center" class="sorting" tabindex="0"
											rowspan="1" colspan="1"
											aria-label="CSS grade: activate to sort column ascending">Payment</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12 col-md-5">
							<div class="dataTables_info" id="example2_info" role="status"
								aria-live="polite">Pages:</div>








						</div>
					</div>
				</div>
			</div>
			<!-- /.card-body -->
		</div>
		<!-- /.card -->


		<!-- /.card -->
	</div>
</div>