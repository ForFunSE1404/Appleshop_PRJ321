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
<link rel="stylesheet" href="styles.css" />

<title>Phone Shop</title>
</head>

<body>
	<!-- Header -->

	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<!-- Main -->
	<main id="main">
		<div class="container">
			<!-- Products Details -->
			<section class="section product-details__section">
				<div class="product-detail__container">
					<div class="product-detail__left">
						<div class="details__container--left">
							<div class="product__pictures">
								<c:set var="i" value="1" />
								<c:forEach items="${product.images}" var="images">
									<div class="pictures__container">
										<img class="picture" src="${images.imgUrl}"
											id="pic<c:out value="${i }"/>" />
									</div>
									<c:set var="i" value="${i+1}" />

								</c:forEach>

							</div>
							<div class="product__picture" id="product__picture">
								<!-- <div class="rect" id="rect"></div> -->
								<div class="picture__container">
									<img src="${product.thumbnail}" id="pic" />
								</div>
							</div>
							<div class="zoom" id="zoom"></div>
						</div>

						<div class="product-details__btn">
							<a class="add" href="#"> <span> <svg>
                    <use xlink:href="./images/sprite.svg#icon-cart-plus"></use>
                  </svg>
							</span> ADD TO CART
							</a> <a class="buy" href="#"> <span> <svg>
                    <use xlink:href="./images/sprite.svg#icon-heart-o"></use>
                  </svg>
							</span> ADD TO WISH LIST
							</a>
						</div>
					</div>

					<div class="product-detail__right">
						<div class="product-detail__content">

							<h3>${product.productName}</h3>
							<div class="price">
								<span class="new__price">${product.price}</span>
							</div>
							<div class="product__review">
								<div class="rating">
									<svg>
                    <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                  </svg>
									<svg>
                    <use
											xlink:href="./images/sprite.svg#icon-star-empty"></use>
                  </svg>
								</div>
								<a href="#" class="rating__quatity">3 reviews</a>
							</div>
							<p>${product.description}</p>
							<div class="product__info-container">
								<ul class="product__info">
									<li class="select">
										<div class="select__option">
											<label for="colors">Color</label> <select name="colors"
												id="colors" class="select-box">
												<c:forEach items="${product.productColors}" var="pColor">
													<option value="${pColor.color.colorName}">${pColor.color.colorName}</option>
												</c:forEach>

											</select>
										</div>
									</li>
									<li>

										<div class="input-counter">
											<span>Quantity:</span>
											<div>
												<span class="minus-btn"> <svg> <use
															xlink:href="./images/sprite.svg#icon-minus"></use> </svg>
												</span> <input type="text" min="1" value="1" max="10"
													class="counter-btn"> <span class="plus-btn">
													<svg>
                            <use
															xlink:href="./images/sprite.svg#icon-plus"></use>
                          </svg>
												</span>
											</div>
										</div>
									</li>
									<li><span>Product Category:</span> <a
										href="/category?catId=${product.category.categoryId}">${product.category.categoryName}</a></li>
									<li><span>Availability:</span> <a href="#"
										class="in-stock">In Stock (7 Items)</a></li>
								</ul>
								<div class="product-info__btn">
									<a href="#"> <span> <svg>
                        <use xlink:href="./images/sprite.svg#icon-crop"></use>
                      </svg>
									</span>&nbsp; SIZE GUIDE
									</a> <a href="#"> <span> <svg>
                        <use xlink:href="./images/sprite.svg#icon-truck"></use>
                      </svg>
									</span>&nbsp; SHIPPING
									</a> <a href="#"> <span> <svg>
                        <use
													xlink:href="./images/sprite.svg#icon-envelope-o"></use>
                      </svg>&nbsp;
									</span> ASK ABOUT THIS PRODUCT
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="product-detail__bottom">
					<div class="title__container tabs">

						<div class="section__titles category__titles ">
							<div class="section__title detail-btn active"
								data-id="description">
								<span class="dot"></span>
								<h1 class="primary__title">Description</h1>
							</div>
						</div>

						<div class="section__titles">
							<div class="section__title detail-btn" data-id="reviews">
								<span class="dot"></span>
								<h1 class="primary__title">Reviews</h1>
							</div>
						</div>

						<div class="section__titles">
							<div class="section__title detail-btn" data-id="shipping">
								<span class="dot"></span>
								<h1 class="primary__title">Shipping Details</h1>
							</div>
						</div>
					</div>

					<div class="detail__content">
						<div class="content active" id="description">
							<p>${product.description}</p>
							<h2>Sample Unordered List</h2>
							<ul>
								<li>Comodous in tempor ullamcorper miaculis</li>
								<li>Pellentesque vitae neque mollis urna mattis laoreet.</li>
								<li>Divamus sit amet purus justo.</li>
								<li>Proin molestie egestas orci ac suscipit risus posuere
									loremous</li>
							</ul>
							<h2>Sample Ordered Lista</h2>
							<ol>
								<li>Comodous in tempor ullamcorper miaculis</li>
								<li>Pellentesque vitae neque mollis urna mattis laoreet.</li>
								<li>Divamus sit amet purus justo.</li>
								<li>Proin molestie egestas orci ac suscipit risus posuere
									loremous</li>
							</ol>
							<h2>Sample Paragraph Text</h2>
							<p>Praesent vestibulum congue tellus at fringilla. Curabitur
								vitae semper sem, eu convallis est. Cras felis nunc commodo eu
								convallis vitae interdum non nisl. Maecenas ac est sit amet
								augue pharetra convallis nec danos dui. Cras suscipit quam et
								turpis eleifend vitae malesuada magna congue. Damus id
								ullamcorper neque. Sed vitae mi a mi pretium aliquet ac sed
								elit. Pellentesque nulla eros accumsan quis justo at tincidunt
								lobortis denimes loremous. Suspendisse vestibulum lectus in
								lectus volutpat, ut dapibus purus pulvinar. Vestibulum sit amet
								auctor ipsum.</p>
						</div>
						<div class="content" id="reviews">
							<h1>Customer Reviews</h1>
							<div class="rating">
								<svg>
                  <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                </svg>
								<svg>
                  <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                </svg>
								<svg>
                  <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                </svg>
								<svg>
                  <use xlink:href="./images/sprite.svg#icon-star-full"></use>
                </svg>
								<svg>
                  <use xlink:href="./images/sprite.svg#icon-star-empty"></use>
                </svg>
							</div>
						</div>
						<div class="content" id="shipping">
							<h3>Returns Policy</h3>
							<p>You may return most new, unopened items within 30 days of
								delivery for a full refund. We'll also pay the return shipping
								costs if the return is a result of our error (you received an
								incorrect or defective item, etc.).</p>
							<p>You should expect to receive your refund within four weeks
								of giving your package to the return shipper, however, in many
								cases you will receive a refund more quickly. This time period
								includes the transit time for us to receive your return from the
								shipper (5 to 10 business days), the time it takes us to process
								your return once we receive it (3 to 5 business days), and the
								time it takes your bank to process our refund request (5 to 10
								business days).</p>
							<p>If you need to return an item, simply login to your
								account, view the order using the 'Complete Orders' link under
								the My Account menu and click the Return Item(s) button. We'll
								notify you via e-mail of your refund once we've received and
								processed the returned item.</p>
							<h3>Shipping</h3>
							<p>We can ship to virtually any address in the world. Note
								that there are restrictions on some products, and some products
								cannot be shipped to international destinations.</p>
							<p>When you place an order, we will estimate shipping and
								delivery dates for you based on the availability of your items
								and the shipping options you choose. Depending on the shipping
								provider you choose, shipping date estimates may appear on the
								shipping quotes page.</p>
							<p>Please also note that the shipping rates for many items we
								sell are weight-based. The weight of any such item can be found
								on its detail page. To reflect the policies of the shipping
								companies we use, all weights will be rounded up to the next
								full pound.</p>
						</div>
					</div>
				</div>
			</section>
			<!-- Lates Product -->
			<jsp:include page="latestproduct.jsp"></jsp:include>
		</div>
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

	<!-- Animate On Scroll -->
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

	<!-- Custom JavaScript -->
	<!-- Custom JavaScript -->
	<script src="./js/products.js"></script>
	<script src="./js/index.js"></script>
	<script src="./js/slider.js"></script>
	<!-- End Main -->
</body>

</html>