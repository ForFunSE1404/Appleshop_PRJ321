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
						<h2 class="pageheader-title">Show All Bills</h2>
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
									<li class="breadcrumb-item active" aria-current="page">Show
										All Bills</li>
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
						<h5 class="card-header">All Bills</h5>
						<div class="card-body">
							<div class="table-responsive">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">
										<div class="col-sm-10 col-md-10">
											<div id="DataTables_Table_0_filter" class="dataTables_filter">
												<form action="searchbills" method="GET">
													<label><input type="text"
														class="form-control form-control-sm" placeholder=""
														aria-controls="DataTables_Table_0" name="userId"></label>
													<button type="submit" class="btn btn-brand">Search</button>
												</form>
											</div>
										</div>
										<div class="col-sm-2 col-md-2">
											<a href="${pageContext.request.contextPath}/admin/bills" class="btn btn-success">List All Bills</a>

										</div>
									</div>
									<br>
									<div class="row">
										<div class="col-sm-12 col-md-12">
											<table
												class="table table-striped table-bordered first dataTable"
												id="DataTables_Table_0" role="grid"
												aria-describedby="DataTables_Table_0_info">
												<thead>
													<tr role="row">
														<th class="sorting_asc" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" aria-sort="ascending"
															aria-label="Name: activate to sort column descending"
															style="width: 50px;">#ID</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Office: activate to sort column ascending"
															style="width: 80px;">User ID</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 100px;">Full Name</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Age: activate to sort column ascending"
															style="width: 100px;">Phone Number</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Start date: activate to sort column ascending"
															style="width: 100px;">Create Date</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 70px;">Total Price</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 100px;">Status</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1"
															aria-label="Salary: activate to sort column ascending"
															style="width: 100px;"></th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listCart}" var="cart">
														<tr role="row" class="odd">
															<td>${cart.cartId}</td>
															<td>${cart.account.userId}</td>
															<td>${cart.account.fullname}</td>
															<td>${cart.account.infoUser.phone}</td>
															<td>${cart.createDate}</td>
															<td>${cart.totalprice}$</td>
															<c:if test="${cart.status == false}">
																<td>
																	<p
																		style="color: navy; font-size: 20px; text-align: center;">Unconfirmed</p>
																	<a
																	style="background-color: green; border: none; width: 100px; display: block; margin-left: auto; margin-right: auto;"
																	href="confirm?cartId=${cart.cartId}"
																	class="btn btn-primary">Confirm</a>
																</td>
															</c:if>
															<c:if test="${cart.status == true}">
																<td>
																	<p
																		style="color: green; font-size: 20px; text-align: center;">Confirmed</p>
																	<a
																	style="background-color: navy; border: none; width: 100px; display: block; margin-left: auto; margin-right: auto;"
																	href="unconfirm?cartId=${cart.cartId}"
																	class="btn btn-primary">Unconfirm</a>
																</td>
															</c:if>
															<td><a
																style="display: block; margin-left: auto; margin-right: auto;"
																href="viewcartdetail?cartId=${cart.cartId}&userId=${cart.account.userId}"
																class="btn btn-primary">Views Detail</a></td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<br>
									<div class="col-sm-12 col-md-12">
										<div class="row">
											<nav aria-label="Page navigation example"
												style="padding-left: 20px;">
												<ul class="pagination">
													<c:if test="${param.page == 0 }">
														<li class="page-item disabled"><a class="page-link"
															href="bills?page=${param.page - 1}">Previous</a></li>
													</c:if>
													<c:if test="${param.page != 0 }">
														<li class="page-item"><a class="page-link"
															href="bills?page=${param.page - 1}">Previous</a></li>
													</c:if>
													<c:forEach begin="0" end="${numpage}" var="i">
														<c:if test="${ param.page == null}">
															<c:if test="${ i == 0}">

																<li class="page-item active"><a class="page-link"
																	href="bills?page=${i}">${i}</a></li>
															</c:if>
															<c:if test="${ i != 0}">
																<li class="page-item"><a class="page-link"
																	href="bills?page=${i}">${i}</a></li>

															</c:if>
														</c:if>
														<c:if test="${ param.page != null}">
															<c:if test="${i == param.page}">
																<li class="page-item active"><a class="page-link"
																	href="bills?page=${i}">${i}</a></li>

															</c:if>
															<c:if test="${i != param.page}">
																<li class="page-item"><a class="page-link"
																	href="bills?page=${i}">${i}</a></li>

															</c:if>
														</c:if>
													</c:forEach>
													<c:if test="${param.page == (numpage  )}">
														<li class="page-item disabled"><a class="page-link"
															href="bills?page=${param.page + 1}">Next</a></li>
													</c:if>
													<c:if test="${param.page != (numpage ) }">
														<li class="page-item"><a class="page-link"
															href="bills?page=${param.page + 1}">Next</a></li>
													</c:if>

												</ul>
											</nav>
										</div>
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
</div>
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
	src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
</body>
</html>