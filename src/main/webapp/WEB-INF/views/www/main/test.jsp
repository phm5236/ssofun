<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ page import="java.util.List" %>
<%
  // Jackson ObjectMapper를 사용하여 Java 객체를 JSON 형태로 변환합니다.
  ObjectMapper objectMapper = new ObjectMapper();
  String jsonPctList = objectMapper.writeValueAsString(request.getAttribute("list"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<title>Insert title here</title>

<link href="../../resources/css/test.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productPage.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/productOrder.css" rel="stylesheet"
	type="text/css">
<link href="../../resources/css/cartPage.css" rel="stylesheet"
	type="text/css">
<style >
.desc-title{
	width: 300px;
	font-size: 30px;
}
.proudct-option{
	float: right;
	margin-top: 8px;
}
</style>
</head>
<body>

	<jsp:include page="../../include/fundingHeader.jsp" />

	<div class="category-head">
		<div class="search-header-content">
			<div class="category-box">
				<div class="category-btn">
					<i class="bi bi-list"></i> <a href="javascript:;">카테고리</a>
					<div class="categories">
						<ul class="shopping-menu-list">
							<c:forEach items="${pctlist}" var="category">
								<c:if test="${category.this_parent_id eq 0}">
									<li class="li-list" value="${category.product_category_type_id}">
										${category.name}
										<!-- Subcategories -->
										<div class="subcategories">
											<ul>
												<c:forEach items="${pctlist}" var="subcategory">
													<c:if test="${subcategory.this_parent_id eq category.product_category_type_id}">
														<li>${subcategory.name}
															<!-- Subsubcategories -->
															<div class="subsubcategories">
																<ul>
																	<c:forEach items="${pctlist}" var="subsubcategory">
																		<c:if test="${subsubcategory.this_parent_id eq subcategory.product_category_type_id}">
																			<li><a href="./categories?pct=${subsubcategory.product_category_type_id }">${subsubcategory.name}</a></li>
																		</c:if>
																	</c:forEach>
																</ul>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</ul>
										</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="banner-a">
			<img class="banner-img" src="../../resources/img/banner.jpg"> 
	</div>

	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col">


				<div class="row">
					<div class="col-ca">
					<span class="desc-title">최신상품</span>
						<div class="proudct-option">
							<button id="sortLowToHigh">낮은 가격순</button>
  							<button id="sortHighToLow">높은 가격순</button>
						</div>
					</div>
				</div>

				<!-- 여기서 반복문 -->
				<div class="row" id="productList">
					<c:forEach items="${list }" var="product">
						<div class="col-a Image " data-price="${product.price_sale}">
							<a class="baby-product-link"
								href="./productPage?id=${product.product_id }">
								<div class="row">
									<div class="col text-center">
										<img src="/ssofunUploadFiles/${product.thumbnail_name}"
											style="width: 280px; height: 280px;" class="img-rounded">
									</div>
								</div>
								<div class="row r1">
									<div class="row">
										<div class="col-name">
											<p style="font-size: 14px">${product.category_type_name }</p>
										</div>
									</div>
									<div class="row r2">
										<div class="col-ex">${product.product_name }</div>
									</div>
									<div class="row">
										<div class="col">
											<div class="row r3">
												<div class="col-mwon1">
													<span class="discount">${Math.floor((product.price - product.price_sale) / product.price * 100).intValue()}%</span>
													<b><fmt:formatNumber value="${product.price_sale }"
															pattern="#,###원" /></b>
															
													<del class="price"><fmt:formatNumber value="${product.price }"
															pattern="#,###원" />
													</del>
												</div>
												
											</div>
										</div>
										
									</div>
								</div>
								<div class="col-review">리뷰
									<c:forEach items="${Recount }" var="Recount">
										<c:if test="${product.product_id eq Recount.product_id }">
											${Recount.count }
										</c:if>
									</c:forEach>
								</div> <!-- <hr> -->
							</a>
						</div>
					</c:forEach>
				</div>


				<div class="row">
					<div class="col">
						<!-- 페이지네이션 부분 추가 -->
						<div class="pagination jOhOoP">
							<c:choose>
								<c:when test="${currentPage > 1}">
									<a href="?page=${currentPage - 1}" class="previous-button">이전</a>
								</c:when>
								<c:otherwise>
									<span class="previous-button">이전</span>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="1" end="${pageCount}" var="pageNum">
								<c:url value="mainPage" var="pageUrl">
									<c:param name="page" value="${pageNum}" />
								</c:url>
								<c:choose>
									<c:when test="${pageNum eq currentPage}">
										<span class="current-page">${pageNum}</span>
									</c:when>
									<c:otherwise>
										<a href="${pageUrl}" class="page-link">${pageNum}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${currentPage < pageCount}">
									<a href="?page=${currentPage + 1}" class="next-button">다음</a>
								</c:when>
								<c:otherwise>
									<span class="next-button">다음</span>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>

<div class="sort-buttons">
  <button id="sortLowToHigh">낮은 가격순</button>
  <button id="sortHighToLow">높은 가격순</button>
</div>
	<!-- 푸터 영역 -->
	<jsp:include page="../../include/fundingFooter.jsp" />

<script>
//카테고리
$(document).ready(function() {
		// Show/hide the categories on hover for both the category button and menu items
		$(".category-box").hover(function() {
			$(".categories").css("display", "block");
		}, function() {
			$(".categories").css("display", "none");
		});

		$(".shopping-menu-list li").hover(function() {
			$(this).find(".subcategories").css("display", "block");
		}, function() {
			$(this).find(".subcategories").css("display", "none");
		});

		$(".subcategories li").hover(function() {
			$(this).find(".subsubcategories").css("display", "block");
		}, function() {
			$(this).find(".subsubcategories").css("display", "none");
		});
	});
	
	
// 낮은 가격순으로 상품 목록을 정렬하는 함수
function sortByLowToHigh() {
  const productList = document.getElementById("productList");
  const products = Array.from(productList.children);

  products.sort((a, b) => {
    const priceA = parseFloat(a.getAttribute("data-price"));
    const priceB = parseFloat(b.getAttribute("data-price"));
    return priceA - priceB;
  });

  productList.innerHTML = ""; // 목록 비우기

  products.forEach((product) => {
    productList.appendChild(product);
  });
}

// 높은 가격순으로 상품 목록을 정렬하는 함수
function sortByHighToLow() {
  const productList = document.getElementById("productList");
  const products = Array.from(productList.children);

  products.sort((a, b) => {
    const priceA = parseFloat(a.getAttribute("data-price"));
    const priceB = parseFloat(b.getAttribute("data-price"));
    return priceB - priceA;
  });

  productList.innerHTML = ""; // 목록 비우기

  products.forEach((product) => {
    productList.appendChild(product);
  });
}

// 정렬 버튼에 이벤트 리스너 추가
document.getElementById("sortLowToHigh").addEventListener("click", sortByLowToHigh);
document.getElementById("sortHighToLow").addEventListener("click", sortByHighToLow);	
	
	
var subCategories = <%= jsonPctList %>;
console.log(subCategories)
</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
		crossorigin="anonymous"></script>
</body>
</html>