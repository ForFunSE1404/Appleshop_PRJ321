<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<link rel="stylesheet" href="styles.css" />

</head>
<body>
	 <div class="navigation">
      <div class="containerx">
        <nav class="nav">
          <div class="nav__hamburger">
            <svg>
              <use xlink:href="./images/sprite.svg#icon-menu"></use>
            </svg>
          </div>

          <div class="nav__logo">
            <a href="/" class="scroll-link">
              Apple Shop
            </a>
          </div>

          <div class="nav__menu">
            <div class="menu__top">
              <span class="nav__category">Apple Shop</span>
              <a href="/" class="close__toggle">
                <svg>
                  <use xlink:href="./images/sprite.svg#icon-cross"></use>
                </svg>
              </a>
            </div>
            <ul class="nav__list">
              <li class="nav__item">
                <a href="/" class="nav__link scroll-link">Home</a>
              </li>
              <li class="nav__item">
                <a href="/product" class="nav__link scroll-link">Product</a>
              </li>
              <li class="nav__item">
                <a href="#header" class="nav__link scroll-link">Wish List</a>
              </li>
              <c:if test="${pageContext[\"request\"].userPrincipal.principal == null}">
	              <li class="nav__item">
                	<a href="/login" class="nav__link scroll-link">Login</a>
              </li>
              </c:if>
              <c:if test="${sessionScope.isAdmin}" >
	              <li class="nav__item">
	                <a href="/admin" class="nav__link scroll-link">Admin</a>
	              </li>
	              </c:if>
              <c:if test="${pageContext[\"request\"].userPrincipal.principal != null}">
	              <li class="nav__item">
	                <a href="/inforuser" class="nav__link scroll-link">${sessionScope.account.fullname }</a>
	              </li>
	              <li class="nav__item">
	                <a href="/logout" class="nav__link scroll-link">Logout</a>
	              </li>
              </c:if>
            </ul>
          </div>

          <div class="nav__icons">
            <a href="/inforuser" class="icon__item">
              <svg class="icon__user">
                <use xlink:href="./images/sprite.svg#icon-user"></use>
              </svg>
            </a>
            <a href="cart" class="icon__item">
              <svg class="icon__cart">
                <use xlink:href="./images/sprite.svg#icon-shopping-basket"></use>
              </svg>
              <span id="cart__total">${sessionScope.totalquantity}</span>
            </a>
          </div>
        </nav>
      </div>
    </div>
</body>
</html>