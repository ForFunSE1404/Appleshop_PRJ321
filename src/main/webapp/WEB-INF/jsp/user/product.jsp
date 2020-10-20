<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="styles.css" />

<title>Phone Shop</title>
</head>
<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<main id="main">
		<div class="container">
			<section class="category__section section" id="category">
				<div class="tab__list">
					<div class="title__container tabs">
						<div class="section__titles category__titles ">
							<div class="section__title filter-btn active"
								data-id="All Products">
								<span class="dot"></span>
								<h1 class="primary__title">All Products</h1>
							</div>
						</div>
						<div class="section__titles">
							<div class="section__title filter-btn"
								data-id="Trending Products">
								<span class="dot"></span>
								<h1 class="primary__title">Trending Products</h1>
							</div>
						</div>

						<div class="section__titles">
							<div class="section__title filter-btn" data-id="Special Products">
								<span class="dot"></span>
								<h1 class="primary__title">Special Products</h1>
							</div>
						</div>

						<div class="section__titles">
							<div class="section__title filter-btn"
								data-id="Featured Products">
								<span class="dot"></span>
								<h1 class="primary__title">Featured Products</h1>
							</div>
						</div>

					</div>
				</div>
				<div class="category__container aos-init"
					>
					<div class="category__center">
						<div class="product category__products">
							<div class="product__header">
								<img src="./images/products/iphone/iphone3.jpeg" alt="product">
							</div>
							<div class="product__footer">
								<h3>Apple iPhone 11</h3>
								<div class="rating">
									<svg>
                          <use
											xlink:href="./images/sprite.svg#icon-star-full"></use>
                        </svg>
									<svg>
                          <use
											xlink:href="./images/sprite.svg#icon-star-full"></use>
                        </svg>
									<svg>
                          <use
											xlink:href="./images/sprite.svg#icon-star-full"></use>
                        </svg>
									<svg>
                          <use
											xlink:href="./images/sprite.svg#icon-star-full"></use>
                        </svg>
									<svg>
                          <use
											xlink:href="./images/sprite.svg#icon-star-empty"></use>
                        </svg>
								</div>
								<div class="product__price">
									<h4>$760</h4>
								</div>
								<a href="#"><button type="submit" class="product__btn">Add
										To Cart</button></a>
							</div>
							<ul>
								<li><a data-tip="Quick View" data-place="left" href="#">
										<svg>
                            <use
												xlink:href="./images/sprite.svg#icon-eye"></use>
                          </svg>
								</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="center">
				<div class="pagination">
					<a href="#">&laquo;</a> <a href="#">1</a> <a class="active"
						href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a>
					<a href="#">6</a> <a href="#">&raquo;</a>
				</div>
				</div>
				
			</section>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Custom JavaScript -->
	<script src="./js/products.js"></script>
	<script src="./js/index.js"></script>
	<script src="./js/slider.js"></script>
	<!-- End Main -->
</body>
</html>