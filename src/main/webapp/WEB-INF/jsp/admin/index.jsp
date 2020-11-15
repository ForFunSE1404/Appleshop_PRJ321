<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/charts/chartist-bundle/chartist.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/charts/c3charts/c3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>Apple Shop</title>
</head>
<div class="dashboard-main-wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="leftslidebar.jsp"></jsp:include>
	<div class="dashboard-wrapper">
		<div class="dashboard-ecommerce">
			<div class="container-fluid dashboard-content ">
				<div class="ecommerce-widget">
					<div class="row">
						<!-- ============================================================== -->
						<!-- sales  -->
						<!-- ============================================================== -->
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="card border-3 border-top border-top-primary">
								<div class="card-body">
									<h5 class="text-muted">Total Sales</h5>
									<div class="metric-value d-inline-block">
										<h1 class="mb-1" id="totalSale">$12099</h1>
									</div>
									
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end sales  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- new customer  -->
						<!-- ============================================================== -->
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="card border-3 border-top border-top-primary">
								<div class="card-body">
									<h5 class="text-muted">New Customer</h5>
									<div class="metric-value d-inline-block">
										<h1 class="mb-1">1245</h1>
									</div>
									
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end new customer  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- visitor  -->
						<!-- ============================================================== -->
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="card border-3 border-top border-top-primary">
								<div class="card-body">
									<h5 class="text-muted">Visitor</h5>
									<div class="metric-value d-inline-block">
										<h1 class="mb-1">13000</h1>
									</div>
									
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end visitor  -->
						<!-- ============================================================== -->
						<!-- ============================================================== -->
						<!-- total orders  -->
						<!-- ============================================================== -->
						<div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
							<div class="card border-3 border-top border-top-primary">
								<div class="card-body">
									<h5 class="text-muted">Total Orders</h5>
									<div class="metric-value d-inline-block">
										<h1 class="mb-1">1340</h1>
									</div>
								</div>
							</div>
						</div>
						<!-- ============================================================== -->
						<!-- end total orders  -->
						<!-- ============================================================== -->
					</div>
					<div class="row">
						<!-- product category  -->
						<!-- ============================================================== -->
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="card">
								<h5 class="card-header">Selling by months</h5>
								<div class="card-body">
									<canvas id="sellingbymonth"></canvas>
								</div>
							</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
							<div class="card">
								<h5 class="card-header">Product Category</h5>
								<div class="card-body">
									<canvas id="productcategorycount"></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script
	src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script
	src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
<!-- bootstap bundle js -->
<script
	src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<!-- slimscroll js -->
<script
	src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<!-- main js -->
<script
	src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/raphael.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/charts/morris-bundle/morris.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>

<!-- chart chartist js -->
<script
	src="${pageContext.request.contextPath}/assets/vendor/charts/charts-bundle/Chart.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/charts/charts-bundle/chartjs.js"></script>
<script src="${pageContext.request.contextPath}/js/drawchart.js"></script>
</body>

</html>