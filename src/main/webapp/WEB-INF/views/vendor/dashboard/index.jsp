<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

<div class="container-fluid mt-2">
	<div class="content-header">
		<div class="container-fluid">
			<div class="row mb-2">
				<div class="col-sm-6">
					<h1 class="m-0 text-dark">Dashboard</h1>
				</div>
				<div class="col-sm-6">
					<ol class="breadcrumb float-sm-right">
						<li class="breadcrumb-item"><a href="#">Home</a></li>
						<li class="breadcrumb-item active">Dashboard</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<section class="content">
		<div class="container-fluid">
			<div class="row">
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box">
						<span class="info-box-icon bg-info elevation-1"><i
							class="fas fa-shopping-cart"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Products sold</span> 
								<span
								class="info-box-number">Day: ${qDay }</span>							
								<span
								class="info-box-number">Month: ${qMonth }</span>
								<span
								class="info-box-number">Year: ${qYear }</span>
							
						</div>
					</div>
				</div>
				
				<div class="clearfix hidden-md-up"></div>
		
				<div class="col-12 col-sm-6 col-md-3">
					<div class="info-box mb-3">
						<span class="info-box-icon bg-warning elevation-1"><i
							class="fas fa-users"></i></span>
						<div class="info-box-content">
							<span class="info-box-text">Total order</span> <span
								class="info-box-number">Day: ${orderDay }</span>							
								<span
								class="info-box-number">Month: ${orderMonth }</span>
								<span
								class="info-box-number">Year: ${orderYear }</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-6">
					<canvas id="linechart10"></canvas>
				</div>
			</div>
			<div class="row">
				<div class="col-3 col-md-6">
					<canvas id="barchart10"></canvas>
				</div>
			</div>
		</div>
	</section>
</div>

<script type="text/javascript">
	var x = [0, ${orderYear2 }, ${orderYear } ];
	var y = [0, ${y2 },  ${y }];
	var CHART = document.getElementById('linechart10').getContext('2d');
	var line_chart = new Chart(CHART,{
		type: 'line',
		data: {
			labels: y, 
			datasets:[{
				label: 'Total order every year',
				backgroundColor: "#8bf1d3",
				data: x
			}]
		}
	});

	var x2 = [0, ${qYear2 }, ${qYear } ];
	var y2 = [0, ${y2 },  ${y }];
	var CHART2 = document.getElementById('barchart10').getContext('2d');
	var bar_chart = new Chart(CHART2, {
		type: 'bar',
		data: {
			labels: y2, 
			datasets:[{
				label: 'Total Product Sold Quantity',
				backgroundColor: "#4ae8ba",
				data: x2
			}]
		}
	});

	/*var barChartData = {
            labels: [<c:forEach var="item" items="${listReceipt}">'${item.time}',</c:forEach>],
            datasets: [
                {
                    fillColor: "#FC8213",
                    data: [<c:forEach var="item" items="${listReceipt}">${item.value},</c:forEach>]
                }
            ]

        };
        new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);*/
</script>

