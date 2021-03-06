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
<title>Add Category</title>
</head>
<div class="dashboard-main-wrapper">
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="leftslidebar.jsp"></jsp:include>
	<div class="dashboard-wrapper">
		<div class="container-fluid  dashboard-content">
			<!-- ============================================================== -->
			<!-- pageheader -->
			<!-- ============================================================== -->
			<c:if test="${category == null }">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Add Category</h2>
						</div>
					</div>
				</div>
			</c:if>
			<c:if test="${category != null }">
				<div class="row">
					<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
						<div class="page-header">
							<h2 class="pageheader-title">Update Category</h2>
						</div>
					</div>
				</div>
			</c:if>
			<!-- ============================================================== -->
			<!-- end pageheader -->
			<!-- ============================================================== -->
			<div class="row">
				<!-- ============================================================== -->
				<!-- valifation types -->
				<!-- ============================================================== -->
				<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
					<div class="card">

						<h5 class="card-header">Input Category</h5>
						<div class="card-body">
							<c:if test="${category == null }">
								<form id="validationform" data-parsley-validate="" novalidate=""
									method="POST">
									<p style="color: red; text-align: center;">${err}</p>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category
											ID</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input
												data-parsley-required-message="Please insert Category Code"
												data-parsley-pattern-message="Product Code In Format [CXXXX] X isdigit"
												type="text" required="" data-parsley-pattern="[C]\d{4}"
												placeholder="" class="form-control" name="txtCategoryIdAdd">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category
											Name</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" class="form-control"
												"
                                                data-parsley-required-message="Please insert Category Name"
												name="txtCategoryNameAdd">
										</div>
									</div>
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
											<button type="submit" value="AddCategory"
												class="btn btn-space btn-primary">Add Category</button>
										</div>
									</div>
								</form>
							</c:if>
							<c:if test="${category != null }">
								<form id="validationform" action="editcategory"
									data-parsley-validate="" novalidate="" method="POST">
									<p style="color: red; text-align: center;">${err}</p>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category
											ID</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input
												data-parsley-required-message="Please insert Category Code"
												data-parsley-pattern-message="Product Code In Format [CXXXX] X isdigit"
												type="text" required="" data-parsley-pattern="[C]\d{4}"
												placeholder="" class="form-control"
												value="${category.categoryId }" readonly
												name="txtCategoryIdAdd">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-12 col-sm-3 col-form-label text-sm-right">Category
											Name</label>
										<div class="col-12 col-sm-8 col-lg-6">
											<input type="text" required="" class="form-control"
												value="${category.categoryName }"
												data-parsley-required-message="Please insert Category Name"
												name="txtCategoryNameAdd">
										</div>
									</div>
									<div class="form-group row text-right">
										<div class="col col-sm-10 col-lg-9 offset-sm-1 offset-lg-0">
											<button type="submit" value="AddCategory"
												class="btn btn-space btn-primary">Update Category</button>
										</div>
									</div>
								</form>
							</c:if>
						</div>
					</div>
				</div>
				<!-- ============================================================== -->
				<!-- end valifation types -->
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
<script
	src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/vendor/parsley/parsley.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/libs/js/main-js.js"></script>
<script>
	$('#form').parsley();
</script>
<script>
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict';
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						event.preventDefault();
						event.stopPropagation();
					}
					form.classList.add('was-validated');
				}, false);
			});
		}, false);
	})();
</script>
</body>

</html>