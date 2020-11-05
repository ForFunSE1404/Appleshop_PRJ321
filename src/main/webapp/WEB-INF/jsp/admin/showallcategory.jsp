<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="${pageContext.request.contextPath}/assets/vendor/fonts/circular-std/style.css"
	rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/libs/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/material-design-iconic-font/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/vendor/fonts/flag-icon-css/flag-icon.min.css">
<title>Apple Shop</title>
</head>
<div class="dashboard-main-wrapper">

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="leftslidebar.jsp"></jsp:include>
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="page-header">
						<h2 class="pageheader-title">Data Category</h2>
						<p class="pageheader-text">Proin placerat ante duiullam
							scelerisque a velit ac porta, fusce sit amet vestibulum mi. Morbi
							lobortis pulvinar quam.</p>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/"
										class="breadcrumb-link">Apple Shop</a></li>
									<li class="breadcrumb-item"><a href="/admin"
										class="breadcrumb-link">Management</a></li>	
									<li class="breadcrumb-item active" aria-current="page">Data Category</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- basic table  -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">
						<h5 class="card-header">Data Category Table</h5>
						<div class="card-body">
							<div class="table-responsive">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-12 col-md-10">
										</div>
										<div class="col-sm-12 col-md-2">
													<a href="http://localhost:8080/admin/addcategory" class="btn btn-success">Add New</a>
											</div>
										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-sm-12">
											<table
												class="table table-striped table-bordered first dataTable"
												id="DataTables_Table_0" role="grid"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 90x;">Category ID</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Position: activate to sort column ascending"
															style="width: 90x;">Category Name</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 80px;">Edit</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 80px;">Delete</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listcategory}" var="category">
														<tr role="row" class="odd">
															<td>${category.categoryId }</td>
															<td>${category.categoryName }</td>
															<td><a href="editcategory?categoryId=${category.categoryId }" class="btn btn-primary">Edit</a></td>
															<td><a
																href="delcategory?categoryId=${category.categoryId }"
																class="btn btn-danger">Delete</a></td>

														</tr>
													</c:forEach>

												</tbody>

											</table>
										</div>
									</div>
									<div class="row">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                                                    <li class="page-item active"><a class="page-link " href="#">2</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                                                </ul>
                                            </nav>
									</div>
								</div>
								</div>
							</div>
						</div>
					</div>
					<!-- ============================================================== -->
					<!-- end basic table  -->
					<!-- ============================================================== -->
				</div>

			</div>
			<!-- ============================================================== -->
			<!-- footer -->
			<!-- ============================================================== -->
			<div class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							Copyright © 2018 Concept. All rights reserved. Dashboard by <a
								href="https://colorlib.com/wp/">Colorlib</a>.
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
							<div class="text-md-right footer-links d-none d-sm-block">
								<a href="javascript: void(0);">About</a> <a
									href="javascript: void(0);">Support</a> <a
									href="javascript: void(0);">Contact Us</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- ============================================================== -->
			<!-- end footer -->
			<!-- ============================================================== -->
		</div>
	<script src="${pageContext.request.contextPath}/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<!-- bootstap bundle js -->
	<script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
	<!-- slimscroll js -->
	<script src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
	<!-- main js -->
	<script src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
	</body>
</html>