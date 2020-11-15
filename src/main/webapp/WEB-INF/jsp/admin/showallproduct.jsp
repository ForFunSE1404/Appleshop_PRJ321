<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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
						<h2 class="pageheader-title">Data Product</h2>
						<div class="page-breadcrumb">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="/"
										class="breadcrumb-link">Apple Shop</a></li>
									<li class="breadcrumb-item"><a href="/admin"
										class="breadcrumb-link">Management</a></li>
									<li class="breadcrumb-item active" aria-current="page">Data
										Product</li>
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
						<h5 class="card-header">Data Product Table</h5>
						<div class="card-body">
							<div class="table-responsive" style="overflow-x: hidden;">
								<div id="DataTables_Table_0_wrapper"
									class="dataTables_wrapper dt-bootstrap4">
									<div class="row">

										<div class="col-sm-10 col-md-10">
											<div id="DataTables_Table_0_filter" class="dataTables_filter">
												<form action="products" method="GET">
													<label><input type="text"
														class="form-control form-control-sm" placeholder=""
														aria-controls="DataTables_Table_0" name="keySearch"></label>
													<button type="submit" class="btn btn-brand">Search</button>
												</form>

											</div>

										</div>
										<div class="col-sm-2 col-md-2">
											<a href="addproduct" class="btn btn-success">Add New</a>

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
															colspan="1" aria-sort="ascending" style="width: 50px;">ID</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 60px;">Category</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 210px;">Product Name</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 150px;">Update Date</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 60px;">Price</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 70px;">Quantity</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 80px;">Thumbnail</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 150px;">Description</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 50px;">Visibility</th>
														<th class="sorting" tabindex="0"
															aria-controls="DataTables_Table_0" rowspan="1"
															colspan="1" style="width: 80px;">Edit</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${listproduct}" var="product">
														<tr role="row" class="odd">
															<td class="sorting_1">${product.productId}</td>
															<td>${product.category.categoryId }</td>
															<td>${product.productName }</td>
															<td>${product.updateDate }</td>
															<td>$${product.price }</td>
															<td>${product.quantity }</td>
															<td><img style="width: 70px; height: 100px;"
																src="${pageContext.request.contextPath}/${product.thumbnail}" /></td>
															<td class="description">${product.description }</td>
															<td><c:if test="${product.visibility}">
																	<input type="checkbox" class="disable" checked
																		name="name1" />&nbsp;
															</c:if> <c:if test="${product.visibility == false}">
																	<input type="checkbox" class="disable" name="name1" />&nbsp;
															</c:if></td>
															<td><a
																href="${pageContext.request.contextPath}/admin/editproduct?productId=${product.productId }"
																class="btn btn-primary"><i class="fas fa-edit"></i></a></td>
														</tr>
													</c:forEach>

												</tbody>

											</table>
										</div>
									</div>
									<br>
									<!-- 				get param của url -->
									<c:set var="paramUrl"
										value="${pageContext.request.queryString}" />
									<!-- 				nếu param có chứa page= thì xóa nó đi -->
									<c:if test="${fn:contains(paramUrl, 'page=')}">
										<c:set var="page" value="&page=${param.page}" />
										<c:set var="paramUrl"
											value="${fn:replace(paramUrl, page , '')}" />
									</c:if>
									<div class="row">
										<nav aria-label="Page navigation example"
											style="padding-left: 20px;">
											<ul class="pagination">
												<c:if test="${param.page == 1 }">
													<li class="page-item disabled"><a class="page-link"
														href="products?${paramUrl}&page=${param.page - 1}">Previous</a></li>
												</c:if>
												<c:if test="${param.page != 1 }">
													<li class="page-item"><a class="page-link"
														href="products?${paramUrl}&page=${param.page - 1}">Previous</a></li>
												</c:if>
												<c:forEach begin="1" end="${numpage}" var="i">
													<c:if test="${ param.page == null}">
														<c:if test="${ i == 1}">

															<li class="page-item active"><a class="page-link"
																href="products?${paramUrl}&page=${i}">${i}</a></li>
														</c:if>
														<c:if test="${ i != 1}">
															<li class="page-item"><a class="page-link"
																href="products?${paramUrl}&page=${i}">${i}</a></li>
														</c:if>
													</c:if>
													<c:if test="${ param.page != null}">
														<c:if test="${i == param.page}">
															<li class="page-item active"><a class="page-link"
																href="products?${paramUrl}&page=${i}">${i}</a></li>

														</c:if>
														<c:if test="${i != param.page}">
															<li class="page-item"><a class="page-link"
																href="products?${paramUrl}&page=${i}">${i}</a></li>

														</c:if>
													</c:if>
												</c:forEach>
												<c:if test="${param.page == null}">
													<li class="page-item"><a class="page-link"
														href="products?${paramUrl}&page=2">Next</a></li>
												</c:if>
												<c:if test="${param.page != null}">
													<c:if test="${param.page == (numpage  )}">
														<li class="page-item disabled"><a class="page-link"
															href="products?${paramUrl}&page=${param.page + 1}">Next</a></li>
													</c:if>

													<c:if test="${param.page != (numpage ) }">
														<li class="page-item"><a class="page-link"
															href="products?${paramUrl}&page=${param.page + 1}">Next</a></li>
													</c:if>
												</c:if>

											</ul>
										</nav>
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
<script>
	$(document).ready(function() {
		$(".description").each(function(item) {
			var text = $(this).text().substring(0, 30) + '...';
			console.log(text);
			$(this).text(text);
		});
	});
</script>
</body>
</html>