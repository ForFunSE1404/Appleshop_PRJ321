<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap"
	rel="stylesheet" />

<link rel="shortcut icon" href="./images/favicon.ico"
	type="image/x-icon" />


<!-- Carousel -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css
">
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

<!-- Custom StyleSheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/styles.css" />

<title>Apple Shop</title>

<title>Apple Shop</title>
</head>
<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<br>
	<h2 style="text-align: center; font-size: 40px;">HISTORY BILLING</h2>
	<main id="main">
		<div class="small-container cart-page">
			<c:if test="${listLength != 0}">
				<table>
					<tr>
						<th>#ID</th>
						<th>Date buy</th>
						<th>Total Price</th>
						<th>Status</th>
						<th></th>
					</tr>
					<c:set var="total" scope="session" value="0"></c:set>
					<c:forEach items="${listCart}" var="item">
						<tr>
							<td>
								<p style="text-align: center;">${item.cartId}</p>
							</td>
							<td>
								<p style="text-align: center;">${item.createDate}</p>
							</td>
							<td>
								<p style="text-align: center;">${item.totalprice}$</p>
							</td>
							<c:if test="${item.status == false}">
								<td>
									<p style="color: navy; text-align: center;">Unconfirmed</p>
								</td>
							</c:if>
							<c:if test="${item.status == true}">
								<td>
									<p style="color: green; text-align: center;">Confirmed</p>
								</td>
							</c:if>
							<td><a href="cartdetails?cartID=${item.cartId}"
								style="font-size: 15px;">View details</a></td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${listLength == 0}">
						<p style="text-align: center; font-size: 30px; color: red;">${userName}
							has not bought anything</p>
					</c:if>
				</table>
		</div>
		<div class="center">
			<div class="pagination">
				<a href="historybilling?page=${param.page - 1}">&laquo;</a>
				<c:forEach begin="0" end="${numpage}" var="i">
					<c:if test="${ param.page == null}">
						<c:if test="${ i == 0}">
							<a class="active" href="historybilling?page=${i}">${i}</a>
						</c:if>
						<c:if test="${ i != 0}">
							<a href="historybilling?page=${i}">${i}</a>
						</c:if>
					</c:if>
					<c:if test="${ param.page != null}">
						<c:if test="${i == param.page}">
							<a class="active" href="historybilling?page=${i}">${i}</a>
						</c:if>
						<c:if test="${i != param.page}">
							<a href="historybilling?page=${i}">${i}</a>
						</c:if>
					</c:if>
				</c:forEach>
				<a href="historybilling?page=${param.page + 1}">&raquo;</a>
			</div>
		</div>
		<br>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Custom JavaScript -->
	<script src="${pageContext.request.contextPath}/js/index.js"></script>
	<script src="${pageContext.request.contextPath}/js/slider.js"></script>
	<script src="assets/vendor/jquery/jquery-3.3.1.min.js"></script>
	<script>
		
	</script>
	<!-- End Main -->
</body>
</html>