<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css2?family=Archivo:wght@400;700&display=swap" rel="stylesheet" />

	<link rel="shortcut icon" href="./images/favicon.ico" type="image/x-icon" />


	<!-- Carousel -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.core.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/css/glide.theme.min.css
">
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />

	<!-- Custom StyleSheet -->
	<link rel="stylesheet" href="styles.css" />

	<title>Apple Shop</title>
</head>

<body>
	<!-- Header -->
	<header id="header" class="header">
		<jsp:include page="navigation.jsp"></jsp:include>
		<jsp:include page="slider.jsp"></jsp:include>
	</header>
	<!-- End Header -->
	<!-- Main -->
	<main id="main">
		<div class="container">
			<!-- Collection -->
			<section id="collection" class="section collection">
        <div class="collection__container" data-aos="fade-up" data-aos-duration="1200">
          <div class="collection__box">
            <div class="img__container">
              <img class="collection_02" src="./images/collection_02.png" alt="">
            </div>
            <div class="collection__content">
              <div class="collection__data">
                <span>New Colors Introduced</span>
                <h1>IPAD</h1>
                <a href="/product">SHOPPING NOW</a>
              </div>
            </div>
          </div>
          <div class="collection__box">
            <div class="img__container">
              <img class="collection_01" src="./images/collection_01.png" alt="">
            </div>
            <div class="collection__content">
              <div class="collection__data">
                <span>Phone Device Presets</span>
                <h1>IPHONE</h1>
                <a href="/product">SHOPPING NOW</a>
              </div>
            </div>
          </div>
          </div>
      </section>
      <!-- Lates Product -->
		<jsp:include page="bestsell.jsp"></jsp:include>

			<!-- Facility Section -->
			<section class="facility__section section" id="facility">
				<div class="container">
					<div class="facility__contianer">
						<div class="facility__box">
							<div class="facility-img__container">
								<svg>
									<use xlink:href="./images/sprite.svg#icon-airplane"></use>
								</svg>
							</div>
							<p>FREE SHIPPING WORLD WIDE</p>
						</div>

						<div class="facility__box">
							<div class="facility-img__container">
								<svg>
									<use xlink:href="./images/sprite.svg#icon-credit-card-alt"></use>
								</svg>
							</div>
							<p>100% MONEY BACK GUARANTEE</p>
						</div>

						<div class="facility__box">
							<div class="facility-img__container">
								<svg>
									<use xlink:href="./images/sprite.svg#icon-credit-card"></use>
								</svg>
							</div>
							<p>MANY PAYMENT GATWAYS</p>
						</div>

						<div class="facility__box">
							<div class="facility-img__container">
								<svg>
									<use xlink:href="./images/sprite.svg#icon-headphones"></use>
								</svg>
							</div>
							<p>24/7 ONLINE SUPPORT</p>
						</div>
					</div>
				</div>
			</section>
		</div>

		<!-- Testimonial Section -->
		<!-- 		<section class="section testimonial" id="testimonial"> -->
		<!-- 			<div class="testimonial__container"> -->
		<!-- 				<div class="glide" id="glide_4"> -->
		<!-- 					<div class="glide__track" data-glide-el="track"> -->
		<!-- 						<ul class="glide__slides"> -->
		<!-- 							<li class="glide__slide"> -->
		<!-- 								<div class="testimonial__box"> -->
		<!-- 									<div class="client__image"> -->
		<!-- 										<img src="./images/profile1.jpg" alt="profile"> -->
		<!-- 									</div> -->
		<!-- 									<p>Lorem, ipsum dolor sit amet consectetur adipisicing -->
		<!-- 										elit. Recusandae fuga hic nesciunt tempore quibusdam -->
		<!-- 										consequatur eligendi unde officia ex quae.ipsum dolor sit amet -->
		<!-- 										consectetur adipisicing elit. Recusandae fuga hic nesciunt -->
		<!-- 										tempore quibusdam consequatur eligendi unde officia ex quae.</p> -->
		<!-- 									<div class="client__info"> -->
		<!-- 										<h3>John Smith</h3> -->
		<!-- 										<span>Founder at Apple</span> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</li> -->
		<!-- 							<li class="glide__slide"> -->
		<!-- 								<div class="testimonial__box"> -->
		<!-- 									<div class="client__image"> -->
		<!-- 										<img src="./images/profile2.jpg" alt="profile"> -->
		<!-- 									</div> -->
		<!-- 									<p>Lorem, ipsum dolor sit amet consectetur adipisicing -->
		<!-- 										elit. Recusandae fuga hic nesciunt tempore quibusdam -->
		<!-- 										consequatur eligendi unde officia ex quae.ipsum dolor sit amet -->
		<!-- 										consectetur adipisicing elit. Recusandae fuga hic nesciunt -->
		<!-- 										tempore quibusdam consequatur eligendi unde officia ex -->
		<!-- 										quae.adipisicing elit. Recusandae fuga hic nesciunt tempore -->
		<!-- 										quibusdam consequatur eligendi unde officia ex quae.</p> -->
		<!-- 									<div class="client__info"> -->
		<!-- 										<h3>John Smith</h3> -->
		<!-- 										<span>Founder at Apple</span> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</li> -->
		<!-- 							<li class="glide__slide"> -->
		<!-- 								<div class="testimonial__box"> -->
		<!-- 									<div class="client__image"> -->
		<!-- 										<img src="./images/profile3.jpg" alt="profile"> -->
		<!-- 									</div> -->
		<!-- 									<p>Lorem, ipsum dolor sit amet consectetur adipisicing -->
		<!-- 										elit. Recusandae fuga hic nesciunt tempore quibusdam -->
		<!-- 										consequatur eligendi unde officia ex quae.ipsum dolor sit amet -->
		<!-- 										consectetur adipisicing elit. Recusandae fuga hic nesciunt -->
		<!-- 										tempore quibusdam consequatur eligendi unde officia ex -->
		<!-- 										quae.adipisicing elit. Recusandae fuga hic nesciunt tempore -->
		<!-- 										quibusdam consequatur eligendi unde officia ex quae.</p> -->
		<!-- 									<div class="client__info"> -->
		<!-- 										<h3>John Smith</h3> -->
		<!-- 										<span>Founder at Apple</span> -->
		<!-- 									</div> -->
		<!-- 								</div> -->

		<!-- 							</li> -->
		<!-- 							<li class="glide__slide"> -->
		<!-- 								<div class="testimonial__box"> -->
		<!-- 									<div class="client__image"> -->
		<!-- 										<img src="./images/profile4.jpg" alt=""> -->
		<!-- 									</div> -->
		<!-- 									<p>Lorem, ipsum dolor sit amet consectetur adipisicing -->
		<!-- 										elit. Recusandae fuga hic nesciunt tempore quibusdam -->
		<!-- 										consequatur eligendi unde officia ex quae.adipisicing elit. -->
		<!-- 										Recusandae fuga hic nesciunt tempore quibusdam consequatur -->
		<!-- 										eligendi unde officia ex quae. hic nesciunt tempore quibusdam -->
		<!-- 										consequatur eligendi unde officia ex quae.</p> -->
		<!-- 									<div class="client__info"> -->
		<!-- 										<h3>John Smith</h3> -->
		<!-- 										<span>Founder at Apple</span> -->
		<!-- 									</div> -->
		<!-- 								</div> -->
		<!-- 							</li> -->
		<!-- 						</ul> -->
		<!-- 					</div> -->

		<!-- 					<div class="glide__bullets" data-glide-el="controls[nav]"> -->
		<!-- 						<button class="glide__bullet" data-glide-dir="=0"></button> -->
		<!-- 						<button class="glide__bullet" data-glide-dir="=1"></button> -->
		<!-- 						<button class="glide__bullet" data-glide-dir="=2"></button> -->
		<!-- 						<button class="glide__bullet" data-glide-dir="=3"></button> -->
		<!-- 					</div> -->
		<!-- 				</div> -->
		<!-- 			</div> -->
		<!-- 		</section> -->
	</main>
	<jsp:include page="footer.jsp"></jsp:include>
	<!-- Glide Carousel Script -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Glide.js/3.4.1/glide.min.js"></script>

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