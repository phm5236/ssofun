<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link href="../../resources/css/head.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/main.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productPage.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productOrder.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light bg-light c1">
					<div class="container-fluid">
						<a class="navbar-brand" href="#">LOGO</a>
						<button class="navbar-toggler" type="button"
							data-bs-toggle="collapse"
							data-bs-target="#navbarSupportedContent"
							aria-controls="navbarSupportedContent" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarSupportedContent">
							<ul class="navbar-nav me-auto mb-2 mb-lg-0">
								<li class="nav-item"><a class="nav-link" href="#">펀딩</a></li>
								<li class="nav-item"><a class="nav-link" href="./mainPage">스토어</a>
								</li>
							</ul>

							<c:if test="${empty sessionUser }">
								<ul class="nav justify-content-end">
									<li class="nav-item"><a class="nav-link"
										href="./loginPage">로그인</a></li>
									<li class="nav-item"><a class="nav-link" href="#">고객센터</a>
									</li>
								</ul>
							</c:if>
							<c:if test="${!empty sessionUser }">
								<ul class="nav justify-content-end">
									<li class="nav-item"><a class="nav-link" href="#">${sessionUser.nickname }</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="./logoutProcess">로그아웃</a></li>
									<li class="nav-item"><a class="nav-link"
										href="./cartPage?id=${sessionUser.user_id	 }">장바구니</a></li>
									<li class="nav-item"><a class="nav-link" href="#">고객센터</a>
									</li>
								</ul>
							</c:if>

						</div>
					</div>
				</nav>
			</div>
			<div class="col"></div>
		</div>
	</div>
	
	<div class="renewal-header">
		<div class="search-header">
			<div class="category-btn">
				<i class="bi bi-list"></i> <span class="category-title">카테고리</span>
				<div class="category-layer">
					<ul class="menu shopping-menu-list">
						<li class="fashion-sundries"><a href="javascript:;"
							style="cursor: default;">패션의류 </a>
							<div class="depth">
								<div class="depth-list">
									<ul class="second-depth-list">
										<li>남성패션</li>
									</ul>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>